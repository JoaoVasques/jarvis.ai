defmodule Resource.User do
  use Maru.Router
  alias UserApi.UserModel
  require Logger
  alias Interactors.CreateUserInteractor
  alias Interactors.FindUserInteractor
  alias Interactors.DeleteUserInteractor
  
  namespace :user do
    desc "get all users"
    get do
      users = Repo.all(UserModel)
      |> Poison.encode!
      |> JSON.decode! 
      json(conn, users)
    end

    desc "create new user"
    params do
      requires :name,               type: String
      requires :twitter_user_id,    type: String           
      requires :oauth_token,        type: String
      requires :oauth_token_secret, type: String
    end
    post do
      user = %UserModel{id: Ecto.UUID.generate,
                        name: params[:name],
                        twitter_user_id: params[:user_id],
                        oauth_token_secret: params[:oauth_token_secret],
                        oauth_token: params[:oauth_token]}

      case CreateUserInteractor.call(user) do
        {:ok, u} ->
          # TODO store api_token in Redis with a TTL
          api_token = Ecto.UUID.generate
          conn |>
            json(%{user_id: u.id, api_token: api_token})
        {:error, _} ->
          conn
          |> put_status(500)
          |> text("Error while inserting user")
      end
    end
    
    route_param :id do 
      desc "get user information" 
      get do
        case Ecto.UUID.cast(params[:id]) do
          {:ok, id} -> json(conn, FindUserInteractor.call(id) |> Poison.encode! |> JSON.decode!)
          {:error, _} ->
            conn
            |> put_status(400)
            |> text("badly formated ID")
        end
      end

      desc "deletes a user"
      delete do
        user = FindUserInteractor.call(params[:id])
        case DeleteUserInteractor.call user do
          {:ok, _} -> text(conn, "")
          {:error, changeset} ->
            #TODO log error
            conn
            |> put_status(500)
            |> text("Error while deleting user")
        end
      end
    end
  end
end


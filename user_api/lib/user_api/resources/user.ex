defmodule Resource.User do
  use Maru.Router
  alias UserApi.Repo
  alias UserApi.UserModel
  require Logger
  import Ecto.Query
  
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
      requires :first_name,    type: String
      requires :last_name,     type: String
      requires :oauth_token,   type: String
    end
    post do
      user = %UserModel{id: Ecto.UUID.generate,
                        first_name: params[:first_name],
                        last_name: params[:last_name],
                        oauth_token: params[:oauth_token]}

      case Repo.insert(user) do
        {:ok, u} -> 
          conn |> text(u.id)
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
          {:ok, id} -> json(conn, Repo.get_by(UserModel, id: id) |> Poison.encode! |> JSON.decode!)
          {:error, _} ->
            conn
            |> put_status(400)
            |> text("badly formated ID")
        end
      end

      desc "deletes a user"
      delete do
        user = Repo.get_by(UserModel, id: params[:id])
        case Repo.delete user do
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


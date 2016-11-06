defmodule Resource.User do
  use Maru.Router
  alias UserApi.Repo
  alias UserApi.UserModel
  require Logger
  import Ecto.Query
  
  namespace :user do
    desc "get all users"
    get do
      query = from user in UserModel, select: (%{ id: user.id, first_name: user.first_name, last_name: user.last_name })
      users = Repo.all(query) 
      |> List.wrap
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
        {:ok, u} -> conn |> text(u.id)
        {:error, _} ->
          conn
          |> put_status(500)
          |> text("Error while inserting user")
      end
    end
    
    route_param :id do 
      desc "get user information" 
      get do
        text(conn, "TODO")
      end
    end
  end
end


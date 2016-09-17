defmodule UserApi.Router do
  use UserApi.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", UserApi do
    pipe_through :api

    scope "/users" do
      resources "/", UserController, except: [:new, :edit] do
        resources "/integration", IntegrationController, except: [:new, :edit]

      end
    end
  end
end

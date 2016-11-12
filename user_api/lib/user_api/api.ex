defmodule UserApi.API do
  use Maru.Router

  version "v1"
  
  before do
    plug Plug.Logger
    plug Plug.Parsers,
      pass: ["*/*"],
      json_decoder: Poison,
      parsers: [:json]
  end

  mount Resource.User

  rescue_from :all do
    conn
    |> put_status(500)
    |> text("Server Error")
  end
end

defmodule UserApi.UserModel do
  use Ecto.Schema
  import Ecto.Query

  @derive {Poison.Encoder, only: [:id, :first_name, :last_name, :oauth_token]}
  @primary_key {:id, :binary_id, []}
  schema "users" do
    field :first_name
    field :last_name
    field :oauth_token
  end
end


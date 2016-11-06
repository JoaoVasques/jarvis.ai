defmodule UserApi.UserModel do
  use Ecto.Schema
  import Ecto.Query

  @primary_key {:id, :binary_id, []}
  schema "users" do
    field :first_name
    field :last_name
    field :oauth_token
  end
end


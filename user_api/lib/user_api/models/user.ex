defmodule UserApi.UserModel do
  use Ecto.Schema
  import Ecto.Query

  @derive {Poison.Encoder, only: [:id, :name, :twitter_user_id, :oauth_token_secret, :oauth_token]}
  @primary_key {:id, :binary_id, []}
  schema "users" do
    field :name
    field :twitter_user_id
    field :oauth_token_secret
    field :oauth_token
  end
end


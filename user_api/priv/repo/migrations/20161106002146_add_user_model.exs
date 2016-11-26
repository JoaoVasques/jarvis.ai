defmodule UserApi.Repo.Migrations.AddUserModel do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string
      add :twitter_user_id, :string
      add :oauth_token_secret, :string
      add :oauth_token, :string
    end
  end
end


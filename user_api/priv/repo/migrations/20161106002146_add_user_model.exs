defmodule UserApi.Repo.Migrations.AddUserModel do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :first_name, :string
      add :last_name, :string
      add :oauth_token, :string
    end
  end
end


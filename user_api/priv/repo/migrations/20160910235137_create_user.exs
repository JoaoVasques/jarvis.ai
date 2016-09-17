defmodule UserApi.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :first_name, :string
      add :last_name, :string
      add :email, :string
      add :age, :integer
      add :password, :string

      timestamps()
    end

  end
end

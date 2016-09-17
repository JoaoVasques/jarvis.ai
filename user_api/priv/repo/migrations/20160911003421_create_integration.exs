defmodule UserApi.Repo.Migrations.CreateIntegration do
  use Ecto.Migration

  def change do
    create table(:integrations) do
      add :unique_id, :string
      add :name, :string
      add :system, :string
      add :active, :boolean, default: false, null: false
      add :token, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end
    create index(:integrations, [:user_id, :unique_id])

  end
end

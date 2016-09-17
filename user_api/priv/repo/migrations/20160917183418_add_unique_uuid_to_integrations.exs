defmodule UserApi.Repo.Migrations.AddUniqueUuidToIntegrations do
  use Ecto.Migration

  def change do
    create unique_index(:integrations, [:unique_id])
  end
end

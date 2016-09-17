defmodule UserApi.Repo.Migrations.AddIntegrationIdToUsers do
  use Ecto.Migration

  def change do
    alter table (:users) do
      add :integration_id, references(:integrations)    
    end
  end
end

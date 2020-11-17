defmodule OauthExample.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :name, :string
      add :external_id, :uuid, null: false
      add :email, :string, primary_key: true
      add :username, :string

      timestamps()
    end

    create unique_index(:users, [:external_id])
  end
end

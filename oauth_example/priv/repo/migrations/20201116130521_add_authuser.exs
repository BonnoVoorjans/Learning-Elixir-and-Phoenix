defmodule OauthExample.Repo.Migrations.AddAuthuser do
  use Ecto.Migration

  def change do
    create table(:authusers, primary_key: false) do
      add :provider, :string
      add :token, :string
      add :email, references(:users, [column: :email, on_delete: :delete_all, type: :string]),
                         null: false, primary_key: true

      timestamps()
    end
  end
end

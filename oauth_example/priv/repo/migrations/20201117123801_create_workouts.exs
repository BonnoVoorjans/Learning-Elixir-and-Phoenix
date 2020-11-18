defmodule OauthExample.Repo.Migrations.CreateWorkouts do
  use Ecto.Migration

  def change do
    create table(:workouts) do
      add :title, :string
      add :duration, :integer
      add :difficulty, :string

      timestamps()
    end

  end
end

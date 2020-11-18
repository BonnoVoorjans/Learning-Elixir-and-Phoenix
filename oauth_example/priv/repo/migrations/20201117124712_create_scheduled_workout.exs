defmodule OauthExample.Repo.Migrations.CreateScheduledWorkout do
  use Ecto.Migration

  def change do
    create table(:workout_instances, primary_key: false) do
      add :planned_date, :utc_datetime, primary_key: true
      add :workout_id, references(:workouts, [on_delete: :delete_all]), 
          null: false, primary_key: true
      timestamps()
    end

  create unique_index(:workout_instances, [:planned_date, :workout_id])
  end
end

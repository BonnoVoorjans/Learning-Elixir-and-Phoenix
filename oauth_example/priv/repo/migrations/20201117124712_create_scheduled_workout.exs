defmodule OauthExample.Repo.Migrations.CreateScheduledWorkout do
  use Ecto.Migration

  def change do
    create table(:workout_instances) do
      add :planned_date, :utc_datetime
      add :workout_id, references(:workouts, [on_delete: :delete_all]), 
          null: false
      timestamps()
    end

  create unique_index(:workout_instances, [:planned_date, :workout_id])
  end
end

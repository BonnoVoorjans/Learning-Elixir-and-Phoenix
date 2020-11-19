defmodule OauthExample.Fitness.WorkoutInstance do
  use Ecto.Schema
  import Ecto.Changeset
  alias OauthExample.Fitness.Workout


  schema "workout_instances" do
    field :planned_date, :utc_datetime
    belongs_to :workout, Workout

    timestamps()
  end

  @doc false
  def changeset(workout, attrs) do
    workout
    |> cast(attrs, [:title, :duration, :difficulty])
    |> validate_required([:title, :duration, :difficulty])
    |> unique_constraint(:planned_date, :workout)
  end
end

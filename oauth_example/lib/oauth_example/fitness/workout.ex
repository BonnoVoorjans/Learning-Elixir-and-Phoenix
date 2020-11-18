defmodule OauthExample.Fitness.Workout do
  use Ecto.Schema
  import Ecto.Changeset
  alias OauthExample.Fitness.WorkoutInstance
  
  schema "workouts" do
    field :difficulty, :string
    field :duration, :integer
    field :title, :string
    has_many :workout_instances, WorkoutInstance

    timestamps()
  end

  @doc false
  def changeset(workout, attrs) do
    workout
    |> cast(attrs, [:title, :duration, :difficulty])
    |> validate_required([:title, :duration, :difficulty])
  end
end

defmodule OauthExample.Fitness.WorkoutInstance do
  use Ecto.Schema
  import Ecto.Changeset
  alias OauthExample.Fitness.Workout

    @primary_key false
  schema "workout_instances" do
    field :planned_date, :string, primary_key: true
    belongs_to :workout, Workout, primary_key: true

    timestamps()
  end

  @doc false
  def changeset(workout, attrs) do
    workout
    |> cast(attrs, [:title, :duration, :difficulty])
    |> validate_required([:title, :duration, :difficulty])
  end
end

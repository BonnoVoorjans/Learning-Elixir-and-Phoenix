defmodule OauthExampleWeb.WorkoutController do
  use OauthExampleWeb, :controller

  alias OauthExample.Fitness
  alias OauthExample.Fitness.Workout

  def index(conn, _params) do
    workouts = Fitness.list_workouts()
    render(conn, "index.html", workouts: workouts)
  end

  def new(conn, _params) do
    changeset = Fitness.change_workout(%Workout{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"workout" => workout_params}) do
    case Fitness.create_workout(workout_params) do
      {:ok, workout} ->
        conn
        |> put_flash(:info, "Workout created successfully.")
        |> redirect(to: Routes.workout_path(conn, :show, workout))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    workout = Fitness.get_workout!(id)
    render(conn, "show.html", workout: workout)
  end

  def plan_workout(conn, params) do
    workouts = Fitness.list_workouts()
    IO.inspect(workouts)
    render(conn, "plan_workout.html", workouts: workouts)
  end


  def edit(conn, %{"id" => id}) do
    workout = Fitness.get_workout!(id)
    changeset = Fitness.change_workout(workout)
    render(conn, "edit.html", workout: workout, changeset: changeset)
  end

  def update(conn, %{"id" => id, "workout" => workout_params}) do
    workout = Fitness.get_workout!(id)

    case Fitness.update_workout(workout, workout_params) do
      {:ok, workout} ->
        conn
        |> put_flash(:info, "Workout updated successfully.")
        |> redirect(to: Routes.workout_path(conn, :show, workout))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", workout: workout, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    workout = Fitness.get_workout!(id)
    {:ok, _workout} = Fitness.delete_workout(workout)

    conn
    |> put_flash(:info, "Workout deleted successfully.")
    |> redirect(to: Routes.workout_path(conn, :index))
  end
end

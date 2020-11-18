defmodule OauthExampleWeb.WorkoutControllerTest do
  use OauthExampleWeb.ConnCase

  alias OauthExample.Fitness

  @create_attrs %{difficulty: "some difficulty", duration: 42, title: "some title"}
  @update_attrs %{difficulty: "some updated difficulty", duration: 43, title: "some updated title"}
  @invalid_attrs %{difficulty: nil, duration: nil, title: nil}

  def fixture(:workout) do
    {:ok, workout} = Fitness.create_workout(@create_attrs)
    workout
  end

  describe "index" do
    test "lists all workouts", %{conn: conn} do
      conn = get(conn, Routes.workout_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Workouts"
    end
  end

  describe "new workout" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.workout_path(conn, :new))
      assert html_response(conn, 200) =~ "New Workout"
    end
  end

  describe "create workout" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.workout_path(conn, :create), workout: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.workout_path(conn, :show, id)

      conn = get(conn, Routes.workout_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Workout"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.workout_path(conn, :create), workout: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Workout"
    end
  end

  describe "edit workout" do
    setup [:create_workout]

    test "renders form for editing chosen workout", %{conn: conn, workout: workout} do
      conn = get(conn, Routes.workout_path(conn, :edit, workout))
      assert html_response(conn, 200) =~ "Edit Workout"
    end
  end

  describe "update workout" do
    setup [:create_workout]

    test "redirects when data is valid", %{conn: conn, workout: workout} do
      conn = put(conn, Routes.workout_path(conn, :update, workout), workout: @update_attrs)
      assert redirected_to(conn) == Routes.workout_path(conn, :show, workout)

      conn = get(conn, Routes.workout_path(conn, :show, workout))
      assert html_response(conn, 200) =~ "some updated difficulty"
    end

    test "renders errors when data is invalid", %{conn: conn, workout: workout} do
      conn = put(conn, Routes.workout_path(conn, :update, workout), workout: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Workout"
    end
  end

  describe "delete workout" do
    setup [:create_workout]

    test "deletes chosen workout", %{conn: conn, workout: workout} do
      conn = delete(conn, Routes.workout_path(conn, :delete, workout))
      assert redirected_to(conn) == Routes.workout_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.workout_path(conn, :show, workout))
      end
    end
  end

  defp create_workout(_) do
    workout = fixture(:workout)
    %{workout: workout}
  end
end

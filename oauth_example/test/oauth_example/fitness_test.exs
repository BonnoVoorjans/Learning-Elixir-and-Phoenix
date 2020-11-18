defmodule OauthExample.FitnessTest do
  use OauthExample.DataCase

  alias OauthExample.Fitness

  describe "workouts" do
    alias OauthExample.Fitness.Workout

    @valid_attrs %{difficulty: "some difficulty", duration: 42, title: "some title"}
    @update_attrs %{difficulty: "some updated difficulty", duration: 43, title: "some updated title"}
    @invalid_attrs %{difficulty: nil, duration: nil, title: nil}

    def workout_fixture(attrs \\ %{}) do
      {:ok, workout} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Fitness.create_workout()

      workout
    end

    test "list_workouts/0 returns all workouts" do
      workout = workout_fixture()
      assert Fitness.list_workouts() == [workout]
    end

    test "get_workout!/1 returns the workout with given id" do
      workout = workout_fixture()
      assert Fitness.get_workout!(workout.id) == workout
    end

    test "create_workout/1 with valid data creates a workout" do
      assert {:ok, %Workout{} = workout} = Fitness.create_workout(@valid_attrs)
      assert workout.difficulty == "some difficulty"
      assert workout.duration == 42
      assert workout.title == "some title"
    end

    test "create_workout/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Fitness.create_workout(@invalid_attrs)
    end

    test "update_workout/2 with valid data updates the workout" do
      workout = workout_fixture()
      assert {:ok, %Workout{} = workout} = Fitness.update_workout(workout, @update_attrs)
      assert workout.difficulty == "some updated difficulty"
      assert workout.duration == 43
      assert workout.title == "some updated title"
    end

    test "update_workout/2 with invalid data returns error changeset" do
      workout = workout_fixture()
      assert {:error, %Ecto.Changeset{}} = Fitness.update_workout(workout, @invalid_attrs)
      assert workout == Fitness.get_workout!(workout.id)
    end

    test "delete_workout/1 deletes the workout" do
      workout = workout_fixture()
      assert {:ok, %Workout{}} = Fitness.delete_workout(workout)
      assert_raise Ecto.NoResultsError, fn -> Fitness.get_workout!(workout.id) end
    end

    test "change_workout/1 returns a workout changeset" do
      workout = workout_fixture()
      assert %Ecto.Changeset{} = Fitness.change_workout(workout)
    end
  end
end

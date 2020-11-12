defmodule RobotSimulator do
defstruct [direction: :north, position: {0, 0}]
@allowed_direction [:north, :east, :south, :west]
@rotation_right %{:north => :east, :east => :south, :south => :west , :west => :north}
@rotation_left %{:north => :west, :west => :south, :south => :east, :east => :north}
@movement_delta %{:north => {0, 1}, :east => {1, 0}, :south => {0, -1}, :west => {-1, 0}}


  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec create(direction :: atom, position :: {integer, integer}) :: any
  def create(direction \\ :north, position \\ {0, 0}) 
  def create(direction, _) when direction not in @allowed_direction, do: {:error, "invalid direction"} 
  def create(direction, {x, y}) when is_integer(x) and is_integer(y) do
     %RobotSimulator{direction: direction, position: {x, y}}
  end
  def create(_, _), do: {:error, "invalid position"}


  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  
  def simulate(robot, [?A| remaining_instructions]) do
    advance(robot)
    |> simulate(remaining_instructions)
  end
  def simulate(robot, [?L| remaining_instructions]) do
    turn_left(robot)
    |> simulate(remaining_instructions)
  end
  def simulate(robot, [?R| remaining_instructions]) do
    turn_right(robot)
    |> simulate(remaining_instructions)
  end
  def simulate(_, [_|_]), do: {:error, "invalid instruction"}
  def simulate(robot, []), do: robot
   
  @spec simulate(robot :: any, instructions :: String.t()) :: any
  def simulate(robot, instructions) do
    instruction_list = String.to_charlist(instructions)
    simulate(robot, instruction_list)
  end


  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: any) :: atom
  def direction(robot) do
    robot.direction
  end

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: any) :: {integer, integer}
  def position(robot) do
    robot.position
  end

  def advance(robot) do
    {initial_x, initial_y} = robot.position
    {delta_x, delta_y} = @movement_delta[robot.direction]
    %{robot | position: {initial_x + delta_x, initial_y+delta_y}}
    
  end

  def turn_left(robot) do
    %{robot | direction: @rotation_left[robot.direction]}
  end

  def turn_right(robot) do
    %{robot | direction: @rotation_right[robot.direction]}
  end
end

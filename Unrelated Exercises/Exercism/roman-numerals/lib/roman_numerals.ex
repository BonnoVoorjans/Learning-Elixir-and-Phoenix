defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """

  @roman %{
    1 => "I",
    4 => "IV",
    5 => "V",
    9 => "IX",
    10 => "X",
    40 => "XL",
    50 => "L",
    90 => "XC",
    100 => "C",
    400 => "CD",
    500 => "D",
    900 => "CM",
    1000 => "M",
  }

  @sorted_roman Map.keys(@roman) |> Enum.sort(&(&1 > &2))

  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    to_roman(@sorted_roman, number)
  end

  defp to_roman(list, number) when number > 0, do: to_roman(list, number, "")
  defp to_roman(_, 0, result), do: result
  defp to_roman([biggestRemainingDivider|remainingDividers] = keyvalues, number, resultAccumulator) do
    if number >= biggestRemainingDivider do
      newResult = resultAccumulator <> @roman[biggestRemainingDivider]
      to_roman(keyvalues, number-biggestRemainingDivider, newResult)
    else
      to_roman(remainingDividers, number, resultAccumulator)
    end
  end 
end

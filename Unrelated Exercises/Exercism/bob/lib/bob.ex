defmodule Bob do
  def hey(input) do
    cond do
      asking(input) && shouting(input) && !only_numbers(input) -> "Calm down, I know what I'm doing!"
      asking(input) -> "Sure."
      shouting(input) && !only_numbers(input) -> "Whoa, chill out!"
      silence(input) -> "Fine. Be that way!"
      true -> "Whatever."
    end
  end

  defp shouting(input), do: input == String.upcase(input)
  defp asking(input), do: String.ends_with?(input, "?")
  defp silence(input), do: String.trim(input) == ""
  defp only_numbers(input), do: String.trim(String.replace(input, ~r/([0-9]|,|\?)/, "")) == ""
end

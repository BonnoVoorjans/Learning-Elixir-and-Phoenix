defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
  sentence 
  |> String.downcase
  |> String.replace(~r{[^a-zA-Z0-9ö-]}, " ") #Hyphen is at the end of regex group, so doesn't need escape
  |> String.split #Create an array of words split on " " (whitespace)
  |> count_words
  end

  defp count_words(list) do
    Enum.reduce(list, %{}, fn
      (element, accumulator) -> 
      Map.update(accumulator, element, 1, 
      &(&1+1)
      )  
    end
    )
  end
end

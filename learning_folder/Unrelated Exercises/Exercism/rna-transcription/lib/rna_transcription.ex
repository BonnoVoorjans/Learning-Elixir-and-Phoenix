defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @dna_to_rna_map %{
    71 => 67, #G - C
    67 => 71, #C - G
    84 => 65, #T - A
    65 => 85 #A - U
  }
 
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    Enum.map(dna, &dna_to_rna/1)
  end

  defp dna_to_rna(dna_nucleotide) do
    @dna_to_rna_map[dna_nucleotide]
  end
end

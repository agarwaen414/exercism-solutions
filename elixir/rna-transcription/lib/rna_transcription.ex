defmodule RnaTranscription do
  @moduledoc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    complement = %{71 => 67, 67 => 71, 84 => 65, 65 => 85}

    dna
    |> Enum.map(&Map.fetch!(complement, &1))
  end
end

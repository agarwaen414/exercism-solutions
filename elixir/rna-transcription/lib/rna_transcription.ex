defmodule RnaTranscription do
  @moduledoc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    complement = %{"G" => "C", "C" => "G", "T" => "A", "A" => "U"}

    dna
    |> List.to_string()
    |> String.codepoints()
    |> Enum.map(&Map.fetch!(complement, &1))
    |> List.to_charlist()
  end
end

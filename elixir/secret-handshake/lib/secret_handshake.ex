defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """

  use Bitwise

  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    # commands = %{"1" => "wink", "10" => "double blink", "100" => "close your eyes", "1000" => "jump"}
    commands = ["wink", "double blink", "close your eyes", "jump"]

    # code
    # |> actions

    Enum.reduce commands, [], fn(command, acc) ->
      commands(code, acc, command)
    end
  end

  # @spec actions(code :: integer, list :: list) :: list(String.t())
  # def actions(code, acc) when band(code, 0b1) == 1, do: acc ++ ["wink"]
  # def actions(code, acc) when band(code, 0b10) == 2, do: acc ++ ["double blink"]
  # def actions(code, acc) when band(code, 0b100) == 4, do:  acc+ ["close your eyes"]
  # def actions(code, acc) when band(code, 0b1000) == 8, do: acc ++ ["jump"]
  # def actions(_code, acc), do: []
  defp commands(code, acc, []) when rem(code, 2) === 0, do: Enum.reverse(acc)
  defp commands(_,    acc, []), do: acc
  defp commands(code, acc, [h|t]) when rem(code, 2) === 1, do: commands(div(code, 2), [h|acc], t)
  defp commands(code, acc, [h|t]), do: commands(div(code, 2), acc, t)
end

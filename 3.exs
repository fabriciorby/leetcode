defmodule Solution do
  @spec length_of_longest_substring(s :: String.t) :: integer
  # Starts the recursive process with the string, an empty accumulator, and 0 as the initial max length.
  def length_of_longest_substring(s), do: get_longest(s, <<>>, 0)

  # Base case: when the string is empty, return the maximum of the current max length or the accumulator's length.
  def get_longest(<<>>, acc, i), do: max(i, String.length(acc))

  # When the accumulator is empty, add the current character to it and update the max length.
  # (This was done only for pattern matching purposes with <<>>)
  def get_longest(<<head::utf8, tail::binary>>, <<>>, i), do: get_longest(tail, <<head::utf8>>, max(i, 1))

  # If the current character is already in the accumulator, drop the first character from the accumulator (sliding window).
  def get_longest(<<head::utf8, tail::binary>> = s, <<_, seent::binary>> = acc, i) do
    if String.contains?(acc, <<head::utf8>>) do
      # If the character exists, reduce the window and update the max length.
      get_longest(s, seent, max(String.length(acc), i))
    else
      # If the character doesn't exist in the accumulator, add it and continue.
      get_longest(tail, <<acc::binary, head::utf8>>, i)
    end
  end
end


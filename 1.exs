defmodule Solution do
  @spec two_sum(nums :: [integer], target :: integer) :: [integer]
  # Initializes the recursive search with the full list, starting indices, and target.
  def two_sum([_|tail] = nums, target),
    do: find(nums, tail, 0, 1, target)

  # Checks if the sum of two numbers equals the target, returns their indices if true.
  def find([hv|_], [head|_], i1, i2, target)
  when head + hv == target,
    do: [i1, i2]

  # Recursively moves through the tail of the list to find a valid pair.
  def find(v, [_|tail], i1, i2, target),
    do: find(v, tail, i1, i2 + 1, target)

  # Moves the first pointer forward and resets the second pointer when the tail is empty.
  def find([_|vt], [], i1, _, target)
  when length(vt) > 1,
    do: find(vt, tl(vt), i1 + 1, i1 + 2, target)

  # Base case when only two elements remain, returns their indices.
  def find([_, _], [], i1, i2, _),
    do: [i1, i2]
end

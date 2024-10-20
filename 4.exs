defmodule Solution do
  @spec find_median_sorted_arrays(nums1 :: [integer], nums2 :: [integer]) :: float
  # Declares the function to find the median of two sorted arrays and initializes the recursion.
  def find_median_sorted_arrays(nums1, nums2),
    do: find_median(nums1, nums2, 0, 0, length(nums1 ++ nums2))

  # Base cases: when i >= total/2
  # compute the median from the current value and heads of both arrays.
  # one array is empty, compute median from the head of the first array and current value.
  # the other array is empty, compute median from the head of the second array and current value.
  def find_median([a1h|_], [], cur, i, total) when i >= total/2, do: calculate(cur, a1h, nil, total)
  def find_median([], [a2h|_], cur, i, total) when i >= total/2, do: calculate(cur, nil, a2h, total)
  def find_median([a1h|_], [a2h|_], cur, i, total) when i >= total/2, do: calculate(cur, a1h, a2h, total)

  # Recursive case: if the head of the second array is smaller, use it and move to the next element.
  def find_median([a1h|a1t] = a1, [a2h|a2t] = a2, cur, i, total) when a1h > a2h,
    do: find_median(a1, a2t, a2h, i + 1, total)

  # Recursive case: if the head of the first array is smaller or equal, use it and move to the next element.
  def find_median([a1h|a1t] = a1, [a2h|a2t] = a2, cur, i, total),
    do: find_median(a1t, a2, a1h, i + 1, total)

  # Recursive case: if the second array is empty, continue traversing the first array.
  def find_median([a1h|a1t], [], cur, i, total),
    do: find_median(a1t, [], a1h, i + 1, total)

  # Recursive case: if the first array is empty, continue traversing the second array.
  def find_median([], [a2h|a2t], cur, i, total),
    do: find_median([], a2t, a2h, i + 1, total)

  # Edge case: when both arrays are empty, return the current value (for even total length).
  def find_median([], [], cur, _, _), do: cur

  # Helper function to calculate the median based on the current value and heads of the arrays.
  def calculate(cur, a1h, a2h, total), do:
    if rem(total, 2) == 0,
      do: (cur + min(a1h, a2h))/2,
      else: cur

end


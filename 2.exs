# Definition for singly-linked list.
#
# defmodule ListNode do
#   @type t :: %__MODULE__{
#           val: integer,
#           next: ListNode.t() | nil
#         }
#   defstruct val: 0, next: nil
# end

defmodule Solution do
  @spec add_two_numbers(l1 :: ListNode.t | nil, l2 :: ListNode.t | nil) :: ListNode.t | nil
  # Starts the recursive addition process, skipping the initial placeholder node.
  def add_two_numbers(l1, l2), do: add(l1, l2, 0).next

  # Base cases:
  # Both lists are nil and no carry remains, return an empty ListNode.
  # Both lists are nil but carry is 1, so create a node with value 1.
  def add(nil, nil, 0), do: %ListNode{}
  def add(nil, nil, 1), do: %ListNode{next: %ListNode{val: 1}}

  # If l2 is nil, continue adding l1's values with the carry, adjusting for the remainder.
  # If l1 is nil, continue adding l2's values with the carry, adjusting for the remainder.
  def add(l1, nil, c), do: %ListNode{next: %{add(l1.next, nil, carry(l1.val + c)) | val: l1.val + c |> rem(10)}}
  def add(nil, l2, c), do: %ListNode{next: %{add(nil, l2.next, carry(l2.val + c)) | val: l2.val + c |> rem(10)}}

  # Add corresponding values from l1 and l2, along with the carry, then process the rest recursively.
  def add(l1, l2, c), do: %ListNode{next: %{add(l1.next, l2.next, carry(l1.val + l2.val + c)) | val: l1.val + l2.val + c |> rem(10)}}

  # Calculates the carry (1 if sum >= 10, otherwise 0) using integer division.
  def carry(n), do: div(n, 10)
end


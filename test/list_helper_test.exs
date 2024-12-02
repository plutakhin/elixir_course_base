defmodule App.ListHelperTest do
  use App.DataCase
  alias App.ListHelper

  test "init ListHelper" do
    assert ListHelper.init() == []
  end

  test "add a value to the list" do
    assert_lists_equal(ListHelper.add(1, []), [1])
    assert_lists_equal(ListHelper.add(2, [1]), [1, 2])
    assert_lists_equal(ListHelper.add(3, [1, 2]), [1, 2, 3])
    assert_lists_equal(ListHelper.add(:a, [1]), [1, :a])
    assert_lists_equal(ListHelper.add(:a, [:b]), [:a, :b])
    assert_lists_equal(ListHelper.add([:a], [:b]), [[:a], :b])
  end

  test "removes the last an element from the list" do
    assert_lists_equal(ListHelper.remove(0, [1]), [])
    assert_lists_equal(ListHelper.remove(0, [1, 2]), [2])
    assert_lists_equal(ListHelper.remove(1, [1, 2]), [1])
    assert_lists_equal(ListHelper.remove(1, [1, 2, 3]), [1, 3])
  end

  test "returns the last added element of the list" do
    assert ListHelper.last([1, 2, 3, 4]) == 4
  end

  test "returns the first added element of the list" do
    assert ListHelper.first([1, 2, 3, 4]) == 1
  end

  test "calculates the average of the list" do
    assert ListHelper.avg([1, 2, 3, 4]) == 2.5
  end
end

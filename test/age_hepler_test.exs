defmodule AgeHelperTest do
  use Support.DataCase

  test "add a value to the map" do
    assert AgeHelper.validate("string") == {:error, "not_integer"}
    assert AgeHelper.validate(1.04) == {:error, "not_integer"}
    assert AgeHelper.validate(%{}) == {:error, "not_integer"}
    assert AgeHelper.validate([]) == {:error, "not_integer"}
    assert AgeHelper.validate(-5) == {:error, "negative_integer"}
    assert AgeHelper.validate(5) == {:ok, "детский"}
    assert AgeHelper.validate(17) == {:ok, "детский"}
    assert AgeHelper.validate(18) == {:ok, "взрослый"}
    assert AgeHelper.validate(99) == {:ok, "взрослый"}
  end
end

defmodule MapHelperTest do
  use Support.DataCase

  test "init" do
    assert MapHelper.init() == %{}
  end

  test "add a value to the map" do
    assert MapHelper.add(%{}, :a, 1) == %{a: 1}
    assert MapHelper.add(%{a: 1}, :a, 2) == %{a: 2}
    assert MapHelper.add(%{a: 1}, :b, 1) == %{a: 1, b: 1}
    assert MapHelper.add(%{}, "string", "value") == %{"string" => "value"}
  end

  test "removes by key from the map" do
    assert MapHelper.remove(%{a: 1}, :a) == %{}
    assert MapHelper.remove(%{a: 1}, :b) == %{a: 1}
    assert MapHelper.remove(%{a: 1, b: 2}, :a) == %{b: 2}
    assert MapHelper.remove(%{"a" => 1}, :a) == %{"a" => 1}
    assert MapHelper.remove(%{a: 1}, "a") == %{a: 1}
  end

  test "returns keys count of map" do
    assert MapHelper.count(%{}) == 0
    assert MapHelper.count(%{a: 1}) == 1
    assert MapHelper.count(%{"a" => "a"}) == 1
    assert MapHelper.count(%{a: 1, b: 1, c: 1}) == 3
  end
end

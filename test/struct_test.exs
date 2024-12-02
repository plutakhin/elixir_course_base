defmodule App.StructTest do
  use App.DataCase
  alias App.Struct

  test "should create empty struct" do
    struct = %Struct{}

    assert nil == struct.title
    assert nil == struct.description
    assert 0 == struct.value
  end

  test "should create struct with present values" do
    struct = %Struct{title: "foo", description: "bar", value: 123}

    assert "foo" == struct.title
    assert "bar" == struct.description
    assert 123 == struct.value
  end

  test "should serialize struct to json" do
    struct = %Struct{title: "foo", description: "bar", value: 123}
    string = Jason.encode!(struct)

    assert String.contains?(string, "foo")
    assert String.contains?(string, "123")
    refute String.contains?(string, "bar")
  end
end

defmodule UserTest do
  use Support.DataCase

  test "greets the name" do
    assert User.welcome("Mike") == "hello Mike"
    assert User.welcome("Bob") == "hello Bob"
  end
end

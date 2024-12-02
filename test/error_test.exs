defmodule App.ErrorTest do
  use App.DataCase
  alias App.Error

  test "вызов исключения без параметров" do
    try do
      raise Error
    rescue
      e in Error -> assert "Ошибка" == e.message
    end
  end

  test "вызов исключения с 1 параметром" do
    try do
      raise Error, 18
    rescue
      e in Error -> assert 18 == e.value
    end
  end

  test "вызов исключения с 2 параметрами" do
    try do
      raise Error, [13, "custom"]
    rescue
      e in Error ->
        assert 13 == e.value
        assert "custom" == e.message
    end
  end
end

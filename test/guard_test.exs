defmodule App.GuardTest do
  use App.DataCase, async: false
  alias App.Guard

  test "positive?" do
    assert Guard.positive?(1) == "positive"
    assert Guard.positive?(-1) == "negative"
  end

  test "to_atom конвертирует бинарную строку в атом" do
    assert Guard.to_atom("test") == :test
    assert Guard.to_atom(:foo) == :foo
  end

  test "last возвращает последний элемент списка" do
    assert Guard.last([1, 2, 3]) == 3
    assert Guard.last([3, 2, 1]) == 1
    assert Guard.last("string") == nil
  end

  test "request_config возвращает кортеж с методом, URL и данными" do
    assert Guard.request_config(:get, "test") == {:get, "http://example", "test"}
    assert Guard.request_config(:post, "test") == {:post, "http://example", "test"}

    assert_raise FunctionClauseError, fn ->
      Guard.request_config(:delete, "test")
    end
  end

  test "welcome_message возвращает приветственное сообщение учитывая возраст >= 18" do
    assert Guard.welcome_message(20, "John") == "Добро пожаловать, John!"
    assert Guard.welcome_message(18, "Mike") == "Добро пожаловать, Mike!"
    assert Guard.welcome_message(15, "Jane") == "Привет, Jane!"
    assert Guard.welcome_message(:empty, "Rom") == "Привет, Rom!"
  end
end

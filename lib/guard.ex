defmodule App.Guard do
  # Требуется избавиться от блока if...end в методе используя guard
  def positive?(value) do
    if is_integer(value) and value > 0 do
      "positive"
    else
      "negative"
    end
  end

  # Требуется заменить блок if...end на guards
  def to_atom(val) do
    if is_binary(val) do
      String.to_atom(val)
    else
      val
    end
  end

  # С помощью guards нужно избавиться от исключений (ошибки), если `list` не список (в ответе вернуть просто nil).
  def last(list) do
    List.last(list)
  end

  # Требуется ограничить аргумент `method` только возможными значениями: [:get, :post], в противном случае должно быть выброшено FunctionClauseError исключение
  def request_config(method, data) do
    {method, "http://example", data}
  end

  # Необходимо разбить метод на два, добавив свой кастомный defguardp is_adult который проверяет что передано число и что оно больше, либо равно 18
  def welcome_message(age, name) do
    if is_number(age) and age >= 18 do
      "Добро пожаловать, #{name}!"
    else
      "Hello #{name}!"
    end
  end
end

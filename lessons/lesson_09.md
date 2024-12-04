# Урок 9. Охранные выражения

## Теория

В языке программирования Elixir, охранные выражения (guards) — это конструкция, которая позволяет проверить условия, до выполнения действия.
Охранное выражение (guards) представляет собой один предикат или цепочку предикатов, начинающихся с ключевого слова `when`.
Условия могут включать в себя различные предикаты, такие как сравнения (>, <, == и т.д.), предикаты типизации, а также функции, возвращающие логические значения.

Важно отметить, что guards выполняются только в том случае, если сопоставление c образцом прошло успешно, и служат для уточнения условий выполнения определенного блока кода.

Пример использования guards в функции:
```elixir
defmodule Example do
  def classify_age(age) when age < 13 do
    "Child"
  end

  def classify_age(age) when age >= 13 and age < 20 do
    "Teenager"
  end

  def classify_age(age) when age >= 20 do
    "Adult"
  end
end
```

Пример с конструкцией case:
```elixir
defmodule Example do
  def classify(value) do
    case value do
      x when is_integer(x) and x < 0 -> "Отрицательное число"
      x when is_integer(x) and x == 0 -> "Ноль"
      x when is_integer(x) and x > 0 -> "Положительное число"
      _ -> "Не число"
    end
  end
end
```

Пример цепочки предикатов:
```elixir
def classify({:library, rating, books}) when rating > 4 and length(books) > 2 do
  "good library"
end

def classify({:library, rating, books}) when rating > 4 or length(books) > 2 do
  "not too bad"
end

def classify({:library, _rating, _books}) do
  "not recommended"
end
```

В guards нельзя использовать операторы, которые могут приводить к бесконечным циклам, например, for, while, нельзя использовать условные операторы типа if и case, а также рекурсивные вызовы функций.
Нельзя проводить сложные операции, допускаются только простые арифметические или логические выражения.
Если при вычислении охранного выражения возникает исключение, то оно не приводит к остановке процесса, а приводит к тому, что все выражение вычисляется в false.

Еще примеры:
```elixir
def convert_value(value) do
    cond do
      is_binary(value) -> value
      is_list(value) -> format_list(value)
      match?(%DateTime{}, value) -> format_datetime(value)
      is_struct(value, Site) -> link(value.name, to: Routes.site_path(%Plug.Conn{}, :show, value))
      is_map(value) -> content_tag(:pre, Jason.encode!(value, pretty: true))
      is_tuple(value) -> value |> Tuple.to_list() |> Enum.join(", ")
      true -> to_string(value)
    end
end
```

## Свои охранные выражения

Можно определить свои собственные охранные выражения через `defguard`:

```elixir
defmodule MyModule do
  defguard is_positive(value) when is_number(value) and value > 0

  def check_number(value) when is_positive(value) do
    "Число положительное"
  end

  def check_number(value) do
    "Число не является положительным"
  end
end
```

- `defguard`: Охранное выражение может быть использовано за пределами модуля (public).
- `defguardp`: Охранное выражение является частным (private) и доступно только внутри самого модуля.


> **ЗАДАНИЕ**. Переписать методы в модуле [Guard](../lib/guard.ex) используя подсказки в комментариях над методом.

> **Самопроверка**. Запустить команду `make verify` для проверки кода.
> Запустить тест модуля: `mix test test/guard_test.exs`

## Дополнительные материалы

https://hexdocs.pm/elixir/patterns-and-guards.html#guards
defmodule App.PatternMatch do
  # Переменная list явно лишняя, получить первый элемент можно прямо в аргументах:
  def first_of_list(list) do
    [first | _tail] = list
    first
  end

  # Первые 3 метода явно имеют один префикс и одинаковый результат, можно объединить в 1 метод:
  def company_name("yandex_drive" = _type), do: "ООО «Яндекс»"
  def company_name("yandex_disk" = _type), do: "ООО «Яндекс»"
  def company_name("yandex_direct" = _type), do: "ООО «Яндекс»"
  def company_name("google_drive" = _type), do: "ООО «Гугл»"

  # Явное преувеличеное использование сопоставления там, где оно может быть упрощено с помощью одной функции tuple_size:
  def all_options_exists?({} = _options), do: false
  def all_options_exists?({_a} = _options), do: false
  def all_options_exists?({_a, _b} = _options), do: false
  def all_options_exists?({_a, _b, _c} = _options), do: true
  def all_options_exists?({_a, _b, _c, _d} = _options), do: true

  # Знак ! в названии метода говорит что если действие не может быть выполнено, нужно выбросить исключение
  # Метод явно обременен лишним блоком if...end, можно использовать стандартное исключение FunctionClauseError если сопоставление не пройдет:
  def get_id!(map) do
    if Map.has_key?(map, :id) do
      Map.get(map, :id)
    else
      raise ":id not found"
    end
  end

  # Блок с проверкой на соответствие значения nil явно лишний, можно упростить через паттерн матчинг, разбив метод на 2 однострочных:
  def record_persist?(%{id: id} = _record) do
    if id == nil do
      false
    else
      true
    end
  end
end

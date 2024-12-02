# Урок 5. Работа со списками

Коллекции в Elixir представлены несколькими типами данных: списки, кортежи, ключевые списки и ассоциативные массивы.
Рассмотрим более подробно как работают списки в Elixir.

## Теория

Список в Elixir представляет собой однонаправленный связный список (linked list). 
Каждый элемент списка состоит из двух частей: некое значение и ссылка на следующий элемент. 
Список можно обходить по ссылкам от головы первого элемента к последнему. В обратном направлении пройти нельзя, потому что обратных ссылок нет.

Можно выделить следующие особенности работы со списками:

**Иммутабельность**: Списки в Elixir являются неизменяемыми структурами данных. 
Это означает, что при добавлении, удалении или изменении элементов группа данных не изменяется; вместо этого создается новая версия списка.

**Хвостовое рекурсивное выполнение**: В Elixir рекомендуется использовать рекурсию для обхода списков, так как она оптимизирована для хвостовой рекурсии. 
Это позволяет избежать переполнение стека при работе с большими списками.

**Сложность операций**:
- Добавление элемента: Добавить элемент в начало списка — O(1).
- Добавление элемента в конец: Это потребует пройти весь список, что занимает O(n).
- Удаление элемента: Удаление элемента из начала списка — O(1), а из середины или конца списка — O(n).

**Паттерн-матчинг**: Elixir поддерживает мощные возможности паттерн-матчинга, что позволяет легко извлекать данные из списков. Например, можно использовать конструкцию =, чтобы разбить список на голову и хвост.

**Конкатенация списков**: Для объединения двух списков можно использовать оператор ++, но это будет выполнено за O(n), так как Elixir пройдет весь первый список.

**Хранилище данных**: Списки используются в основном для хранения последовательностей данных. 
Если требуется часто добавлять или удалять элементы, можно рассмотреть другие структуры данных, такие как Map или Keyword List.

**Проверка принадлежности**: Метод Enum.member?/2 используется для проверки наличия элемента в списке, но следует помнить, что это операция O(n).

**Списки и потоки**: В Elixir можно использовать потоки (Streams) для ленивой обработки списков, что позволяет обрабатывать элементы по мере необходимости и экономить память.

## Практика

Создание списка:

```elixir
iex(1)> list = [1, 2, 3, 4, 5]
[1, 2, 3, 4, 5]
```

Две основные операции над списком, это добавление нового элемента к голове:

```elixir
iex(2)> [0 | list]
[0, 1, 2, 3, 4, 5]
```

и разделение списка на голову (первый элемент) и хвост (все остальные элементы):

```elixir
iex(3)> [head | tail] = list
[1, 2, 3, 4, 5]

iex(4)> head
1

iex(5)> tail
[2, 3, 4, 5]
```

Списки могут содержать внутри себя любые в тч вложенные структуры:

```elixir
iex(1)> list = [{:tuple, 1, 2}, :a, 3, "text", [[2]]]
[{:tuple, 1, 2}, :a, 3, "text", [[2]]]
```

## Модули для работы со списком

В Elixir существует несколько модулей, которые предоставляют функции для работы со списками.

### List
https://hexdocs.pm/elixir/List.html

 - List.first/1 — получает первый элемент списка.
 - List.last/1 — получает последний элемент списка.
 - List.flatten/1 — «разворачивает» вложенные списки в одномерный.
 - List.delete/2 — удаляет первый найденный элемент из списка.
 - List.insert_at/3 — вставляет элемент по указанному индексу.

### Enum
https://hexdocs.pm/elixir/Enum.html

Этот модуль предназначен для работы с перечислениями, включая списки, и предоставляет множество полезных функций для перебора и манипуляции с коллекциями.
 - Enum.map/2 — применяет функцию ко всем элементам списка и возвращает новый список.
 - Enum.filter/2 — фильтрует список на основе предиката.
 - Enum.reduce/3 — сворачивает список с использованием функции-аккумулятора.
 - Enum.each/2 — применяет функцию к каждому элементу списка (не возвращает новый список).

### Stream
https://hexdocs.pm/elixir/Stream.html

Модуль для работы с ленивыми перечислениями. Позволяет создавать и обрабатывать потоки данных, которые вычисляются по мере необходимости.
 - Stream.map/2 — ленивая версия Enum.map/2.
 - Stream.filter/2 — ленивая версия Enum.filter/2.
 - Stream.flat_map/2 — ленивая версия, которая «разворачивает» вложенные структуры.

### Kernel
https://hexdocs.pm/elixir/Kernel.html

Фунции ядра для работы с базовыми примитивами языка.

 - hd/1 возвращает голову списка - первый элемент в списке.
 - tl/1 возвращает хвост списка -- список минус первый элемент.
 - length/1 возвращает количество элементов в списке.
 - in/2 возвращает булево значение, указывающее, является ли данный элемент элементом списка.

## Задание

> **ЗАДАНИЕ**. Добавить реализацию всех методов модуля [App.ListHelper](../lib/list_helper.ex).
 
Модуль [App.ListHelper](../lib/list_helper.ex) должен содержать следующий набор публичных методов:
 - init/0 Метод инициализации пустого списка
 - add/2 Метод принимает на вход новое значение и добавляет его в список
 - remove/2 Метод удаляет значение из списка по его индексу
 - last/1 Метод получает последнее значение из списка
 - first/1 Метод получает первое значение из списка
 - avg/1 Метод вычисляет среднее арифметическое значение списка

> **Самопроверка**. Запустить команду `make verify` для проверки кода. 
> Запустить тест модуля: `mix test test/list_helper_test.exs`
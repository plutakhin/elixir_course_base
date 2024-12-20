# Урок 1. Установка и настройка

Для работы с курсом потребуется склонировать репозиторий и установить Elixir либо использовать docker.

> **ЗАДАНИЕ**. Склонировать репозиторий. Создать ветку свою ветку `study/surname`, например `study/plutakhin`.

## Установка Elixir через asdf

https://asdf-vm.com/guide/getting-started.html

```bash
asdf plugin-add erlang
asdf plugin-add elixir

asdf install

mix deps.get
mix deps.compile
```

## Установка Elixir через docker compose

```bash
docker compose build app
docker compose run --rm app bash
```

## Базовые команды

Для работы с проектом используются команды mix, которая является основным инструментом для управления проектами. 
Она предоставляет множество функций, таких как создание новых проектов, запуск тестов, компиляция кода, создание документации и многое другое.

Основные команды "mix" включают:

1. `mix new`: Создает новый проект Elixir.
2. `mix test`: Запускает тесты в вашем проекте.
3. `mix compile`: Компилирует ваш код Elixir в байт-код Erlang.
4. `mix run`: Запускает ваше приложение Elixir.
5. `mix docs`: Создает документацию для вашего проекта.
6. `mix format`: Форматирует ваш код Elixir в соответствии с рекомендациями сообщества.
7. `mix deps.get`: Устанавливает зависимости вашего проекта.


полный список можно посмотреть командой:
```bash
mix help
```

Команды mix можно легко расширить:
Для этого в mix.exs в блоке project нужно добавить строку `aliases: []` со списком команд, обычно это выносят в отдельный метод, и называют его аналогично.

> **ЗАДАНИЕ**. Добавить команду `mix lint`, для этого нужно найти и раскомментировать подготовленную строку в mix.exs

> **Самопроверка**. Запустить `mix lint`

## Консоль elixir

https://elixirschool.com/ru/lessons/basics/iex_helpers

IEx (Interactive Elixir) - это интерактивная консоль для языка программирования Elixir. 

1. Интерактивное выполнение кода. Это позволяет быстро тестировать и отлаживать код.
2. Автодополнение, что упрощает написание кода и уменьшает вероятность ошибок.
3. Поддержка модулей: IEx позволяет загружать и использовать модули Elixir прямо в консоли.
4. Поддержка отладки: IEx предоставляет функции для отладки кода, такие как возможность установки точек останова и просмотра стека вызовов.
5. Поддержка документации: IEx предоставляет доступ к документации Elixir, что позволяет разработчикам быстро находить информацию о функциях и модулях.

Для входа в консоль Elixir:

```bash
iex
```

Для получения документации по любой функции используется хелпер `h`, ее можно применять как к функциям так и для конструкций: `h is_atom/1` или `h =/2`, `h ../2` (где `/2` - арность функции):
```elixir
iex(1)> h =/2
                             defmacro left = right
Match operator. Matches the value on the right against the pattern on the left.
```

Для того чтобы запустить интерактивную оболочку Elixir с загруженным проектом, используется следующая команда:
```bash
iex -S mix
```
Это позволяет вам работать с вашим проектом в интерактивном режиме, тестировать функции и исследовать код без необходимости предварительной компиляции.

## Тесты

`mix test` - это команда, которая используется в Elixir для запуска тестов. 
Она запускает все тесты, определенные в проекте, и выводит результаты в консоль.
Если нужно запустить только определенные тесты, можно указать их полный или частичный путь после команды, например: `mix test test/app_test.exs`.

Также можно использовать флаги для настройки поведения тестов. 
Например, флаг `--trace` выводит подробные сведения о каждом тесте, а флаг `--cover` генерирует отчет о покрытии кода.


Тестовые файлы имеют расширение .exs в отличии от .ex приложения. Это связано с тем, что не нужно компилировать тестовые файлы перед их запуском.
Для написания тестов можно использовать doctest, описывая работу метода в комментарии над ним. Таким образом можно сразу генерировать его проверку тестами, 
данный способ следуют изучить отдельно. Не используется так как сильно увеличивает размер файлов, "замусоривая" текущий код. 

За настройку тестового фреймворка отвечает файл test/test_helper.exs, в нем определяется основная логика и поведение приложения в тестовом окружении.
При написании теста, файл располагают в "зеркальной" директории в папке "test" и к наименованию добавляется постфикс Test. см пример [app_test.exs](../test/app_test.exs) 

## Дополнительные материалы

* https://elixir-lang.org/install.html
* https://hexdocs.pm/mix/1.12/Mix.Tasks.New.html
* https://hexdocs.pm/elixir/introduction-to-mix.html
* https://elixirschool.com/ru/lessons/basics/mix
# Урок 2. Проверка кода

## Проверка на этапе компиляции

На этапе компиляции можно вывести все предупреждения следующей командой:
```bash
mix compile --all-warnings
```
**ВАЖНО** Крайне не рекомендуется игнорировать данные предупреждения.

## Проверка через статический анализ кода

Для запуска статического анализатора кода используется библиотека `credo`. 
Запустить анализатор можно командой:
```bash
mix credo
```
Для более детальной проверки можно включить режим `--strict` который поможет обнаружить ошибки и уязвимости, которые не выявляются в обычном режиме. 
Это дополнительно включает проверки на сложность кода, ненужные переменные и функции, а также другие проблемы, которые могут быть упущены.
Запустить с флагом можно командой:
```bash
mix credo --strict
```

Настройки конфигурации для `credo` хранятся по умолчанию в файле `.credo.exs` который можно сгенерировать командой `mix credo.gen.config` и изменять под себя. 

## Форматирования кода

`mix format` — это команда в Elixir, которая используется для автоматического форматирования кода вашего проекта в соответствии с установленными стандартами кодирования. 
Она помогает сохранить единообразие стиля кода, что делает его более читабельным и поддерживаемым.

Основные особенности mix format:
- Автоматическое форматирование: Команда автоматически форматирует все файлы Elixir в проекте, которые соответствуют определенным критериям (обычно файлы с расширением .ex и .exs).
- Настройки: Форматирование можно настраивать с помощью файла .formatter.exs, который описывает правила и конфигурацию форматирования. Например, вы можете указать исключения для файлов или задать специальные правила для отдельных модулей.
- Проверка формата: Вы можете использовать команду с флагом --check-formatted, чтобы проверить, отформатированы ли файлы, без изменения самих файлов. Это полезно для CI/CD процессов, чтобы гарантировать, что код соответствует стилю.
- Интеграция с редакторами: Многие редакторы кода и IDE поддерживают вызов mix format при сохранении файла, что позволяет автоматически форматировать код по мере написания.

Запустим провеку:

```bash
mix format --check-formatted
```

Большим плюсом является то, что все ошибки можно исправить в автоматическом режиме, что очень сильно облегчает работу с Elixir:
```bash
mix format
```

## Задание

> **ЗАДАНИЕ**. Запустить команду `mix credo --strict`
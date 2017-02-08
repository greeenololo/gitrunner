# language: ru

Функциональность: Фиксация изменений

Как разработчик
Я хочу иметь возможность фиксировать изменения, добавленные в индекс git
Чтобы мочь автоматизировать больше рутинных действий на OneScript

Контекст:
    Допустим Я создаю новый объект ГитРепозиторий
    И Я создаю временный каталог и сохраняю его в контекст
    И Я инициализирую репозиторий во временном каталоге

Сценарий: Фиксация изменений нового файла
    Допустим Я создаю временный файл "temp.tmp" во временном каталоге и сохраняю его в контекст
    И Я добавляю временный файл в индекс
    Когда Я фиксирую изменения с сообщением "Добавлен тестовый файл"
    И Я получаю состояние репозитория
    Тогда Вывод команды содержит "nothing to commit"
    Когда Я получаю историю репозитория
    Тогда Вывод команды содержит "Добавлен тестовый файл"

Сценарий: Фиксация изменений с переопределением автора и даты автора
    Допустим Я создаю временный файл "temp.tmp" во временном каталоге и сохраняю его в контекст
    И Я добавляю временный файл в индекс
    Когда Я фиксирую изменения с сообщением "Добавлен тестовый файл" с указанием автора "Другой автор <1@1.ru>" и датой автора 01.01.2016
    И Я получаю историю репозитория
    Тогда Вывод команды содержит "Author: Другой автор <1@1.ru>"
    И Вывод команды содержит "Date:   Fri Jan 1 00:00:00 2016"

Сценарий: Фиксация изменений с переопределением коммитера и даты коммитера
    Допустим Я создаю временный файл "temp.tmp" во временном каталоге и сохраняю его в контекст
    И Я добавляю временный файл в индекс
    И Я устанавливаю настройку "core.name" в значение "Установленный коммитер" локально
    Когда Я фиксирую изменения с сообщением "Добавлен тестовый файл" с указанием коммитера "Другой коммитер <1@1.ru>" и датой коммита 01.01.2016
    И Я выполняю произвольную команду git "log --format=fuller"
    Тогда Вывод команды содержит "Commit:     Другой коммитер <1@1.ru>"
    И Вывод команды содержит "CommitDate: Fri Jan 1 00:00:00 2016"

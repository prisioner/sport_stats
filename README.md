# Sport Stats (Test Application)

#### Описание

Проект создан в рамках выполнения тестового задания. Требования предъявленные к проекту описаны ниже.

##### Ruby version
```
ruby 2.7.0
```

##### Rails version
```
Rails 6.0.2
```

### Первый запуск
```
gem install bundler
bundle install
```

Подготавливаем базу данных:

```
rails db:create
rails db:migrate
```

Заполнение базы данных тестовым контентом

```
rails db:seed
```

Запуск сервера

```
rails s
```

### Тесты
```
rspec
```

### Документация API

Примеры запросов доступны по адресу https://documenter.getpostman.com/view/5842439/SzYbzdcC

### Требования к проекту

Есть игроки, которые играют за команду, принимая участие в матчах.
Есть показатели ("пробежал 10+ км", "сделал 70+ % точных передач" и так далее).
Игроки в каждом матче какие-то показатели выполняют, а какие-то нет.

Задание:
Создать модели к данной предметной области.

P.S. Полный набор атрибутов в моделях не принципиален, так что можно обойтись минимально достаточным.

Реализовать методы, которые позволяют

- отметить, что игрок выполнил такой-то показатель в матче
- проверить выполнил ли игрок конкретный показатель хотя бы 1 раз за предыдущие 5 матчей команды
- выбрать Top-5 игроков по конкретному показателю в конкретной команде и по всем командам в целом

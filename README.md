# Sea Fight

Данная консольная игра **Морской бой** выполнена в рамках конкурса для поступления в школу мобильной разработки Яндекса.

ТЗ по созданию игры реализовано на **100%**.

Код написан на **Swift 5.4**. В этом репозитории упрощенная версия, переработанная для Windows. В ней убран ANSITerminal.

Copyright (c) 2021 Alexander Vankov (Александр Ваньков)

#### Состав файлов проекта (директория `Sources`):

* `main.swift` - основной файл программы
* `field.swift` - класс поля (сетка 10 на 10)
* `ship.swift` - класс корабля (каждый корабль на любом поле)
* `compai.swift` - код думателя (никогда не возвращает 42)
* `screen.swift` - здесь в основном все сообщения и вывод на экран всякого

#### Выполнение программы
Для работы приложение использует стандартные runtime-библиотеки Swift и Windows. Swift должен быть установлен в системе, чтобы приложение работало (включая готовый исполняемый файл).
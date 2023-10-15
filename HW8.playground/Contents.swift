import UIKit

//1) Повторите то, что было в видео.

//for i in 0...200 {
//    if i == 10 {
//        break
//    }
//
//    print(i)
//}
//
//var day = 1
//
//if day == 1 {
//    print("Будний день")
//} else if day == 2 {
//    print("Будний день")
//} else if day == 3 {
//    print("Будний день")
//} else if day == 4 {
//    print("Будний день")
//} else if day == 5 {
//    print("Будний день пятница!")
//} else if day == 6 {
//    print("Выходной")
//} else if day == 7 {
//    print("Выходной")
//}
//
//switch day {
//case 1...4:
//    print("Будний день")
//case 5:
//    print("Будний день пятница!")
//case 6...7:
//    print("Выходной")
//default:
//    break
//}

//let nameWork = "Ios Dev"
//let age = 51
//let peopleSex = "M"
//
//switch (nameWork, age) {
//case (_, 1...17):
//    print("Ты маловат")
//case ("Ios Dev", 18...50) where peopleSex == "W":
//    print("Девушек не берем")
//case ("Ios Dev", 18...50) where peopleSex == "M":
//    print("Вы нам подходите")
//case let(name, age):
//    print("\(name) в \(age) год?")
//
//default:
//    print("Введите корректные значения")
//}


//2) Зайти обязательно и познакомиться с документацией. Выпишите около 5 примеров.

let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, \(name)!")
}

var productTemperature = 20

repeat {
    productTemperature += 20
    print(productTemperature)
} while productTemperature < 60

while productTemperature < 80 {
    productTemperature += 20
    print(productTemperature)
}


//3) Создать цикл в цикле. В первом цикле интервал 200 раз во втором как дойдем до 15 выйти со всех циклов сразу.

for i in 0...200 {
    if i == 15 {
        break
    }
    print(i)
}


//4) Создать обработку возраста в switch, если человеку от 6 до 17 то выводить, что ему пора нужно в школу, если от 18 до 25, то в универ и так далее, аж до пенсии.

var age = 20

switch age {
case 0...5:
    print("В садик")
case 6...18:
    print("В школу")
case 19...24:
    print("В университет")
case 25...65:
    print("На работу")
case 66..<age:
    print("На пенсию")
default:
    print("Введите корректный возраст")
}


//5) Сделать 4 е задание через if конструкцию.

let ageMan = 25

if ageMan < 5 {
    print("В садик")
} else if ageMan >= 6 && ageMan <= 18 {
    print("В школу")
} else if ageMan >= 19 && age <= 24 {
    print("В университет")
} else if ageMan >= 25 && ageMan <= 65 {
    print("На работу")
} else if ageMan > 66 {
    print("На пенсию")
} else {
    print("Введите корректный возраст")
}


/*
 6) Создать switch, который принимает сразу точку по x и y например (1, 1) и написать условие если x,y по 0 то выводить x,y и написать, что это точка origin, если значение (1, 0), то выводим точку и говорим вы на оси x, (0, 1) вы на оси y, если x и y от -2 до 2 то писать вы внутри координат.
*/

let x = 1
let y = 1

switch (x, y) {
case (0, 0):
    print("\(x) : \(y) - точка Origin")
case (1, 0):
    print("\(x) : \(y) - вы на оси Х")
case (0, 1):
    print("\(x) : \(y) - вы на оси Y")
case let coordinates where x >= -2 && x <= 2 && y >= -2 && y <= 2:
    print("Вы внутри координат Х: \(coordinates.0) : \(coordinates.1)")
default:
    print("Неизвестные коорддинаты")
    
}



//7) Написать switch в котором 3 кейса 1,2,3 с принтами этих индексов. Когда мы передаем 1 индекс печатать принт 1 го кейса, а когда передаем 2 й индекс то печатать сразу принт 2- го и 3-го кейса.

let number = 2

switch number {
case 1:
    print(1)
case 2:
    print(2)
    fallthrough
case 3:
    print(3)
default:
    break
}


//8) Придумать свой switch в котором будет 3 кейса и в одном из ник доп. условие с оператором where.

let nameWork = "Ios Dev"
let ageIosDev = 27
let peopleSex = "M"

switch age {
case 1...17:
    print("Ты маловат")
case 18...50 where peopleSex == "W":
    print("Девушек не берем")
case 18...50:
    print("Вы нам подходите")
default:
    print("Введите корректные значения")
}


//9) Создайте переменную с значением 10 и через цикл while печатайте свое имя пока значение не станет 0.

var times = 10

while times > 0 {
print("Sergey")
    times -= 1
}

import UIKit


//1) Повторить то, что есть в видео.
//
//var str = "Расширение"
//
////Extension
//
//extension String {
//    func sayHello() {
//        print("Hello")
//    }
//}
//
//var hello = "Hi"
//hello.sayHello()
//
//var a = String()
//a.sayHello()
//
//"Hi".sayHello()
//
////------------Int
//
//extension Int {
//    var squared: Int {
//        return (self * self)
//    }
//}
//
//var newInt = 30
//
//newInt.squared
//
//140.squared
//
////---------Class
//
//final class Vova {
//    var nick = "The swift dev"
//}
//
//let realVova = Vova()
//realVova.nick
//
//extension Vova {
//    func allSelf() -> String {
//        return "My name is Vova.My nick - \(nick)"
//    }
//}
//
//var secondVova = Vova()
//secondVova.allSelf()
//


/*
 2) Зайти в документацию открыть тему extension и руками набрать пол этой главы, разобраться как это работает
 https://swiftbook.ru/content/languageguide/extensions/
 */

//extension Double {
//    var km: Double { return self * 1_000.00 }
//    var m: Double { return self }
//    var sm: Double { return self / 100.0}
//    var mm: Double { return self / 1_000.0}
//    var ft: Double { return self / 3.28084}
//}
//
//let oneInch = 25.4.mm
//
//print("Один дюйм это \(oneInch) метра")
//
//let threeFeet = 3.ft
//
//print("3 фута это \(threeFeet) метра")
//
//let aMarathon = 32.km + 195.m
//
//print("Марафон имеет длинну \(aMarathon) метра")
//
//
//struct Size {
//    var width = 0.0, height = 0.0
//}
//struct Point {
//    var x = 0.0, y = 0.0
//}
//struct Rect {
//    var origin = Point()
//    var size = Size()
//}
//
//let defaultRect = Rect()
//let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0),
//                          size: Size(width: 5.0, height: 5.0))
//
//extension Rect {
//    init(center: Point, size: Size) {
//        let originX = center.x - (size.width / 2)
//        let originY = center.y - (size.height / 2)
//        self.init(origin: Point(x: originX, y: originY), size: size)
//    }
//}
//
//let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
//                      size: Size(width: 3.0, height: 3.0))
//
//extension Int {
//    func repetitions(task: () -> Void) {
//        for _ in 0..<self {
//            task()
//        }
//    }
//}
//
//3.repetitions {
//    print("Hello!")
//}
//
//extension Int {
//    mutating func square() {
//        self = self * self
//    }
//}
//var someInt = 3
//someInt.square()



//3) Расширить String, чтобы принимал сабскрипт вида s[0..<3] и мог также устанавливать значения используя его

extension String {
    subscript(range: Range<Int>) -> String {
        return "On holiday \(supermarket) work from \(range.startIndex) to \(range.endIndex)"
    }
}

var supermarket = "Spar"

print(supermarket[0..<3])


//4) Расширить Int и добавить 3 метода: возведение в квадрат, в куб, в степень

extension Int {
    
    var squared: Int {
        return self * self
    }
    
    var cube: Int {
        return self * self * self
    }
    
    func raiseNum (degree: Double) -> Double {
        return pow(Double(self), degree)
    }
}

2.squared
3.cube
4.raiseNum(degree: 5)


//5) Расширить еще 3 структуры (написать свои, либо взять на свой вкус и в комментах обосновать для чего это было сделано

struct Car {
    
    private var miles: Double = 0
    
    mutating func setMiles(_ mileage: Double) {
        miles = mileage
    }
}

var maserati = Car()
maserati.setMiles(42.3)

extension Car {
    
    func convertMilesIntoKm() {
        var milesIntoKm = miles * 1.6
        print("Пробег авто составляет \(milesIntoKm) километров")
    }
}

maserati.convertMilesIntoKm()

struct PoleChudes {
    
    func yakubovichSay() {
        print("Сектор приз на барабане!")
    }
}

var poleChudes = PoleChudes()
poleChudes.yakubovichSay()

extension PoleChudes {
    
    func presents(_ answer: Bool) {
        if answer == true {
            print("Подарки в студию!")
        } else {
            print("Ответ не верный. Ход переходит к другому игроку")
        }
    }
}

poleChudes.presents(true)

extension Bool {
    
    var description: String {
        return self ? "True" : "False"
    }
}

let isAndroid = false
isAndroid.description.capitalized


//6) Добавьте проперти, которое возвращает количество символов в числе

extension Int {
    var countOfNumber: Int {
        return String(self).count
    }
}

let numbers = 777
numbers.countOfNumber


//7) Добавить метод, который говорит, что число положительное или отрицательное

extension Int {
    
    func checkNum() {
        self < 0 ? print("Число отрицательное") : print("Число положительное")
    }
}

let numberOne = -1
numberOne.checkNum()

let numberTwo = 1
numberTwo.checkNum()



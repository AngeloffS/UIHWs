import UIKit

//1) Больше практиковаться, повторите то, что есть в видео.

//enum TravelClass {
//    case first, business, economy
//}
//
//let travel = TravelClass.economy
//
//enum Medal {
//    case gold
//    case silver
//    case bronse
//}
//
//let medal = Medal.bronse
//
//switch medal {
//case .bronse:
//    print("u medal bronse")
//case .silver:
//    print("u medal silver")
//case .gold:
//    print("u medal gold")
//}
//
//enum DayOfWeek {
//    case monday
//    case tuesday
//    case wednesday
//    case thursday
//    enum friday {
//        case day
//        case night
//    }
//    case saturday
//    case sunday
//}
//
//var friday = DayOfWeek.friday.day
//
//enum Operation {
//    case double(Double)
//    case integer(Int)
//    case float(Float)
//    case string(String)
//}
//
//var dictionary: Dictionary<String, Operation> = [
//    "Double": Operation.double(25.4),
//    "Integer": Operation.integer(10),
//    "Float": Operation.float(44.1),
//    "String": Operation.string("String")
//]
//
//let pr = dictionary["String"]
//print(pr!)


//2) Обязательно познакомиться с документацией. Выписать около 5 примеров

enum CompassPoint {
    case north
    case south
    case east
    case west
}

enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

var directionToHead = CompassPoint.west

directionToHead = .east

directionToHead = .south
switch directionToHead {
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rises")
case .west:
    print("Where the skies are blue")
}

let somePlanet = Planet.earth
switch somePlanet {
case .earth:
    print("Mostly harmless")
default:
    print("Not a safe place for humans")
}

enum Beverage: CaseIterable {
    case coffee, tea, juice
}
let numberOfChoices = Beverage.allCases.count
print("\(numberOfChoices) beverages available")


//3) Создать по 1-2 enum разных типов.

enum Seasons {
    case winter
    case spring
    case summer
    case automn
}

enum Companies {
    case apple
    case samsung
    case google
    case yandex
    case tesla
}


/*
 4) Создать несколько своих enum, названия какие хотите: например, анкета сотрудника - пол, возраст,ФИО, стаж. Используйте switch как в видео.
 */

enum Resume {
    enum sex {
        case man
        case woman
    }
    case age
    case name
    case exp
}

let workerSex = Resume.sex.man

switch workerSex {
case .man:
    print("Добро пожаловать в нашу команду уважаемый работник!")
case .woman:
    print("Добро пожаловать в нашу команду уважаемая работница")
}


/*
 5) Создать enum со всеми цветами радуги. Создать функцию, которая содержит названия разных предметов или объектов. Пример результата в консоли "apple green", "sun red" и т.д.
 */

enum Colors: Int {
    case red
    case orange
    case yellow
    case green
    case lightBlue
    case blue
    case purple
}

func objectsColor(_ color: Colors) {
    let objects = ["apple", "car", "limon", "grass", "ocean", "plane", "grape"]
    switch color {
    case let objectColor:
        let object = objects[objectColor.rawValue]
        print("The \(object) is \(objectColor)")
    }
}

objectsColor(.red)
objectsColor(.orange)
objectsColor(.yellow)
objectsColor(.green)
objectsColor(.lightBlue)
objectsColor(.blue)
objectsColor(.purple)


//6) Создать функцию, которая выставляет оценки ученикам в школе.

enum Assessment {
    case excellent
    case well
    case satisfactory
    case badly
    case terribly
}

func gradesOfStudent(_ grades: Assessment) -> Int {
    switch grades {
    case .excellent:
        return 5
    case .well:
        return 4
    case .satisfactory:
        return 3
    case .badly:
        return 2
    case .terribly:
        return 1
    }
}

gradesOfStudent(.excellent)
gradesOfStudent(.well)
gradesOfStudent(.satisfactory)
gradesOfStudent(.badly)
gradesOfStudent(.terribly)


/*
 7) Создать Enum Vehicles. Добавить в него 3 вложенных Enum: Cars, Ships, Bikes. В каждом Enum добавить по 3 значения. Каждое значение имеет 2 ассоциативных типа (String, Int).
*/
 
enum Vehicles {
    enum cars {
        case bmw(String, Int)
        case audi(String, Int)
        case mercedes(String, Int)
    }
    enum ships {
        case titanic(String, Int)
        case moskva(String, Int)
        case evergreen(String, Int)
    }
    enum bikes {
        case ducatti(String, Int)
        case harley(String, Int)
        case jawa(String, Int)
    }
}


/*
 8) Создать функцию, принимающую в качестве параметра элемент Vehicles.Cars. C помощью switch вывести для найденного кейса ассоциативные значения с припиской «Печать из switch» и вызвать closure, в который передать ассоциативные значения. Closure должен выводить на печать эти значения с припиской «Печать из Closure». После этого провалиться в следующий элемент switch и вызвать secondClosure(), которая выводить в консоль «Печать из secondClosure» если передаете элемент, который в свиче последний. Третьей строчки быть не должно.
 */

func printCars(_ cars: Vehicles.cars, firstClosure: (String, Int) -> (), secondClosure: () -> ()) {
    var last = false
    switch cars {
    case .bmw(let name, let age):
        last = true
        print("Печать из switch \(name), \(age)")
        firstClosure(name, age)
        fallthrough
    case .audi(let name, let age):
        if last {
            fallthrough
        } else {
            last = true
            print("Печать из switch \(name), \(age)")
            firstClosure(name, age)
            fallthrough
        }
    case .mercedes(let name, let age):
        if last {
            secondClosure()
        } else {
            print("Печать из switch \(name), \(age)")
            secondClosure()
        }
    }
}


printCars(.bmw("540i", 2023), firstClosure: { name, age in
    print("Печать из firstClosure \(name), \(age)")
}, secondClosure: {
    print("Печать из secondClosure")
})


/*
 9) Создать enum House: Int c 5-ю case –ми и задайте им исходные значения. Создать в House вычисляемое свойство houseHeight, в котором выводить текущее значение * 100. Создать в House функцию в которой выводить на печать значение из вычисляемого свойства.
 */

enum House: Int {
    case firstRoom = 10
    case secondRoom = 12
    case thirdRoom = 9
    case bathRoom = 5
    case toilet = 3
    
    var sum: Int {
        return (House.firstRoom.rawValue + House.secondRoom.rawValue + House.thirdRoom.rawValue + House.bathRoom.rawValue + House.toilet.rawValue) * 100
    }
    
    func printHouseArea() {
        print(sum)
    }
}




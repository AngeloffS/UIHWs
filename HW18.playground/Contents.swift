import UIKit

/*
 1) Прочитать документацию по уроку из:
 https:// developer.apple.com
 swiftbook.ru.
 Выписать 5 примеров
 */

//final class Person {
//    var residence: Residence?
//}
//
//final class Residence {
//    var numberOfRooms = 1
//}
//
//let john = Person()
//
//if let roomCount = john.residence?.numberOfRooms {
//    print("John's residence has \(roomCount) room(s).")
//} else {
//    print("Unable to retrieve the numbers of rooms.")
//}
//
//john.residence = Residence()
//
//if let roomCount = john.residence?.numberOfRooms {
//    print("John's residence has \(roomCount) room(s).")
//} else {
//    print("Unable to retrieve the numbers of rooms.")
//}

//
//final class Person {
//    var residence: Residence?
//}
//
//final class Residence {
//    var rooms = [Room]()
//    var numberOfRooms: Int {
//        return rooms.count
//    }
//    subscript(i: Int) -> Room {
//        get {
//            return rooms[i]
//        }
//        set {
//            rooms[i] = newValue
//        }
//    }
//    func printNumberOfRooms() {
//        print("Общее количество комнат равно \(numberOfRooms)")
//    }
//    var address: Address?
//}

//final class Room {
//    let name: String
//    init(name: String) {
//        self.name = name
//    }
//}
//
//final class Address {
//    var buildingName: String?
//    var buildingNumber: String?
//    var street: String?
//    func buildingIdentifier() -> String? {
//        if let buildingNumber = buildingNumber, let street = street {
//            return "\(buildingNumber) \(street)"
//        } else if buildingName != nil {
//            return buildingName
//        } else {
//            return nil
//        }
//    }
//}
//
//let someAddress = Address()
//someAddress.buildingNumber = "29"
//someAddress.street = "Acacia Road"
//john.residence?.address = someAddress


//2) Повторить то, что есть в видео.

//final class Adress {
//    let street = "Тверская"
//    let number = 18
//}
//
//final class Home {
//    let adress = Adress()
//    let room: Int? = 3
//    var parking: Parking? = Parking()
//    func printRooms() {
//        print("The number of rooms is \(room)")
//    }
//}
//
//struct Parking {
//    var carPlace = 5
//}
//
//final class Parents {
//    var cars: [String]? = ["Mercedes"]
//    var home: Home? = Home()
//}
//
//let parents = Parents()
//
//parents.home?.parking?.carPlace
//
//if (parents.home?.parking?.carPlace) != nil {
//    print("Property установлено")
//} else {
//    print("Property не установлено")
//}
//
//parents.cars?[0]
//
//if (parents.home?.printRooms()) != nil {
//    print("Комнату уже можно печатать")
//} else {
//    print("Комнату нельзя печатать")
//}


/*
 3) Сделать класс Люди, у класса будут проперти родственники, соседи и т.д. (все опциональные).
 3.1) Создать нужно от 15 человек.
 3.2) Посчитать, сколько у этого человека двоюродных братьев, троюродных сестёр, теть, дядь, и т.д.
 */

final class People {
    
    var name = String()
    var parents: Parents? = Parents()
    var relatives: Relatives? = Relatives()
    var neighbours: Neighbours? = Neighbours()
    
    init(name: String) {
        self.name = name.capitalized
    }
}

final class Parents {
    
    var parent: [String]? = ["Victor", "Elena"]
}

final class Relatives {
    
    var ucnles: [String]? = ["Evgeniy", "Vitaliy"]
    var aunts: [String]? = ["Mariya", "Svetlana"]
    var brother: [String]? = ["Alex"]
    var sister: [String]? = ["Ann"]
}

final class Neighbours {
    
    var neigh: [String]? = ["Bek","Aydana", "Pavel", "Kristina", "Natalia", "Dmitry", "Yana"]
}

let peo = People(name: "Sergey")
let par = Parents()
let rel = Relatives()
let nei = Neighbours()

let countParents = par.parent?.count
let countUncles = rel.ucnles?.count
let countAunts = rel.aunts?.count
let countBrothers = rel.brother?.count
let countSisters = rel.sister?.count
let countNeighbours = nei.neigh?.count

if countParents != nil {
    print("У \(peo.name) \(countParents!) родитель(ей)")
} else {
    print("\(peo.name) из детдома:(")
}

if countUncles != nil {
    print("У \(peo.name) \(countUncles!) дядя(ь)")
} else {
    print("\(peo.name) нет дядь.")
}

if countAunts != nil {
    print("У \(peo.name) \(countAunts!) тетя(ь)")
} else {
    print("\(peo.name) нет теть.")
}

if countBrothers != nil {
    print("У \(peo.name) \(countBrothers!) брат(ьев)")
} else {
    print("\(peo.name) нет брата(ьев).")
}

if countSisters != nil {
    print("У \(peo.name) \(countSisters!) сестра(ер)")
} else {
    print("\(peo.name) нет сестры(ер).")
}

if countNeighbours != nil {
    print("У \(peo.name) \(countNeighbours!) сосед(ей)")
} else {
    print("\(peo.name) нет соседа(ей).")
}


//4) Создать класс животные и проперти - корова, коза, собака и т.д. Создать класс растения и проперти - трава, цветы и т.д.

final class Animals {
    
    private let animals: [String] = ["Korova", "Koza", "Sobaka"]
}

final class Plants {
    
    private let plants: [String] = ["Derevo", "Cveti", "Trava"]
}

//5) Положить все классы массив и отсортировать по алфавиту и по классу - Люди - животные - растения

let classes: [Any] = [
    Parents(),
    Relatives(),
    Neighbours(),
    Animals(),
    Plants()
]

let sortedArray = classes.sorted { $0 is People && $1 is Animals || $0 is Animals && $1 is Plants }

let sortedParrents = classes.filter { $0 is Parents }
let sortedRelatives = classes.filter { $0 is Relatives }
let sortedNeighbours = classes.filter { $0 is Neighbours }
let sortedAnimals = classes.filter { $0 is Animals }
let sortedPlants = classes.filter { $0 is Plants }


/*
6) Создать 3 класса Rectangle, Circle, Radius
Класс Квадрат свойства: circle: Circle?
Класс Radius свойства: radiusName: String
 Класс Circle свойства: area = [Radius]()
 6.1 Для класса Circle добавить вычисляемое свойство, выводящее количество элементов в area
 6.2 Для класса Circle добавить сабскрипт
геттер возвращает запрашиваем элемент
сеттер добавляет новый элемент в area
 6.3 Для класса Circle добавить функцию выводящую количество элементов в area
 6.4 Создать метод класса, для каждого из 3 классов, который описывает для чего этот класс предназначен.
 Создать экземпляры классов.Показать различные опциональные цепочки используя экземпляры классов, их методы и функции.
 Перед выводом в консоль результатов избавляемся от опционала.
 */

final class Rectangle {
    
    var circle: Circle?
    
    static func aboutRectangle() {
        print("Этот класс описывает квадрат")
    }
}

final class Circle {
    
    var area = [Radius]()
    lazy var areaCount = {
        return self.area.count
    }
    
    subscript(radiusName: String) -> Radius? {
        get {
            return area.first { $0.radiusName == radiusName }
        }
        set {
            area += [Radius(radiusName: radiusName)]
        }
    }
    
    func printArea() {
        print("\(area.count) элементов")
    }
    
    static func aboutCircle() {
        print("Этот класс описывает круг")
    }
}

final class Radius {
    
    var radiusName: String
    
    init(radiusName: String) {
        self.radiusName = radiusName
    }
    
    static func aboutRadius() {
        print("Этот класс описывает радиус")
    }
}

let rectangle = Rectangle()
let circle = Circle()
let radius = Radius(radiusName: "Radius N1")

rectangle.circle = circle

Radius.aboutRadius()
Rectangle.aboutRectangle()
Circle.aboutCircle()

rectangle.circle?.areaCount()
rectangle.circle?.area += [radius]

if let radius = rectangle.circle?["Radius N1"] {
    print(radius.radiusName)
}

rectangle.circle?["Radius N2"] = Radius(radiusName: "Radius N2")
if let radius = rectangle.circle?["Radius N2"] {
    print(radius.radiusName)
}

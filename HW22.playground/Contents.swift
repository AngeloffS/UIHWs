import UIKit

//1) Повторить код из урока.
//
//protocol OneProtocol {
//
//    var name: String { get set }
//    var age: String { get set }
//
//    //mutating func hello(text: String)
//}
//
//struct Parents: OneProtocol {
//
//    var age: String
//    var name: String
//}
//
//struct Kids: OneProtocol {
//
//    var name: String
//    var age: String
//}
//
//struct Cat: OneProtocol {
//
//    var age: String
//    var name: String
//}
//
//var parents1 = Parents(age: "Jack", name: "28")
//var parents2 = Parents(age: "Jina", name: "35")
//var kids = Kids(name: "Masha", age: "5")
//var cat = Cat(age: "Cat", name: "3")
//
//var array: [Any] = [parents1, parents2, cat, kids]
//
//for value in array {
//    if let parent = value as? Parents {
//        print(parent.name)
//    } else if let kids = value as? Kids {
//        print(kids.name)
//    }
//}
//
//var array1: [OneProtocol] = [parents1, parents2, kids, cat]
//
//func sortFamily(array: [OneProtocol]) {
//    for value in array {
//        print("\(value.name) - \(value.age)")
//    }
//}
//
//sortFamily(array: array1)


//4) Реализовать структуру IOSCollection и создать в ней copy on write как в уроке - https://youtu.be/QsoqHGgX2rE

struct IosCollection {
    var integer = 1
}

final class Ref<T> {
    var value: T
    init(value: T) {
        self.value = value
    }
}

struct Box<T> {
    var ref: Ref<T>
    
    init(value: T) {
        self.ref = Ref(value: value)
    }
    var value: T {
        get {
            ref.value
        }
        set {
            guard (isKnownUniquelyReferenced(&ref)) else {
                ref = Ref(value: newValue)
                return
            }
            ref.value = newValue
        }
    }
}

var int = IosCollection()
var firstBox = Box(value: int)
var secondBox = firstBox
secondBox.value.integer = 2


//5) Обьяснить в коментах кратко что такое: a) Copy on write, б) isKnownUniquelyReferenced(), в) strong, weak, unowned ссылки.

/*
 Copy on write(CoW) - оптимизация производительности памяти и ресурсов процессора. Работает она с value - type такими как структуры, массивы, словари. Работает путем создания копий исходных данных при попытки их изменения т.e не потребляя дополнительную память.
 
 isKnownUniquelyReferenced() - метод используемый для проверки того, является ли объект гарантированно ссылаемым. Если метод возвращает true, значит объект имеет только 1 ссылку и эта ссылка не может быть освобождена, пока существует уникальная ссылка.
 
 strong - ссылка на объект, которая гарантирует, что объект не будет удален пока на него ссылается хотя бы одна сильная ссылка.
 
 weak - ссылка на объект, которая указывает, что мы не хотим сохранять объект в памяти, пока на него не будет ссылаться хотя бы одна сильная ссылка
 
unowned - ссылка на объект, которая указывает, что мы предполагаем будет существовать в будущем, но не можем гарантировать сильную ссылку на него всегда.
 */


//6) Создать протокол переключатель с окончанием «able» как принято в свифт сообществе.

//7) В протокол перключатель добавить метод «переключать».(Все названия только на английском!).

//8) Создать enum Switcher который конформит (conform) протокол переключатель и у которого 2 кейса off, on.

//9) Создать обьект с выбраным кейсом, далее вызвать у обьекта метод переключения который меняет off на on например.


protocol Switchable {
    mutating func toggle()
}

enum Switcher: Switchable {
    
    case off
    case on
    
    mutating func toggle() {
        if self == .off {
            self = .on
        } else {
            self = .off
        }
    }
}

var switcher = Switcher.on
switcher.toggle()


//10) Создать протокол Movable с методом run, протокол Shootable с методом shoot.

protocol Movable {
    mutating func run()
}

protocol Shootable {
    mutating func shoot()
}


//11) Создать протокол HumanProtocol у которого есть свойство name и который конформит протоколы Movable и Shootable.

protocol HumanProtocol: Movable, Shootable {
    var name: String { get set }
}


//12) Создать класс Human, подписаться на протокол HumanProtocol и реализовать его, в методы добавить принты.

final class Human: HumanProtocol {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func run() {
        print("Я бегу")
    }
    
    func shoot() {
        print("Я стреляю")
    }
}

var person = Human(name: "Sergey")
person.run()
person.shoot()
person.name


/*
 13) Создать 2 класса и 1 структуру от каждого по одному экзепляру и все это сложить в один массив. Any, AnyObject, Наследование не использовать.
 */

protocol Family {
    
}

final class Man: Family {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

final class Girl: Family {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

struct Dog: Family {
    var name: String
}

let man = Man(name: "Alex")
let girl = Girl(name: "Alice")
let dog = Dog(name: "Charlie")

let arrayFamily: [Family] = [man, girl, dog]






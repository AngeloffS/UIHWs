import UIKit


//2) Проработать код из видео.

var str = "Делегирование"
//Delegate

//MARK: - Protocol

protocol RouterDelegate {
    var nameID: [String] { get set }
    func saveName(name: String, text: String)
}

protocol UsersProtocol {
    var name: String { get set }
    var age: Int { get set }
    var delegate: RouterDelegate? { get set }
    
    init(name: String, age: Int, delegate: RouterDelegate?)
}

//MARK: - Class

class Router: RouterDelegate {
    var nameID: [String] = []
    func saveName(name: String, text: String) {
        nameID.append(name)
        nameID.append(text)
    }
}

class User: UsersProtocol {
    var name: String
    var age: Int
    var delegate: RouterDelegate?
    
    func sendMail(name: String, text: String) -> Bool {
        delegate?.saveName(name: name, text: text)
        return true
    }
    
    required init(name: String, age: Int, delegate: RouterDelegate?) {
        self.name = name
        self.age = age
        self.delegate = delegate
    }
}

let routerDelegate = Router()
let user = User(name: "John", age: 23, delegate: routerDelegate)
user.sendMail(name: "Sergey", text: "Hello Sergey!")
user.sendMail(name: "Mama", text: "I m OK")

routerDelegate.nameID

//3) Создать протокол BatmanProtocol у которого свойство name.
//4) Добавить дефолтную реализацию протоколу BatmanProtocol через экстеншен добавить свое имя.
//5) Создать класс Batman подписатся на протокол BatmanProtocol, создать обьект класса и распечатать name.

protocol BatmanProtocol {
    var name: String { get set }
}

extension BatmanProtocol {
    static var defaultName: String {
        return "Sergey"
    }
}

final class Batman: BatmanProtocol {
    var name: String = defaultName
}

let batman = Batman()
print("Этому городу нужен новый герой \(batman.name)")


//6) Создать протокол с 2 мя методами 1 из них должен быть опциональным (optional).

@objc protocol SomeProtocol {
    
    func methodOne()
    @objc optional func methodTwo()
}


/*
7) Создать протокол с ассоциативным типом и создать 2 разных класса которые реализуют этот протокол. В 1 м классе 1 тип в другом другой тип.
 */

protocol AssociativeTypeProtocol {
    associatedtype AssocType
    var value: AssocType { get set }
}

final class FirstClass: AssociativeTypeProtocol {
    typealias AssType = String
    var value: String = "Hello"
}
final class SecondClass: AssociativeTypeProtocol {
    typealias AssType = Int
    var value: Int = 1
}


//8) Создать протокол GoToShopDelegate с методом run.
//9) Создать класс мама и класс сын. Использовать паттерн delegate что б мама отправляла сына за хлебом.

protocol GoToShopDelegate {
     func run()
}

final class Mom: GoToShopDelegate {
    let son: Son

    init(son: Son) {
        self.son = son
    }

    func run() {
        son.goToShop()
    }
}

final class Son {
    var delegate: GoToShopDelegate?

    func goToShop() {
        delegate?.run()
    }
}

let mom = Mom(son: Son())
let son = mom.son
son.delegate = mom
son.goToShop()

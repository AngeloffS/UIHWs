import UIKit

//Automatic reference counting(автоматический подсчет ссылок) = ARC

//1. Повторите то, что есть в видео.

//class Person {
//
//    var name = String()
//
//    init(name: String) {
//
//        self.name = name
//        print("\(name) инициализирован и создан в памяти")
//    }
//    deinit {
//
//        print("\(name) удален из памяти")
//    }
//}
//
//var ref1: Person?
//var ref2: Person?
//var ref3: Person?
//
//ref1 = Person(name: "Jack")
//ref2 = ref1
//ref3 = ref1
//
//ref1 = nil
//ref2 = nil
//ref3 = nil


//------------------Цикл сильных ссылок

//class Hotel {
//
//    var name = String()
//
//    init(name: String) {
//        self.name = name
//    }
//
//    var apart: Apartament?
//
//    deinit {
//        print("\(name) выезжает")
//    }
//}
//
//class Apartament {
//
//    var room = String()
//
//    init(room: String) {
//        self.room = room
//    }
//
//    weak var hotel: Hotel?
//
//    deinit {
//        print("Апартаменты \(room) освобождаются")
//    }
//}
//
//var objHotel: Hotel?
//var objApart: Apartament?
//
//objHotel = Hotel(name: "Jon Smith ")
//objApart = Apartament(room: "122")
//
//objHotel!.apart = objApart
//objApart!.hotel = objHotel
//
//objApart = nil
//objHotel = nil


//---------------Бесхозная ссылка(unowned)
 
//class Country {
//
//    let name: String
//    var capital: City!
//
//    init(name: String, capital: String) {
//        self.name = name
//        self.capital = City(name: capital, country: self)
//    }
//}
//
//class City {
//
//    let name: String
//    unowned let country: Country
//
//    init(name: String, country: Country) {
//        self.name = name
//        self.country = country
//    }
//}
//
//var country = Country(name: "Russia", capital: "Moscow")


/*
 2 . Описать несколько структур – любой̆ легковой̆ автомобиль и любой̆ грузовик.
 2.1 Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный̆ объем багажника.
 2.2 Описать перечисление с возможными действиями с автомобилем: запустить/заглушить, двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
 2.3 Добавить в структуры метод с одним аргументом типа перечисления, который̆ будет менять
 свойства структуры в зависимости от действия.
 2.4 Инициализировать несколько экземпляров структур. Применить к ним различные действия.
 2.5 Положить объекты структур в словарь как ключи! названия как строки, например:
 var dict = [structCar: "structCar"]
 */

struct Car: Hashable {
    
    let brand: String
    let year: Int
    let trunk: Int
    var engineCondit: Bool
    var windowsCondit: Bool
    let cargo: Int
    
    enum CarActions {
        case engineOn
        case engineOff
        case windowsOpen
        case windowsClose
        case loadCargo
        case unloadCargo
    }
    
    mutating func actions(action: CarActions) {
        switch action {
        case .engineOn:
            engineCondit = true
            print("The engine is on")
        case .engineOff:
            engineCondit = false
            print("The engine is off")
        case .windowsOpen:
            windowsCondit = true
            print("The windows are open")
        case .windowsClose:
            windowsCondit = false
            print("The windows are closed")
        case .loadCargo:
            if cargo != 0 && cargo <= trunk {
                print("The cargo is loaded")
            } else if cargo > trunk {
                print("The cargo is too big")
            } else {
                print("There is nothing to load")
            }
        case .unloadCargo:
            if cargo != 0 {
                print("The cargo is unloaded")
            } else {
                print("Trunk is empty")
            }
        }
    }
    
    mutating func startEngine(engineOn: CarActions) {
        engineCondit = true
    }
}

var car = Car(brand: "Maserati", year: 2023, trunk: 580, engineCondit: true, windowsCondit: false, cargo: 500)

struct Truck: Hashable {
    
    let brand: String
    let year: Int
    let trunk: Int
    var engineCondit: Bool
    var windowsCondit: Bool
    let cargo: Int
    
    enum TruckActions {
        case engineOn
        case engineOff
        case windowsOpen
        case windowsClose
        case loadCargo
        case unloadCargo
    }
    
    mutating func actions(action: TruckActions) {
        switch action {
        case .engineOn:
            engineCondit = true
            print("The engine is on")
        case .engineOff:
            engineCondit = false
            print("The engine is off")
        case .windowsOpen:
            windowsCondit = true
            print("The windows are open")
        case .windowsClose:
            windowsCondit = false
            print("The windows are closed")
        case .loadCargo:
            if cargo != 0 && cargo <= trunk {
                print("The cargo is loaded")
            } else if cargo > trunk {
                print("The cargo is too big")
            } else {
                print("There is nothing to load")
            }
        case .unloadCargo:
            if cargo != 0 {
                print("The cargo is unloaded")
            } else {
                print("Trunk is empty")
            }
        }
    }
    
    mutating func load(loadCargo: TruckActions) {
        windowsCondit = false
    }
}

var truck = Truck(brand: "Scania", year: 2023, trunk: 10000, engineCondit: false, windowsCondit: true, cargo: 10001)

let transportDict: [AnyHashable: String] = [car: "\(car.brand)", truck: "\(truck.brand)"]

    
//3. Почитать о Capture List (см ссылку ниже) - и описать своими словами и сделать скрин своего примера и объяснения

final class Vehicle {
    func ride() {
        print("Ride")
    }
}

//Сильный захват - используется по умолчанию, захватыевает значение и никогда не даст освободиться.

func rideFast() -> () -> Void {
    let maserati = Vehicle()
    
    let ridingFast = {
        maserati.ride()
        return
    }
    return ridingFast
}

//Слабый захват - всегда optional, не удерживаются и могут быть освобождены и установлены в nil.

func rideNormal() -> () -> Void {
    let volkswagen = Vehicle()
    
    var ridingNormal = { [weak volkswagen] in
        volkswagen?.ride()
        return
    }
    return ridingNormal
}

//Безхозная ссылка - альтернатива слабому захвату, но в случае чего приложение упадет как в случае с принудительным извлечением.

func rideSlow() -> () -> Void {
    let avtovaz = Vehicle()
    
    var ridingSlow = { [unowned avtovaz] in
        avtovaz.ride()
        return
    }
    return ridingSlow
}


//4. Набрать код на белом скрине, понять в чем там проблема и решить эту проблему

final class Cars {
    var driver: Man?
    
    deinit {
        print("Машина удалена из памяти")
    }
}

final class Man {
    weak var myCar: Cars?
    
    deinit {
        print("Мужчина удален из памяти")
    }
}

var cars: Cars? = Cars()
var man: Man? = Man()

cars?.driver = man
man?.myCar = Cars()

cars = nil
man = nil


/*
5. У нас есть класс мужчины и его паспорт. Мужчина может родиться и не иметь паспорта, но паспорт выдается конкретному мужчине и не может выдаваться без указания владельца. Чтобы разрешить эту проблему, ссылку на паспорт у мужчины сделаем обычной опциональной, а ссылку на владельца у паспорта – константой. Также добавим паспорту конструктор, чтобы сразу определить его владельца. Таким образом, человек сможет существовать без паспорта, сможет его поменять или выкинуть, но паспорт может быть создан только с конкретным владельцем и никогда не может его сменить. Повторить все, что на черном скрине и решить проблему соблюдая все правила!
*/

final class Mans {
    var pasport: Passport?
    
    deinit {
        print("Мужчина удален из памяти")
    }
}

final class Passport {
   unowned let mans: Mans
    
    init(mans: Mans) {
        self.mans = mans
    }
    
    deinit {
        print("Пасспорт удален из памяти")
    }
}

var mans: Mans? = Mans()
var passport: Passport? = Passport(mans: mans!)
mans?.pasport = passport

passport = nil
mans = nil


/*
 6. Создать класс «Ученик». Добавить свойство класса, в котором будет текущая дата. Добавить метод класса, которое выводит текст этого задания в виде многострочного литерала.
 */

final class Student {
    var currentDate: Date {
        return Date.now
    }
    
    func printDate() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY:MM:DD HH:MM:SS"
        
        print("\(dateFormatter.string(from: currentDate))")
    }
    
    func printTask() {
        
        let tasks = (" Создать класс «Ученик»", "Добавить свойство класса, в котором будет текущая дата", "Добавить метод класса, которое выводит текст этого задания в виде многострочного литерала.")
        print(tasks.0 + "\n" + tasks.1 + "\n" + tasks.2)
        
    }
}

let student = Student()
student.printDate()
student.printTask()


/*
 7. Создать класс «FlowСontrol» Добавить в класс 5 функций, каждая из которых будет использовать отдельный оператор управления потоком. (В одной массив прогоняется через цикл for, в другой через while, в третьей через repeat while) и т.д.Каждая функция возвращает результат своей работы. Создать enum c кейсами под каждую функцию. Создать экземпляр класса и продемонстрировать работу каждой функции используя значения перечисления.Функции напрямую управления потоком должны быть недоступными для вызова вне класса.
 */

final class FlowControl {
    
    func flowControll(flowType: FlowFunctions, array: [String]?, number: Int?, times: Int?, parameter: inout Int?, method: Car.CarActions?) -> Any {
          switch flowType {
          case .forIn: return forIn(array ?? [])
          case .ifElse: return ifElse(number ?? 0)
          case .repeatWhile: return repeatWhile(times ?? 0)
          case .repeatt: return whilee(&parameter)
          case .switchflow: return switchs(method ?? .engineOn)
          }
      }

    private func forIn(_ array: [String]) -> String {
        var result = String()
        for string in array {
            result += string
        }
        return result
    }

    private func whilee(_ parameter: inout Int?) -> Int {
        guard var parameter = parameter else {
            return 0
        }

        while parameter < 10 {
            parameter += 1
        }
        return parameter
    }

    private func repeatWhile(_ times: Int) -> String {
        var result = ""
        var counter = 0
        repeat {
            result += "a"
            counter += 1
        } while counter != times
        return result
    }

    private func ifElse(_ number: Int) -> Int {
        return number % 2 == 0 ? number : number * 2
    }

    private func switchs(_ method: Car.CarActions) -> String {
        switch method {
        case .engineOn: return "Двигатель работает"
        case .engineOff: return "Двигатель не работает"
        default: return "Иное"
        }
    }
}

enum FlowFunctions {
    case forIn
    case repeatt
    case repeatWhile
    case ifElse
    case switchflow
}

let flowController = FlowControl()

var paramter: Int? = nil

print(flowController.flowControll(flowType: .forIn, array: ["String", "Array"], number: nil, times: nil, parameter: &paramter, method: nil))

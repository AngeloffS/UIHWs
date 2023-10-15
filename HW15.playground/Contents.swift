import UIKit


//1) Повторите что было в уроке.

//var str = "Index или Субскрипты"

/*
 
class ИмяКласса {
 
 subscript(index: тип_Индекса) -> возвращаемый тип {
      get {
        возвратить значение и только чтение
 }
      set {
        записать имяЗначения по индексу
 }
 }
 }
 
 */

//var dic = ["key" : "value"]
//dic["key"]
//
//var array = ["mama", "papa"]
//array[1]
//
//struct Table {
//
//    var multi: Int
//    subscript(index: Int) -> Int {
//        get {
//            return multi * index
//        }
//    }
//}
//
//var tableResult = Table(multi: 10)
//tableResult[3]
//
//struct Man {
//    var man1 = "man1: Hello"
//    var man2 = "man2: Im good"
//    var man3 = "man3: Hi"
//
//    subscript(index: Int) -> String? {
//        get {
//            switch index {
//            case 0: return man1
//            case 1: return man2
//            case 2: return man3
//            default: return ""
//            }
//        }
//        set {
//            var value = newValue ?? ""
//
//            switch index {
//
//            case 0: return man1 = value
//            case 1: return man2 = value
//            case 2: return man3 = value
//            default: break
//            }
//        }
//    }
//}
//
//var say = Man()
//say[1] = "Hi Bob"
//
//
////2) Зайти в документацию и Выпишите окло 5 примеров.
//
//struct TimesTable {
//    let multiplier: Int
//    subscript(index: Int) -> Int {
//        return multiplier * index
//    }
//}
//
//let threeTimesTable = TimesTable(multiplier: 3)
//print("шесть умножить на три будет \(threeTimesTable[6])")
//
//struct Matrix {
//    let rows: Int, columns: Int
//    var grid: [Double]
//    init(rows: Int, columns: Int) {
//        self.rows = rows
//        self.columns = columns
//        grid = Array(repeating: 0.0, count: rows * columns)
//    }
//
//    func indexIsValid(row: Int, column: Int) -> Bool {
//        return row >= 0 && row < rows && column >= 0 && column < columns }
//
//    subscript(row: Int, column: Int) -> Double {
//        get {
//            assert(indexIsValid(row: row, column: column), "Index out of range")
//            return grid[(row * columns) + column]
//        }
//        set {
//            assert(indexIsValid(row: row, column: column), "Index out of range")
//            grid[(row * columns) + column] = newValue
//        }
//    }
//}
//
//var matrix = Matrix(rows: 2, columns: 2)
//
//matrix[0, 1]
//
//enum Planet: Int {
//    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
//    static subscript(n: Int) -> Planet {
//        return Planet(rawValue: n)!
//    }
//}
//let mars = Planet[4]
//print(mars)


/*
 3) Создать класс в котором будет массив в котором – «мама» «папа» и «дети». Создать sabscript для этого класса что б у класса был доступ как у массива по индексу.
 */

final class Family {
    
    let family = ["Мама", "Папа", "Дочь", "Сын"]
    
    subscript(member: Int) -> String {
        get {
            return family[member]
        }
    }
}

let family = Family()

family[0]
family[1]
family[2]
family[3]


//4) Создать сабскрипт который будет принимать число умножать его на 100 и делить на 2.

struct Calculate {
    
    var number = 100
    subscript(index: Int) -> Int {
        index * number / 2
    }
}

let result = Calculate()

result[2]


//5) Создать свой subscript у которого внутри есть оператор if else.

struct Example {
    
    var name: String
    
    subscript(logIn: Bool) -> String {
        if logIn {
            return "Welcome \(name.capitalized)!"
        } else {
            return "Sorry! Invalid Username/Password..."
        }
    }
}

let userOne = Example(name: "sergey")

userOne[true]
userOne[false]


//6) Создать класс Human и в нем 3 проперти имя , возраст пол.

class Human {
    
    var name: String
    var age: Int
    var sex: String
    
    var from: String {
        "I' am from"
    }
    
    init(name: String, age: Int, sex: String) {
        self.name = name
        self.age = age
        self.sex = sex
        
    }
    
    func autibiography() {
         print("Hello my name is \(name.capitalized).I'm \(age) years old and I'm \(sex)")
    }
}


//7) Создать ещё 2 класса которые наследуются от класса Human и переопределить методы и свойства .

final class UserOne: Human {
    
    override var from: String {
        super.from + " " + "Mars"
    }
    
    override func autibiography() {
        print("Hello my name is \(name.capitalized).I'm \(age) years old and I'm \(sex) - man")
        
    }
}

final class UserTwo: Human {
    
    override var from: String {
        super.from + " " + "Venus"
    }
    
    override func autibiography() {
        print("Hello my name is \(name.capitalized).I'm \(age) years old and I'm \(sex) - woman")
        
    }
}

let firstUser = UserOne(name: "Sergey", age: 28, sex: "M")
firstUser.autibiography()
firstUser.from


//8) Создать дикшинари который хранит все типы данных которые вы знаете, а ключ должен быть только строка.

let types: [String : Any] = [
    "Bool": Bool(),
    "Int": Int(),
    "Float": Float(),
    "Double": Double(),
    "String": String()]

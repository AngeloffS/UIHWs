import UIKit

//1) Повторите то, что было в видео.

/*
 func имяФункции(принимаемые параметры) -> вовзращаемые параметры {
 ... тело функции ...
 }
 */

//func sayFunc() {
//    print("Hi")
//}
//
//sayFunc()
//
//var arrayJournal = [String]()
//
//func addStudent(name: String, profession: String) {
//    arrayJournal.append(name)
//    arrayJournal.append(profession)
//
//    print(arrayJournal)
//}
//
//addStudent(name: "Jack", profession: "IOS Dev")
//addStudent(name: "Ivan", profession: "Android Dev")
//addStudent(name: "Jogn", profession: "Java Dev")
//
//func calculate(number1: Int, number2: Int) -> Int {
//    return number1 + number2
//}
//
//calculate(number1: 10, number2: 20)
//
//let sum = calculate(number1: 10, number2: 20)
//
//print(sum)

//var money = [1, 1, 52, 10, 70, 46, 46, 5, 2, 4]
//var money2 = [1, 32, 352, 130, 70, 46, 46, 5, 24, 34]
//
//func calcMoney(inArray: [Int]) -> Int {
//    var sum = 0
//    for num in inArray {
//        sum += num
//    }
//    return sum
//}
//
//calcMoney(inArray: money)
//let sum = calcMoney(inArray: money2)
//
//print(sum)
//
//func generalFunc(answer: Bool) -> () -> String {
//
//    func sayYes() -> String {
//        return "Yes"
//    }
//
//    func sayNo() -> String {
//        return "No"
//    }
//
//    return answer ? sayYes : sayNo
//}
//
//generalFunc(answer: true)()


//2) Зайти обязательно и познакомиться с документацией. Выпишите 5 примеров в плейграунд.

func greet(person: String) -> String {
    let greeting = "Привет, " + person + "!"
    return greeting
}

print(greet(person: "Anna"))


func greetAgain(person: String) -> String {
    return "Hello again, " + person + "!"
}

print(greetAgain(person: "Anna"))


func sayHelloWorld() -> String {
    return "hello, world"
}
print(sayHelloWorld())


func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person)
    } else {
        return greet(person: person)
    }
}
print(greet(person: "Tim", alreadyGreeted: true))


func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

let bounds = minMax(array: [8, -6, 2, 109, 3, 71])

print("min is \(bounds.min) and max is \(bounds.max)")


//3) Создать 4 функции:
//Которая ничего не принимает и ничего не возвращает.

func emptyFunc() {
    print("Empty")
}

//Принимает параметры но не возвращает.

func funcNumOne(name: String) {
    print("Hello \(name)")
}

//Принимает параметры и возвращает.

func funcNumTwo(name: String) -> String {
    return "Hello" + " " + name + "!"
}

print(funcNumTwo(name: "Sergey"))

//Не принимает параметры но возвращает тюпл из 3х параметров.

func funcNumThree() -> (Int, String, Bool) {
    return (1, "Hello", false)
}

let result = funcNumThree()


//4) Создать журнал для учителя, который будет принимать имя студента , профессию и оценку и записывает это все в массив. И внесите 10 студентов туда и распечатаете через цикл for.

var journal = [String]()

func addStudent(name: String, prof: String, score: Int) {
    journal.append(name)
    journal.append(prof)
    journal.append(String(score))
}

addStudent(name: "Sergey", prof: "Ios Dev", score: 5)
addStudent(name: "Mark", prof: "Android Dev", score: 4)
addStudent(name: "Andry", prof: "Java Dev", score: 3)
addStudent(name: "Antony", prof: "Go Dev", score: 2)
addStudent(name: "Jane", prof: "Web Dev", score: 1)
addStudent(name: "Alice", prof: "Designer", score: 2)
addStudent(name: "Vladimir", prof: "Dart Dev", score: 3)
addStudent(name: "Alex", prof: "Flutter Dev", score: 4)
addStudent(name: "Evgeniy", prof: "Ios Dev", score: 5)
addStudent(name: "John", prof: "Backend Dev", score: 4)

for student in journal {
    print(student)
}


//5) Создать функцию которая принимает имя и фамилию, потом положить это в массив и отсортировать и вывести результат в консоль.


var arrayFullName = [String]()

func nameSurname(name: String, surname: String) {
    arrayFullName.append(name)
    arrayFullName.append(surname)
    print(arrayFullName.sorted())
}
          
nameSurname(name: "Sergey", surname: "Angelov")
nameSurname(name: "Inna", surname: "Pavlova")
nameSurname(name: "Alex", surname: "Angelov")
nameSurname(name: "Eva", surname: "Angelova")


//6) Создать функцию которая принимает параметры и вычисляет площадь круга.

func circleS(radius: Double) -> Double {
    let pi = 3.14
    return radius * radius * pi
}

let circle = circleS(radius: 3)


//7) Создать те пустой массив кошелек, создайте функцию которая принимает массив в параметрах и в теле функции добавляет в этот массив значение 100. Далее вызовите массив и потом распечатайте значение массива.

var wallet = [Int]()

func balance(with amount: Int) {
    wallet.append(amount)
}

balance(with: 100)

print(wallet[0])


//8) Написать функцию в которой можно передавать в параметры каждый раз разное количество Int например иногда 1,5,9 а следующий раз 5,10, 11, 20, 50 функция все это посчитает и вернет сумму этих чисел.


func sum(nums: [Int]) -> Int {
    return nums.reduce(0, +)
}

let numbers = sum(nums: [1, 2, 3, 4, 5])


//9) Написать любую функцию которая вернет throws.


enum LoginErrors: Error {
    case badLog
    case badPass
}

func errorThrows(log: String, pass: String) throws -> Bool {
    if log.isEmpty { throw LoginErrors.badLog }
    if pass.isEmpty { throw LoginErrors.badPass }
    return true
}

do {
    try errorThrows(log: "Angelov", pass: "2571883")
} catch {
    print(error.localizedDescription)
}

import UIKit

//1) Прочитать документацию. Выпишите около 5 примеров

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backward(_ s1: String, _ s2: String) -> Bool {
    s1 > s2
}

var reversedNames = names.sorted(by: backward)


reversedNames.sort(by: { $0 > $1 })


func someFunctionThatTakesAClouser(clouser: () -> Void) {
    
}

someFunctionThatTakesAClouser() {
    
}


let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

let strings = numbers.map { (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}


var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
  completionHandlers.append(completionHandler)
}

func someFunctionWithNoneЕscapingClosure(closure: () -> Void) {
    closure()
}
 
class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 }
        someFunctionWithNoneЕscapingClosure { x = 200 }
    }
}
 
let instance = SomeClass()
instance.doSomething()
print(instance.x)
 
completionHandlers.first?()
print(instance.x)


//2) Повторить то, что есть в видео.

/* Замыкания являются анонимными функциями, которые можно передавать в качестве аргументов другим функциям
 {
 (параметры) -> возвращаемый тип in
 операторы
 }
 */

//let names = ["Максим", "Сергей", "Николай", "Артем", "альберт", "Том"]
//
//let s = names.sorted()

//(String, String) -> Bool

//let t1 = names.sorted { (s1: String, s2: String) -> Bool in
//    return s1 < s2
//}
//
//let t2 = names.sorted { (s1, s2) in return s1 < s2 }
//let t3 = names.sorted { (s1, s2) in s1 < s2 }
//let t4 = names.sorted { (s1, s2) in s2 < s1 }
//let t5 = names.sorted { (s1, s2) in s1.count < s2.count }


//Автоматические имена аргументов

//let p1 = names.sorted(by: { $0 < $1 })
//let p2 = names.sorted(by: { $0 > $1 })
//let p3 = names.sorted(by: { $0.count > $1.count})


// Захват значений

//func makeTranslator(stroka: String) -> (String) -> (String) {
//    return { (name: String) -> String in return (stroka + " " + name) }
//}
//
//var englishWelcome = makeTranslator(stroka: "Hi")
//
//englishWelcome("Jack")
//
//var russianWelcome = makeTranslator(stroka: "Привет")
//
//russianWelcome("Евгений")


//3) Написать сортировку массива с помощью замыкания, сначала в одну сторону, затем в другую. Вывести всё в консоль.

var arrayNumbers = [2, 4, 70, 31, 8, 15, 47, 9, 100]

print(arrayNumbers.sorted { $0 > $1})
print(arrayNumbers.sorted { $0 < $1})


//4) Создать метод который запрашивает имена друзей, после этого имена положить в массив. Массив отсортировать по количеству букв в имени.

var namesArray = [String]()

func friendsName(_ friend: String) {
    namesArray.append(friend)
    print(namesArray.sorted { $0.count > $1.count })
}

friendsName("Sergey")
friendsName("Alex")
friendsName("Eva")
friendsName("Inna")


//5) Что такое closure

/*
 это анонимные функции, которые могут принимать другие функции в качестве аргументов и возвращать их результат.
 */


//6) Написать что такое хвостовое замыкание. Привести пример.

/*
 это параметр функции который пишется в конце.
 */

print(namesArray.sorted { $0.count > $1.count })


//7) Написать что такое сбегающее замыкание. Привести пример.

/*
 это замыкание которое передается в функцию в качестве аргумента и вызывается уже после того, как функция вернула значение.
 Чтобы указать, что замыкание может сбежать пишем @escaping до типа параметра.
 */

func runTask(completion: @escaping (Error?) -> ()) {
  completion(nil)
}


//8) Написать что такое autoclosures. Привести пример.

/*
 это конструкции, которые позволяют создавать замыкания без явного указания их параметров. Они создаются автоматически на основе контекста, в котором они используются.
 */

func addSub(n: Int) -> (Int) -> Int {
  { n + $0 }
}

let double = addSub(n: 10)
double(5)
double(10)


//9) Создайте переменную типа ()->(). В теле кложуры создайте словарь (типы значений на ваш выбор) из 10 элементов и распечатайте пары (ключ: значение). Вызовите ниже вашу кложуру.

let closure: () -> () = {
    var dictionary = [1: "one", 2: "two", 3: "three", 4: "four", 5: "five", 6: "six", 7: "seven", 8: "eight", 9: "nine", 10: "ten"]
    
    for (key, value) in dictionary.sorted(by: <) {
            print("\(key) -> \(value)")
        }
    }

closure()


//10) Создать массив из 10 элементов с помощью map каждый элемент умножить на 10, преобразовать в массив String с помощью compactMap, отфильтровать c помощью .filter. Оставить значения с количеством символов больше 2.Вывести результат в консоль.

var arrayNum = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

arrayNum.map { $0 * 10 }

var stringArrayNum = arrayNum.compactMap { String($0) }

stringArrayNum = stringArrayNum.filter { $0.count >= 2 }

print(stringArrayNum)


//11) Создать кложуру которая принимает коэффициенты квадратного уравнения и возвращает его корни. Для примеры решаем это уравнение: x2 − 8x + 12 = 0;


func solution(a: Double, b: Double, c: Double) -> Double {
  let d = b * b - 4 * a * c
  return (-b + Double(sqrt(d))) / (2 * a)
}

let x1 = solution(a: 1, b: -8, c: 12)
let x2 = solution(a: -1, b: 8, c: -12)

print("X1 = \(x1) , X2 = \(x2)")


//12) Вызовите ниже кложуру и в ее теле вывести произвольный текст. Преобразовать функцию с кложурой на скрине к функции с автокложурой. Вызвать и в теле вывести произвольный текст. Описать разницу между двумя вариантами.

func closureExample(saySomething: () -> ()) {
    saySomething()
}

closureExample { print("Hi!") }

func autoClosure(saySomething: @autoclosure () -> ()) {
    saySomething()
}

autoClosure(saySomething: print("Hi!"))

//Разница в { }

//13) Написать функцию принимающую два параметра: первый параметр [Int] второй замыкание (_ result: [String] -> ()) переданный массив преобразовать к массиву String и вернуть в замыкании. Вызвать функцию и распечатать полученный результат в консоль. Функцию вызвать 3 раза:
//1) В ПОЛНОМ синтаксисе, c указанием типа замыкания, замыкание внутри скобок функции)
//2) С неявным возвратом значения (без указания типа), выносом за скобки
//3) С сокращенным имени параметра ($0), выносом за скобки

func newFunc(firstParametr: [Int], _ result: ([String]) -> ()) {
    let stringsArray = firstParametr.compactMap { String($0) }
    result(stringsArray)
}

newFunc(firstParametr: [1, 2, 3], { (stringsArray: [String]) -> () in
    print(stringsArray) })

newFunc(firstParametr: [1, 2, 3]) { stringsArray in
    print(stringsArray) }

newFunc(firstParametr: [1, 2, 3]) { print($0) }


//14) Написать функцию которая будет принимать ключи, выводить ключи и значения словаря (Dictionary). Тип ключа и значения выбирайте сами.

func printKeyValue<Key, Value>(_ dictionary: [Key: Value], _ keys: [Key]) {
  var keyValue = [(Key, Value)]()
  keys.forEach { key in
      if let value = dictionary[key] {
      keyValue.append((key, value))
    } else {
      print("Key \(key) not found!")
    }
  }
  print("\(keyValue)")
}


//15) Написать функцию, которая принимает пустые массивы(один строковый, второй - числовой) и проверяет их: если пустой - то добавить значения и вывести в консоль.

func emptyTest(stringArray: [String], intArray: [Int]) {
    if stringArray.isEmpty {
        print("Строковый массив пуст")
    } else {
        stringArray.forEach { print($0) }
    }
    if intArray.isEmpty {
        print("Числовой массив пуст")
    } else {
        intArray.forEach { print($0) }
    }
}





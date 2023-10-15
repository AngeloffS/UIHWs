import UIKit


////1) Повторить то, что есть в видео.
//
//var str = "Дженерики"
//
////Generic
//
//var stringArray = ["Hi", "Hello", "Good Bye"]
//var intArray = [1, 2, 3, 4, 5, 3]
//var doubleArray = [1.2, 1.5, 4.5]
//
////Generic ex 1
//
//func printElementFromArray<T>(a: [T]) {
//    for elements in a {
//        print(elements)
//    }
//}
//
//printElementFromArray(a: stringArray)
//printElementFromArray(a: intArray)
//printElementFromArray(a: doubleArray)
//
////Generic ex 2
//
//func doNothing<T>(x: T) -> T {
//    return x
//}
//
//doNothing(x: "mama")
//doNothing(x: 1234)
//doNothing(x: true)
//
////Generic ex 3
//
//var emptuArray = [String]()
//
//struct GenericArray<T> {
//    var items = [T]()
//    mutating func push(item: T) {
//        items.append(item)
//    }
//}
//
//var myFriendsList = ["Vova", "Bob", "Klim"]
//
//var arrays = GenericArray(items: myFriendsList)
//
//arrays.push(item: "Nick")
//
//
///*
// 2) Зайти в документацию открыть тему generic и руками набрать пол главы разобраться как это работает
// */
//
//func swapTwoInts(_ a: inout Int, _ b: inout Int) {
//    let temporaryA = a
//    a = b
//    b = temporaryA
//}
//
//var someInt = 3
//var anotherInt = 107
//swapTwoInts(&someInt, &anotherInt)
//print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
//
//func swapTwoStrings(_ a: inout String, _ b: inout String) {
//    let temporaryA = a
//    a = b
//    b = temporaryA
//}
//
//func swapTwoDoubles(_ a: inout Double, _ b: inout Double) {
//    let temporaryA = a
//    a = b
//    b = temporaryA
//}
//
//func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
//    let temporaryA = a
//    a = b
//    b = temporaryA
//}
//
//var someString = "hello"
//var anotherString = "world"
//swapTwoValues(&someString, &anotherString)
//
//struct IntStack {
//    var items = [Int]()
//    mutating func push(_ item: Int) {
//        items.append(item)
//    }
//    mutating func pop() -> Int {
//        return items.removeLast()
//    }
//}
//
//struct Stack<Element> {
//    var items = [Element]()
//    mutating func push(_ item: Element) {
//        items.append(item)
//    }
//    mutating func pop() -> Element {
//        return items.removeLast()
//    }
//}
//
//var stackOfStrings = Stack<String>()
//stackOfStrings.push("uno")
//stackOfStrings.push("dos")
//stackOfStrings.push("tres")
//stackOfStrings.push("cuatro")
//

/*
 3) Создать любой generic для классов, структур, методов, перечислений (по 1 на каждый).
 */

final class PrintElements<T> {
    private var element: T
    
    init(element: T) {
        self.element = element
    }
    
    func printElement() {
        print(element)
    }
}

let element = PrintElements(element: "123")
element.printElement()

struct AddSomething<T> {
    private var array = [T]()
    
    mutating func addInArray(_ item: T) {
        return array.append(item)
    }
}

var arrayStruct = AddSomething<String>()
arrayStruct.addInArray("Sergo")

enum randomElements<T> {
    case string(T)
    case int(T)
    case double(T)
    case bool(T)
}

let randomOne = randomElements.string("Generic")
let randomTwo = randomElements.int(1)
let randomThree = randomElements.double(2.3)
let randomFour = randomElements.bool(true)


//4) Написать функцию, которая принимает Generic объект и складывает в массив/словарь (на выбор)

struct Generics<T> {
    private var genericsArray = [T]()
    
    mutating func appendGeneric(_ item: T) -> [T] {
        genericsArray.append(item)
        return genericsArray
    }
}

var addGeneric = Generics<String>()

addGeneric.appendGeneric("One")
addGeneric.appendGeneric("Two")


//5) Создать класс, который сортирует массивы значений (на ваш выбор) 3 разными способами.

final class Sorter<T> {
    
    func sortByAlphabet<T: Comparable>(_ array: [T]) -> [T] {
        return array.sorted { $0 < $1 }
    }
    
    func sotrByCount(_ array: [String]) -> [String] {
        return array.sorted { $0.count < $1.count }
    }
    
    func sortByRandom<T>(_ array: [T]) -> [T] {
        return array.shuffled()
    }
}


/*
 6) Написать класс на свой вкус (любые методы, проперти) универсального типа. Используя extension, расширить класс, добавить сабскрипт.
 */

final class GuestList<T: Comparable> {
    private var guestsArray = [T]()

    func guestArrive(_ guest: T) -> [T] {
        guestsArray.append(guest)
        return guestsArray
    }
}

extension GuestList {
    subscript(_ array: [T]) -> [T] {
        var sortedArray = array
        sortedArray.sort()
        return sortedArray
    }
}

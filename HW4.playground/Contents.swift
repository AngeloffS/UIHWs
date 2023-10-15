import UIKit

let dollarsArray = [1, 2, 5, 10, 20, 50, 100, 1000]

let sum = dollarsArray.reduce(0, +)

print(sum)


let daysArray = [31, 28, 31, 30, 31, 30, 31, 31, 31, 30, 31, 30, 31]

for day in daysArray {
    print(day)
}


let monthArray = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

for monthDays in 0..<monthArray.count {
    print("В месяце \(monthArray[monthDays]) - \(daysArray[monthDays]) дней.")
}


let monthTuples = ["January": 31, "February": 28, "March": 31, "April": 30, "May": 31, "June": 30, "July": 31, "August": 31, "September": 31, "October": 31, "November": 30, "December": 31]

for (key, value) in monthTuples {
    print("В месяце \(key) - \(value) дней.")
}



var index = monthArray.count - 1
 
for reversed in 0..<monthArray.count {
    print("В месяце \(monthArray[(reversed + index)]) - \(daysArray[reversed + index]) дней.")
    index -= 2
}


var array = ["array"]

for word in array {
    while array.count != 30 {
        array.append(word)
    }
}

print(array)


let randomArray: [Any] = [35, true, 28, false, "Hello", "Hi", 1, "Yes"]

var newArray = [String]()



for object in randomArray where object is String {
    
    print(object)
}



let arrayTwoD = [["Hello", "Hi"], ["Привет"], [".", "Как","твои"], ["дела?"]]
var arrayOneD = [String]()

for array in arrayTwoD {
    for string in array {
        arrayOneD.append(string)
    }
}

print(arrayOneD)


if arrayOneD.isEmpty {
    print("Yes")
} else {
    print("No")
}


if arrayOneD.contains("Привет") {
    print("Содержит слово привет")
} else {
    print("Не содержит слово привет")
}


var arrayInt = [Int]()

for number in 1...10 {
    arrayInt.append(number)
}

print(arrayInt)

let newArrayInt = arrayInt[3...8]
print(newArrayInt)


let secondArrayInt = arrayInt[3..<9]
print(secondArrayInt)


var cars = ["Audi", "Mercedes", "Maserati", "Lamborghini", "Porsche", "BMW"]

cars.sort()

cars.sort(by: >)


/*
 sort - меняет исходный массив
 sorted - возвращает отсортированный массив, не меняя исходный
 */


let arrayNumbers = [22, 41, 23, 80, 33, 83, 56, 42, 11, 98, 120, 6, 84, 1]

arrayNumbers.min()
arrayNumbers.max()
arrayNumbers.first
arrayNumbers.last
arrayNumbers.dropLast()
arrayNumbers.dropFirst()

print(arrayNumbers)

/*
 remove - удаляет и возвращает элемент
 drop - возвращает новый массив без элемента, не изменяя текущий
 */


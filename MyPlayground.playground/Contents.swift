import Foundation

/*var astronauts = ["John": 1, "Sergey": 2, "Andrew": 0]

for (astronaut, mealCount) in astronauts {
    print(astronaut, mealCount)
}

let name = "Sergey"

for char in name {
    print(char)
}

let greetings = "Hi! My name is Sergey."

var alienGreetings = ""
for char in greetings {
    if char == " " {
        continue
    }
    alienGreetings.append(char)
}

print(alienGreetings)

let ourDigits = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

var alienDigits = [Int]()

for digit in ourDigits {
    if digit > 2 {
        break
    }
    
    alienDigits.append(digit)
}

print(alienDigits)

alienDigits.forEach{ print($0)}



func sum(a: Int, b: Int) -> Int {
    return a + b
   
}


let numbers = [1, 2, 3, 4, 5]

var arraySum = 0

for number in numbers {
    
    arraySum += number
}

print(arraySum)

let numbersTwo = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

var maxNumber = numbersTwo[0]

for number in numbersTwo {
    if number > maxNumber {
        maxNumber = number
    }
}

print(maxNumber)

var arrayString = ["Alex", "Igor", "Max", "John"]

arrayString.sort()

print(arrayString)


var arrayThree = [1, 2, 3, 4, 5, 6]

var newArray = [Int]()

for i in 0..<arrayThree.count {
    let number = arrayThree[i]
    if number % 2 == 0 {
        newArray.append(number)
    }
}

print(newArray)

var arrayA = [1, 2, 5, 7, 8]
var arrayB = [3, 9, 0, 10]

var arrayC = [Int]()

arrayC = arrayA + arrayB

print(arrayC)


var setOne: Set<Int> = [1, 2, 3]
print(setOne)

setOne.insert(5)
print(setOne)

let set1: Set<String> = ["apple", "banana", "cherry"]
let set2: Set<String> = ["apple", "cherry", "kiwi"]

let intersection = set1.intersection(set2)

print(intersection)

let set3: Set<Int> = [1, 3, 5, 8, 4]
let set4: Set<Int> = [1, 6, 9, 4, 3]

let intersection1 = set3.intersection(set4)

print(intersection1)

let substracting = set3.subtracting(set4)

print(substracting)


let numbers1 = [1, 3, 1, 5, 6, 7, 9]

let uniqNumbers = Array(Set(numbers1))

print(uniqNumbers)

let people = [["name": "John"], ["name": "Sergey"], ["name": "Alex"]]

for person in people {
    if let name = person["name"] {
        
        print(name)
        
    }
    
}

let count = 1...10

for number in count {
    
    print("Number is \(number)")
}

for _ in 1...5 {
    print("Hello")
}

for index in 0...9 {
    
    print("\(index) умножить на 3 равно \(index * 3)")
    

}


var number4 = 4

while number4 <= 20 {
    print(number4)
    number4 += 1
}

print("Start")

repeat {
    print(number4)
    number4 += 1
} while number4 <= 20
            
            print("Start")
            
var countDown = 10
            
            while countDown >= 0 {
    print(countDown)
    
    if countDown == 4 {
        
        print("Go Down")
        
        break
        
    }
    
    countDown -= 1
} */

/*var products = ["Iphone": 999, "MacBook": 1299, "iPad": 799, "iWatch": 399]

let highestPrice = products.values.max()

let mostExpensiveProduct = products.filter{$0.value == highestPrice}
    .keys
    .first

print("The most expensive product is \(mostExpensiveProduct!) with price \(highestPrice!)")

var students = ["Sergey": 27, "Andrew": 25, "Alex": 18]

let smallStudent = students.values.min()

let mostSmallStudents = students.filter{$0.value == smallStudent}
    .keys
    .first

print("The yongest student is \(smallStudent!) with age \(mostSmallStudents!)")

let people  = [["name": "John", "age": 27],
               ["name": "Sarah", "age": 25],
               ["name": "Sergey", "age": 30],
               ["name": "Inna", "age": 35]]

let sortedPeople = people.sorted {
    if let age1 = $0["age"] as? Int, let age2 = $1["age"] as? Int {
        return age1 < age2
    }
    return false
}

print(sortedPeople)*/


/*for i in 0...200 {
    if i == 15 {
        break
    }
       print(i)
}

var age = 22

if age < 6 {
    print("Go v sadik")
} else if age > 6 && age < 18 {
    print("Go v shkolu")
} else if age > 18 && age < 22 {
    print("Go v univer")
} else if age >= 22 {
    print("Pizdui na rabotu rab")
}

switch age {
case 0...6:
    print("Go v sadik")
case 6...18:
    print("Go v shkolu")
case 18...22:
    print("Go v univer")
case  22...65:
    print("Pizdui na rabotu rab")
default:
    break

}

var family = ["Inna", "Sergey", "Eva"]

family.sort()

print(family)
 */

func researchPlanet(shipName: String, planetName: String) -> [String] {
    
    print("Sudno \(shipName) pristupilo k issledovaniu planeti \(planetName)")
    
    var foundSpecies: [String] = []
    
    print("Sudno \(shipName) issledovalo planetu \(planetName)")
    
    return foundSpecies
}

let foundSpeciesResult = researchPlanet(shipName: "Soyz", planetName: "Earth")

print(foundSpeciesResult)

print("Naideno \(foundSpeciesResult.count) form jizni")


func researchSystem(shipName: String,  systemName: String, systemPlanets: [String]) -> [String] {
    
    print("Sudno \(shipName) pribilo v sistemu \(systemName)!")
    print("Predstoit izujit \(systemPlanets.count) planet\n")
    
    var foundSpeciesInSysytem: [String] = []
    
    for planetName in systemPlanets {
        let foundSpeciesOnPlanet = researchPlanet(shipName: shipName, planetName: planetName)
        foundSpeciesInSysytem.append(contentsOf: foundSpeciesOnPlanet)
        print("Na planete \(planetName) naideno \(foundSpeciesOnPlanet.count)")
    }
    
    print("Sudno \(shipName) pokidaet sistemy \(systemName)")
    
    return foundSpeciesInSysytem
}


func researchGalaxy(shipName: String, galaxyName: String, systemWithPlanets: [(String, [String])]) -> [String] {
    
    print("Pristupaem k izu4eniy galaktiki \(galaxyName)")
    print("Predstoit izu4it \(systemWithPlanets.count) sistem/n")
    
    var foundSpeciesInGalaxy: [String] = []
    
    for (systemName, systemPlanets) in systemWithPlanets {
        
        let foundSpeciesInSysytem = researchSystem(shipName: shipName, systemName: systemName, systemPlanets: systemPlanets)
        
        foundSpeciesInGalaxy.append(contentsOf: foundSpeciesInSysytem)
        
        print("V sisteme \(systemName) naideno \(foundSpeciesInSysytem.count)")
    }
    
  print("Issledovanie galaktiki \(galaxyName) zaversheno!")
    
    return foundSpeciesInGalaxy
    
}

let shipName = "Soyz"
let galaxyName = "Mle4niy put"

let systemWithPlanets = [("Arkanis", ["Tatuin"]), ("Solne4naya sistema", ["Mars", "Earth", "Pluton"])]

let foundSpeciesInGalaxy = researchGalaxy(shipName: shipName, galaxyName: galaxyName, systemWithPlanets: systemWithPlanets)

print("Naideno \(foundSpeciesInGalaxy.count) form jizni")

func sayHello(personName: String) {
    print("Hello \(personName)")
}

sayHello(personName: "Sergey")



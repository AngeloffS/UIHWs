import UIKit

struct Person {
    
    let firstName: String
    let lastName: String
    let age: Int
}

func details(of person: Person) -> String {
    return "\(person.firstName), \(person.lastName),\(person.age)"
}

var personJoe = Person(firstName: "John", lastName: "Joe", age: 28)

var personJoeCopy = personJoe

details(of: personJoe)

struct Rectagle {
    
    let width: Double
    let height: Double
    
    func area() -> Double {
        
        return width * height
    }
}


var rectagle = Rectagle(width: 10.0, height: 5.0)

rectagle.area()

struct Adress {
    
    let street: String
    let city: String
    let zipCode: String
    
}

struct Book {
    
    let title: String
    let author: String
    let pages: Int
    let price: Double
    
}

func books(lessThan price: Double, from books: [Book]) -> [Book] {
    
    var filteredBooks = [Book]()
    for book in books {
        if book.price < price {
            filteredBooks.append(book)
        }
    }
    return filteredBooks
}

struct BankAccount {
    private(set) var balance: Double
    private(set) var transactionHistory: [String] = []

    mutating func deposit(_ amount: Double) {
        balance += amount
        transactionHistory.append("Пополнение счёта \(amount) руб.")
    }

    mutating func withdraw(_ amount: Double) -> Bool {
        if amount > balance {
            return false
        } else {
            balance -= amount
            transactionHistory.append("Снятие наличных \(amount) руб.")
            return true
        }
    }
}

var account = BankAccount(balance: 100.0)
print(account.balance) // 100.0

account.deposit(50.0)
print(account.balance) // 150.0
print(account.transactionHistory) // ["Пополнение счёта 50.0 руб."]

account.withdraw(25.0)
print(account.balance) // 125.0
print(account.transactionHistory) // ["Пополнение счёта 50.0 руб.", "Снятие наличных 25.0 руб."]

struct Student {
    var name: String
    private(set) var age: Int

    var grade: Int {
        didSet {
            age = grade + 6
        }
    }

    init(name: String, age: Int, grade: Int) {
        self.name = name
        self.age = age
        self.grade = grade
    }
}

     var student = Student(name: "Аня", age: 12, grade: 7)
     print(student.age) // 12
     print(student.grade) // 7

     student.grade = 8
     print(student.age) // 14
     print(student.grade) // 8

struct TaskManager {
    private(set) var tasks: [Task] = []

    mutating func addTask(_ task: Task) {
        var task = task
        task.createdAt = Date()
        tasks.append(task)
    }
}

struct Task {
    var title: String
    fileprivate(set) var createdAt: Date?
}

var taskManager = TaskManager()
taskManager.addTask(Task(title: "Убрать квартиру"))
print(taskManager.tasks[0].title) // Убрать квартиру
print(taskManager.tasks[0].createdAt != nil) // true


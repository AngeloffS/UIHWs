import UIKit


//1) Повторить то, что есть в видео.

//struct Observer {
//
//    var name: String {
//        willSet {
//            print("Внимание! Значение хочет поменяться на" + " " + newValue)
//        }
//        didSet {
//            print("Didset" + " " + oldValue)
//
//            if name != "" {
//                name = name.capitalized
//            }
//        }
//    }
//}
//
//var obser = Observer(name: "Jack")
//
//obser.name
//obser.name = "ivan"
//
//print(obser.name)
//
//struct ComputerProperty {
//
//    var firstName: String {
//        didSet {
//            if firstName != ""{
//                firstName = firstName.capitalized
//            }
//        }
//    }
//    var lastName: String
//
//    var fullname: String {
//        get {
//            return firstName + " " + lastName
//        }
//        set {
//            print("Setter is work" + " " + newValue)
//        }
//    }
//}
//
//var compProp = ComputerProperty(firstName: "Kuky", lastName: "Smith")

 
/*
 2) Создать класс "Students", добавить ему property: dateOfBirth, skills. Для тренировки. Создавайте свои структуры с разными видами свойств: сохраняемые/не сохраняемые, вычисляемые, свойства типа и т.д.
 */

class Students {
    
    var name: String {
        didSet {
            if name != "" {
                name = name.capitalized
            }
        }
    }
    var dateOfBirth: String
    var skills: [String]
    
    init(name: String, dateOfBirth: String, skills: [String]) {
        self.name = name
        self.dateOfBirth = dateOfBirth
        self.skills = skills
    }
}

var studentOne = Students(name: "Sergey", dateOfBirth: "01.10.1995", skills: ["Swift", "English"])

struct Cat {

    var name: String {
        didSet {
            if name != "" {
                name = name.capitalized
            }
        }
    }
    let dateOfBirth: Int
    var age: Int {
        return 2023 - dateOfBirth
    }
    static let sound = "Miy"
}

let cat = Cat(name: "Sonya", dateOfBirth: 2015)
Cat.sound
cat.age
cat.name
cat.dateOfBirth


/*
3) Написать структуру "CreateTriangle",с двумя свойствами - угол A, угол C. И создать 2 вычисляемых свойства - те же угол А, угол С. И если мы записываем значения в эти углы - результатом должно быть значение третьего угла. Для простоты можно взять прямоугольный треугольник, сумма углов которого равна 180 градусов.
*/

struct CreateTriangle {
    
    let angleA: Double
    let angleC: Double
    var angleB: Double {
        return 180 - (angleA + angleC)
    }
}

let triangleOne = CreateTriangle(angleA: 45, angleC: 50)

print(triangleOne.angleB)


/*
 4) Создать структуру "Резюме", у которой есть такие свойства:
 - Фамилия,
 - Имя.
 - Должность,
 - Опыт,
 - Контактные данные(телефон, емейл),
 - О себе(можно записать какие-то пару предложений
 на выбор)
 */

struct Resume {
    
    var name: String {
        didSet {
            if name != "" {
                name = name.capitalized
            }
        }
    }
    var surName: String {
        didSet {
            if surName != "" {
                surName = surName.capitalized
            }
        }
    }
    let jobTitle: String
    let exp: Double
    let contactInfo: String
    let info: String
}

let firstResume = Resume(name: "Sergey", surName: "Angelov", jobTitle: "IOS Developer", exp: 3.5, contactInfo: "+7 (999) 857 18 83", info: "I love my job")

print(firstResume)


/*
 5) Задание на закрепление предыдущих тем: Создать журнал, что б можно было писать имя, фамилию и оценку. Поставить ограничения: имя и фамилия не выше 15 символов каждое. И оценка не выше 5. Если везде значения превышаться выдавать об этом Сообщения в консоль.
 */

struct Journal {
    
    var students = [String]()

    mutating func writeJournal(name: String, surName: String, mark: Int) {
        if name.count > 15 || surName.count > 15 {
            print("Имя и фамилия  не больше 15 символов каждое!")
            return
        }

        if mark < 1 || mark > 5 {
            print("Оценка должна быть в диапазоне от 1 до 5!")
            return
        }

        students += ["\(name) \(surName) - \(mark)"]
        print(students)
    }
}

var journal = Journal()

journal.writeJournal(name: "Сергей", surName: "Ангелов", mark: 5)
journal.writeJournal(name: "ИннаСергеевнаАнгелова", surName: "Павлова", mark: 2)
journal.writeJournal(name: "Эмиль", surName: "Джафаров", mark: 3)
journal.writeJournal(name: "Ева", surName: "Ангелова", mark: 6)


/*
 6) Написать класс, в котором есть 4 функции: -пустая, которая просто выводит сообщение через print,
 - которая принимаете параметры и выводит их в консоль,
 - которая принимает и возвращает параметры.
 - которая принимает замыкание и распечатывает результаты в консоль
 */

class Example {
    
    func firstFunc() {
        print("Empty")
    }
     
    func secondFunc(age: Int) {
        print(age)
    }
    
    func thirdFunc(number: Int) -> Int {
        return number * number
    }
    
    func fourthFunc(closure: @escaping() -> String) {
        print(closure())
    }
}

let examples = Example()

examples.firstFunc()
examples.secondFunc(age: 2)
examples.thirdFunc(number: 3)
examples.fourthFunc { "Closure" }

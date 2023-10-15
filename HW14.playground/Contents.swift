import UIKit

//1) Повторить то, что есть в видео.

//let MaxLength = 15
//
//var str = "Свойства типа"
//
//struct MyStruct {
//
//    static var count = 0
//    var name = String() {
//        didSet {
//            if name.count > MaxLength {
//                name = oldValue
//            }
//        }
//    }
//
//    init(name: String) {
//        self.name = name
//        MyStruct.count += 1
//    }
//}
//
//var struct1 = MyStruct(name: "Ivan")
//var struct2 = MyStruct(name: "Max")
//var struct3 = MyStruct(name: "Nikolay")
//var struct4 = MyStruct(name: "Ivan")
//
//class AgeBoy {
//
//    static var maxAge = 8
//
//    lazy var say = "I'm good"
//
//    var name = String() {
//        didSet {
//            if name.count > MaxLength {
//                name = oldValue
//            }
//        }
//    }
//    var age = 8 {
//        didSet {
//            if age > AgeBoy.maxAge {
//                age = oldValue
//                print("Введите от 6 до 8 лет")
//            }
//        }
//    }
//}
//
//var ageClass = AgeBoy()
//ageClass.name = "Ivan"
//ageClass.age = 15


/*
 2) Создать класс журнал с 1 массивом и 2 мя методами, удалить оценку и поставить оценку.
3) Создать в этом же классе метод расписание который в параметр принимает енам из 3 х кейсов утро, обед, вечер.
4) Внутри метода добавить свитч который смотрит на параметр в котором энам и говорит во сколько прийти в школу.
 */

class Journal {
    
  var marks = [Int]()

  func addMark(_ mark: Int) {
    marks.append(mark)
  }

    func deleteMark(_ index: Int) {
        marks.remove(at: index)
    }
  }

let journal = Journal()

journal.addMark(5)
journal.deleteMark(0)

extension Journal {

    enum Schedule {
        case morning
        case day
        case evening
    }

    func goToSchool(_ schedule: Schedule) {
        switch schedule {
        case .morning: print("At 8:00")
        case .day: print("At 12:00")
        case .evening: print("At 16:00")
        }
    }
}

journal.goToSchool(.morning)
journal.goToSchool(.day)
journal.goToSchool(.evening)







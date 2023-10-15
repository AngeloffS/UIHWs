import UIKit


/* a).Найти информацию что такое наследование в Google, перефразировать эту информацию своими словами и вставить это в плейграунд в закомментировано" виде. */

//Наследование - механизм благодаря которому можно создать новый класс, на базе уже существующего.


//b).Сделать то же самое с понятием Инкапсуляция.

//Инкапсуляция - скрытие объектов внутри класса.


//c).И так же с понятием полиморфизм.

//Полиморфизм - переиспользование одного и того же метода/свойства для разных типов данных.


//1) Создать класс "люди", в этом классе 4 property - "имя", "рост", "вес", "пол", а также будет иметь метод "say(говорит)".

class Peoples {
    
   var name:String
   var height: Double
   var weight: Double
   var sex: String
    
    init(name: String, height: Double, weight: Double, sex: String) {
        self.name = name
        self.height = height
        self.weight = weight
        self.sex = sex
    }
    
    func say() {
        print("Говорит ...")
    }
}


/* 2) Создать subСlass (наследники) "повар", "менеджер", "борец" и переопределить метод "say(говорит)" в каждом из этих классов. */

final class Cook: Peoples {
    
    override func say() {
        print("Я готовлю стейк!")
    }
}

final class Manager: Peoples {
    
    override func say() {
        print("Я продаю бои!")
    }
}

final class Wrestler: Peoples {
    
    override func say() {
        print("Иди сюда леее!")
    }
}
 

//3) Создать по одному объекту(экземпляру) каждого класса и объединить их в массив.

let cook = Cook(name: "Nusret", height: 170.2, weight: 73.5, sex: "M")
let manager = Manager(name: "AliAbdelaziz", height: 175.1, weight: 66.4, sex: "M")
let wrestler = Wrestler(name: "HabibNurmagamedov", height: 177.3, weight: 70.1, sex: "M")

var arrayPeoples = [cook, manager, wrestler]


/* 4) В цикле “for in” пройти по всем элементам массива и вывести в консоль все характеристики каждого объекта (имя, рост и тд) и у каждого вызвать метод "say(говорит)". */

for people in arrayPeoples {

    print("Name - \(people.name), \nHeight - \(people.height), \nWeight - \(people.weight).")
    people.say()
}


/* 5) Создать еще одного наследника от super Class, добавить в него пару новых свойств, добавить в массив и в цикле вывода вывести его свойства как дополнение к свойствам People. 6) Метод "say(говорит)" реализовать таким образом, чтобы перед тем как выполнить собственный method say, выполнялся сначала метод say класса People. */

final class IosDeveloper: Peoples {
    
    var age: Int
    var exp: Double
    
    init(name: String, height: Double, weight: Double, sex: String, age: Int, exp: Double) {
        self.age = age
        self.exp = exp
        super.init(name: name, height: height, weight: weight, sex: sex)
    }
    
    override func say() {
        super.say()
        print("Я делаю нормальный Яндекс Навигатор!")
    }
}

let iosDeveloper = IosDeveloper(name: "Sergey", height: 185.2, weight: 111.1, sex: "M", age: 27, exp: 0.001)

arrayPeoples.append(iosDeveloper)

for people in arrayPeoples where people === iosDeveloper {
    print("Name - \(people.name), \nHeight - \(people.height), \nWeight - \(people.weight), \nAge - \(iosDeveloper.age), \nExpirience - \(iosDeveloper.exp).")
    people.say()
}


//7) Вывести все это в обратном порядке(Google в помощь).

for (index, value) in arrayPeoples.enumerated().reversed() {
    print(index + 1, value.name)
}


/* 8) Создать класс "Марсианин" (не наследник класса people!) со своими собственными property (отличными от people) и методом "say" (отличным от people). */

class Martian {
    
    private var color: String
    private var starShip: String
    
    init(color: String, starShip: String) {
        self.color = color
        self.starShip = starShip
    }
    
    func sayAny() {
        print("Мы пришли с миром!")
    }
}


//9) Унаследоваться от него и создать пару других классов (Инопланетян) с переопределенным методом "say".

final class GreenPeoples: Martian {
    
    override func sayAny() {
        print("Мы зеленые человечки!")
    }
}

let greenPeople = GreenPeoples(color: "Grey", starShip: "FlyingSaucer")

final class Humanoids: Martian {
    
    override func sayAny() {
        print("Всем привет!")
    }
}

let humanoid = Humanoids(color: "Black", starShip: "Pepelaс")


//10) Объединить всех people и Марсианинов) в один массив.

let arrayAliens = [humanoid, greenPeople]

var arrayFriendship: [Any] = arrayAliens + arrayPeoples




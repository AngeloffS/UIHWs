import UIKit

enum Weeksday: String {
    case monday = "Пн"
    case tuesday = "Вт"
    case wednesday = "Ср"
    case thursday = "Чт"
    case friday = "Пт"
    case saturday = "Сб"
    case sunday = "Вс"
    
    var isWeekend: Bool {
        switch self {
        case .saturday, .sunday:
            return true
        default:
            return false
        
        }
    }
    
}







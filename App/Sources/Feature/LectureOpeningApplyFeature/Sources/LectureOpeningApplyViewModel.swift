import Foundation
import SwiftUI
import Service

final class LectureOpeningApplyViewModel: ObservableObject {
    @Published var lectureTitle: String = ""
    @Published var lectureText: String = ""
    @Published var maximumAttendance: String = ""
    @Published var professorName: String = ""
    @Published var score: Int?
    @Published var startPicker = Date()
    @Published var endPicker = Date()
    @Published var openPicker = Date()
    @Published var startTimeSheet: Bool = false
    @Published var endTimeSheet: Bool = false
    @Published var openTimeSheet: Bool = false
    @Published var startDateSheet: Bool = false
    @Published var endDateSheet: Bool = false
    @Published var openDateSheet: Bool = false
    @Published var scoreSheet: Bool = false
    @Published var startTime: Bool = false
    @Published var endTime: Bool = false
    @Published var openTime: Bool = false
    @Published var startDate: Bool = false
    @Published var endDate: Bool = false
    @Published var openDate: Bool = false
    @Published var lectureType1: Bool = false
    @Published var lectureType2: Bool = false
    @Published var professor: Bool = false
    @Published var electricity: Bool = false
    @Published var machine: Bool = false
    @Published var automobile: Bool = false
    @Published var biochemicalEngineering: Bool = false
    @Published var beauty: Bool = false
    @Published var medicalHealth: Bool = false
    @Published var drone: Bool = false
    
    let scoreValue: [Int] = [1, 2]
    
    var lectureTypeStroke1: Color {
        if lectureType1 == false {
            Color.bitgouel(.greyscale(.g2))
        } else {
            Color.bitgouel(.primary(.p5))
        }
    }
    
    var lectureTypeText1: Color.BitgouelColorSystem {
        if lectureType1 == false {
            Color.BitgouelColorSystem.greyscale(.g2)
        } else {
            Color.BitgouelColorSystem.greyscale(.g10)
        }
    }
    
    var lectureTypeBackground1: Color {
        if lectureType1 == false {
            Color.bitgouel(.greyscale(.g10))
        } else {
            Color.bitgouel(.primary(.p5))
        }
    }
    
    var lectureTypeStroke2: Color {
        if lectureType2 == false {
            Color.bitgouel(.greyscale(.g2))
        } else {
            Color.bitgouel(.primary(.p5))
        }
    }
    
    var lectureTypeText2: Color.BitgouelColorSystem {
        if lectureType2 == false {
            Color.BitgouelColorSystem.greyscale(.g2)
        } else {
            Color.BitgouelColorSystem.greyscale(.g10)
        }
    }
    
    var lectureTypeBackground2: Color {
        if lectureType2 == false {
            Color.bitgouel(.greyscale(.g10))
        } else {
            Color.bitgouel(.primary(.p5))
        }
    }
    
    var lectureLineStroke1: Color {
        if electricity == false {
            Color.bitgouel(.greyscale(.g2))
        } else {
            Color.bitgouel(.primary(.p5))
        }
    }
    
    var lectureLineText1: Color.BitgouelColorSystem {
        if electricity == false {
            Color.BitgouelColorSystem.greyscale(.g2)
        } else {
            Color.BitgouelColorSystem.greyscale(.g10)
        }
    }
    
    var lectureLineBackground1: Color {
        if electricity == false {
            Color.bitgouel(.greyscale(.g10))
        } else {
            Color.bitgouel(.primary(.p5))
        }
    }
    
    var lectureLineStroke2: Color {
        if machine == false {
            Color.bitgouel(.greyscale(.g2))
        } else {
            Color.bitgouel(.primary(.p5))
        }
    }
    
    var lectureLineText2: Color.BitgouelColorSystem {
        if machine == false {
            Color.BitgouelColorSystem.greyscale(.g2)
        } else {
            Color.BitgouelColorSystem.greyscale(.g10)
        }
    }
    
    var lectureLineBackground2: Color {
        if machine == false {
            Color.bitgouel(.greyscale(.g10))
        } else {
            Color.bitgouel(.primary(.p5))
        }
    }
    
    var lectureLineStroke3: Color {
        if automobile == false {
            Color.bitgouel(.greyscale(.g2))
        } else {
            Color.bitgouel(.primary(.p5))
        }
    }
    
    var lectureLineText3: Color.BitgouelColorSystem {
        if automobile == false {
            Color.BitgouelColorSystem.greyscale(.g2)
        } else {
            Color.BitgouelColorSystem.greyscale(.g10)
        }
    }
    
    var lectureLineBackground3: Color {
        if automobile == false {
            Color.bitgouel(.greyscale(.g10))
        } else {
            Color.bitgouel(.primary(.p5))
        }
    }
    
    var lectureLineStroke4: Color {
        if biochemicalEngineering == false {
            Color.bitgouel(.greyscale(.g2))
        } else {
            Color.bitgouel(.primary(.p5))
        }
    }
    
    var lectureLineText4: Color.BitgouelColorSystem {
        if biochemicalEngineering == false {
            Color.BitgouelColorSystem.greyscale(.g2)
        } else {
            Color.BitgouelColorSystem.greyscale(.g10)
        }
    }
    
    var lectureLineBackground4: Color {
        if biochemicalEngineering == false {
            Color.bitgouel(.greyscale(.g10))
        } else {
            Color.bitgouel(.primary(.p5))
        }
    }
    
    var lectureLineStroke5: Color {
        if beauty == false {
            Color.bitgouel(.greyscale(.g2))
        } else {
            Color.bitgouel(.primary(.p5))
        }
    }
    
    var lectureLineText5: Color.BitgouelColorSystem {
        if beauty == false {
            Color.BitgouelColorSystem.greyscale(.g2)
        } else {
            Color.BitgouelColorSystem.greyscale(.g10)
        }
    }
    
    var lectureLineBackground5: Color {
        if beauty == false {
            Color.bitgouel(.greyscale(.g10))
        } else {
            Color.bitgouel(.primary(.p5))
        }
    }
    
    var lectureLineStroke6: Color {
        if medicalHealth == false {
            Color.bitgouel(.greyscale(.g2))
        } else {
            Color.bitgouel(.primary(.p5))
        }
    }
    
    var lectureLineText6: Color.BitgouelColorSystem {
        if medicalHealth == false {
            Color.BitgouelColorSystem.greyscale(.g2)
        } else {
            Color.BitgouelColorSystem.greyscale(.g10)
        }
    }
    
    var lectureLineBackground6: Color {
        if medicalHealth == false {
            Color.bitgouel(.greyscale(.g10))
        } else {
            Color.bitgouel(.primary(.p5))
        }
    }
    
    var lectureLineStroke7: Color {
        if drone == false {
            Color.bitgouel(.greyscale(.g2))
        } else {
            Color.bitgouel(.primary(.p5))
        }
    }
    
    var lectureLineText7: Color.BitgouelColorSystem {
        if drone == false {
            Color.BitgouelColorSystem.greyscale(.g2)
        } else {
            Color.BitgouelColorSystem.greyscale(.g10)
        }
    }
    
    var lectureLineBackground7: Color {
        if drone == false {
            Color.bitgouel(.greyscale(.g10))
        } else {
            Color.bitgouel(.primary(.p5))
        }
    }
    
    var formattedStartDate: String {
        if startDate == false {
            return "신청 시작일"
        } else {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy.MM.dd"
            return dateFormatter.string(from: startPicker)
        }
    }
    
    var formattedStartTime: String {
        if startTime == false {
            return "신청 시간"
        } else {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "h:mm a"
            return dateFormatter.string(from: startPicker)
        }
    }
    
    var formattedEndDate: String {
        if endDate == false {
            return "신청 마감일"
        } else {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy.MM.dd"
            return dateFormatter.string(from: endPicker)
        }
    }
    
    var formattedEndTime: String {
        if endTime == false {
            return "마감 시간"
        } else {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "h:mm a"
            return dateFormatter.string(from: endPicker)
        }
    }
    
    var formattedOpenDate: String {
        if openDate == false {
            return "개강일"
        } else {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy.MM.dd"
            return dateFormatter.string(from: openPicker)
        }
    }
    
    var formattedOpenTime: String {
        if openTime == false {
            return "개강 시간"
        } else {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "h:mm a"
            return dateFormatter.string(from: openPicker)
        }
    }
    
    var giveScore: String {
        if score == 1 {
            return "1점"
        } else if score == 2 {
            return "2점"
        } else {
            return "수여 학점 입력"
        }
    }
    
    var formattedProfessorChoice: String {
        if professor == false {
            return "담당 교수 선택"
        } else {
            return professorName
        }
    }
    
    var chevronChange: String {
        if startDateSheet == true {
            return "chevron_up"
        } else {
            return "chevron_down"
        }
    }
    
    var chevronChange2: String {
        if startTimeSheet == true {
            return "chevron_up"
        } else {
            return "chevron_down"
        }
    }
    
    var chevronChange3: String {
        if endDateSheet == true {
            return "chevron_up"
        } else {
            return "chevron_down"
        }
    }
    
    var chevronChange4: String {
        if endTimeSheet == true {
            return "chevron_up"
        } else {
            return "chevron_down"
        }
    }
    
    var chevronChange5: String {
        if openDateSheet == true {
            return "chevron_up"
        } else {
            return "chevron_down"
        }
    }
    
    var chevronChange6: String {
        if openTimeSheet == true {
            return "chevron_up"
        } else {
            return "chevron_down"
        }
    }
    
    var chevronChange7: String {
        if scoreSheet == true {
            return "chevron_up"
        } else {
            return "chevron_down"
        }
    }
    
    var chevronChange8: String {
        if professor == true {
            return "chevron_up"
        } else {
            return "chevron_down"
        }
    }
}

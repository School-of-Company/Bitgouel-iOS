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
    @Published var aiFusionComplex: Bool = false
    @Published var automobile: Bool = false
    @Published var culture: Bool = false
    @Published var medicalHealth: Bool = false
    @Published var energy: Bool = false
    @Published var isPresentedLectureDetailSettingAppend = false
    
    let scoreValue: [Int] = [1, 2]
    
    func isPresentedDetailSetting(state: Bool) {
        isPresentedLectureDetailSettingAppend = state
    }
    
    func lectureTextColor(parameter: Bool) -> Color.BitgouelColorSystem {
        if parameter == false {
            return Color.BitgouelColorSystem.greyscale(.g2)
        } else {
            return Color.BitgouelColorSystem.greyscale(.g10)
        }
    }
    
    func lectureStrokeColor(parameter: Bool) -> Color {
        if parameter == false {
            return Color.bitgouel(.greyscale(.g2))
        } else {
            return Color.bitgouel(.primary(.p5))
        }
    }
    
    func lectureBackgroundColor(parameter: Bool) -> Color {
        if parameter == false {
            return Color.bitgouel(.greyscale(.g10))
        } else {
            return Color.bitgouel(.primary(.p5))
        }
    }
    
    func chevronChange(parameter: Bool) -> String {
        if parameter == false {
            return "chevron_down"
        } else {
            return "chevron_up"
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
}

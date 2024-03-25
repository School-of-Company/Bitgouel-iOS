import Foundation
import SwiftUI
import Service

final class LectureDetailSettingViewModel: BaseViewModel {
    @Published var professorName: String = ""
    @Published var lectureName: String = ""
    @Published var subjectName: String = ""
    @Published var maximumAttendance: String = ""

    @Published var startPicker = Date()
    @Published var endPicker = Date()
    @Published var openPicker = Date()
    @Published var openPicker2 = Date()
    
    @Published var lectureType1: Bool = false
    @Published var lectureType2: Bool = false
    @Published var professor: Bool = false
    @Published var lecture: Bool = false
    @Published var subject: Bool = false
    @Published var aiFusionComplex: Bool = false
    @Published var automobile: Bool = false
    @Published var culture: Bool = false
    @Published var medicalHealth: Bool = false
    @Published var energy: Bool = false
    @Published var gradeOneSemesterTwo: Bool = false
    @Published var gradeTwoSemesterOne: Bool = false
    @Published var gradeTwoSemesterTwo: Bool = false
    @Published var gradeThreeSemesterOne: Bool = false
    @Published var scoreOne: Bool = false
    @Published var scoreTwo: Bool = false
    
    @Published var openDate: [Date] = []
    @Published var startTime: [Date] = []
    @Published var endTime: [Date] = []
    @Published var datePickerCount = 0
    
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
    
    func select(parameter: Bool, parameterChoice: String, parameterName: String) -> String {
        if parameter == false {
            return parameterChoice
        } else {
            return parameterName
        }
    }
    
    func startUpdateDate(date: Date) {
        startPicker = date
    }
    
    func endUpdateDate(date: Date) {
        endPicker = date
    }
    
    func openUpdateDate(date: Date) {
        openPicker = date
    }
    
    func openUpdateDate2(date: Date) {
        openPicker2 = date
    }
    
    func binding(for index: Int, type: PickerType) -> Binding<Date> {
        switch type {
        case .date:
            return Binding<Date>(
                get: { self.openDate[index] },
                set: { self.openDate[index] = $0 }
            )
        case .time1:
            return Binding<Date>(
                get: { self.startTime[index] },
                set: { self.startTime[index] = $0 }
            )
        case .time2:
            return Binding<Date>(
                get: { self.endTime[index] },
                set: { self.endTime[index] = $0 }
            )
        }
    }
}

enum PickerType {
    case date
    case time1
    case time2
}

import Foundation
import Service
import SwiftUI

enum PickerType {
    case date
    case startTime
    case endTime
}

final class LectureDetailSettingViewModel: BaseViewModel {
    @Published var professorName: String = ""
    @Published var lectureName: String = ""
    @Published var subjectName: String = ""
    @Published var maximumAttendance: String = ""

    @Published var startDatePicker = Date()
    @Published var endDatePicker = Date()
    @Published var openDatePicker = Date()
    @Published var endTimePicker = Date()

    @Published var isSelectedMutualCreditRecognitionProgram: Bool = false
    @Published var isSelectedUniversityExplorationProgram: Bool = false

    @Published var isSelectedProfessor: Bool = false
    @Published var isSelectedLecture: Bool = false
    @Published var isSelectedSubject: Bool = false

    @Published var isSelectedAiFusionComplex: Bool = false
    @Published var isSelectedAutomobileIndustry: Bool = false
    @Published var isSelectedCulture: Bool = false
    @Published var isSelectedMedicalHealth: Bool = false
    @Published var isSelectedEnergy: Bool = false

    @Published var isSelectedGradeOneSemesterTwo: Bool = false
    @Published var isSelectedGradeTwoSemesterOne: Bool = false
    @Published var isSelectedGradeTwoSemesterTwo: Bool = false
    @Published var isSelectedGradeThreeSemesterOne: Bool = false

    @Published var isSelectedScoreOne: Bool = false
    @Published var isSelectedScoreTwo: Bool = false

    @Published var openDate: [Date] = []
    @Published var startTime: [Date] = []
    @Published var endTime: [Date] = []
    @Published var datePickerCount = 0

    func lectureTextColor(
        selectedState: Bool
    ) -> Color.BitgouelColorSystem {
        if selectedState == false {
            return Color.BitgouelColorSystem.greyscale(.g2)
        } else {
            return Color.BitgouelColorSystem.greyscale(.g10)
        }
    }

    func lectureStrokeColor(
        selectedState: Bool
    ) -> Color {
        if selectedState == false {
            return Color.bitgouel(.greyscale(.g2))
        } else {
            return Color.bitgouel(.primary(.p5))
        }
    }

    func lectureBackgroundColor(
        selectedState: Bool
    ) -> Color {
        if selectedState == false {
            return Color.bitgouel(.greyscale(.g10))
        } else {
            return Color.bitgouel(.primary(.p5))
        }
    }

    func chevronChange(
        selectedState: Bool
    ) -> String {
        if selectedState == false {
            return "chevron_down"
        } else {
            return "chevron_up"
        }
    }

    func select(
        selectedState: Bool,
        selectText: String,
        selectedName: String
    ) -> String {
        if selectedState == false {
            return selectText
        } else {
            return selectedName
        }
    }

    func updateStartDate(
        date: Date
    ) {
        startDatePicker = date
    }

    func updateEndDate
    (
        date: Date
    ) {
        endDatePicker = date
    }

    func updateOpenDate(
        date: Date
    ) {
        openDatePicker = date
    }

    func updateEndTime(
        date: Date
    ) {
        endTimePicker = date
    }

    func newDateSet(
        for index: Int,
        type: PickerType
    ) -> Binding<Date> {
        switch type {
        case .date:
            return Binding<Date>(
                get: { self.openDate[index] },
                set: { self.openDate[index] = $0 }
            )
        case .startTime:
            return Binding<Date>(
                get: { self.startTime[index] },
                set: { self.startTime[index] = $0 }
            )
        case .endTime:
            return Binding<Date>(
                get: { self.endTime[index] },
                set: { self.endTime[index] = $0 }
            )
        }
    }
}

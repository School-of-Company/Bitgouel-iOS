import SwiftUI

struct InputStudentIDNumberSection: View {
    @State var studentIDNumber: String = ""
    @State var grade: Int?
    @State var classRoom: Int?
    @State var number: Int?
    var studentIDNumberelpMessage: String {
        guard !studentIDNumber.isEmpty else { return "" }

        if isStudentIDNumberErrorOccurred {
            return "학번은 5자리수로 입력해주세요"
        } else {
            return ""
        }
    }
    @State var isStudentIDNumberErrorOccurred: Bool = false

    let enteredStudentIDNumber: (_ grade: Int, _ classRoom: Int, _ number: Int) -> Void
    let updateState: (SignupFlowState) -> Void

    var body: some View {
        BitgouelTextField(
            "학번",
            text: Binding(
                get: { studentIDNumber },
                set: { newValue in
                    studentIDNumber = newValue
                    parseStudentID()

                    if checkStudentIDNumber() {
                        isStudentIDNumberErrorOccurred = false
                        enteredStudentIDNumber(grade ?? 0, classRoom ?? 00, number ?? 00)
                        updateState(.phoneNumber)
                    } else {
                        isStudentIDNumberErrorOccurred = true
                    }
                }
            ),
            helpMessage: studentIDNumberelpMessage,
            isError: isStudentIDNumberErrorOccurred
        )
        .padding(.bottom, -20)
    }

    func checkStudentIDNumber() -> Bool {
        return studentIDNumber.count == 5 &&
        (grade != nil) &&
        (classRoom != nil) &&
        (number != nil)
    }

    func parseStudentID() {
        if studentIDNumber.count == 5 {
            grade = Int(studentIDNumber.prefix(1)) ?? 0
            classRoom = Int(studentIDNumber.dropFirst(1).prefix(2)) ?? 00
            number = Int(studentIDNumber.suffix(2)) ?? 00
        }
    }
}

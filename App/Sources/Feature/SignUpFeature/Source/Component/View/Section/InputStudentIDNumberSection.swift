import SwiftUI

struct InputStudentNumberSection: View {
    @State var studentIDNumber: String = ""

    var body: some View {
        BitgouelTextField(
            "학번",
            text: Binding(
                get: { studentIDNumber },
                set: { newValue in
                    studentIDNumber = newValue
                    if checkStudentIDNumber() {
                        
                    }
                }
            )
        )
        .padding(.bottom, -20)
    }

    func checkStudentIDNumber() -> Bool {
        return studentIDNumber.count == 5 &&
        (studentInfo?.grade != nil) &&
        (studentInfo?.classRoom != nil) &&
        (studentInfo?.number != nil)
    }

    func parseStudentID() {
        if studentIDNumber.count == 5 {
            let grade = Int(studentIDNumber.prefix(1)) ?? 0
            let classRoom = Int(studentIDNumber.dropFirst(1).prefix(2)) ?? 00
            let number = Int(studentIDNumber.suffix(2)) ?? 00
        }
    }
}

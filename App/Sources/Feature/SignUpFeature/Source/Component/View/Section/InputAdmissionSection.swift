import SwiftUI

struct InputAdmissionSection: View {
    @State var admissionText: String = ""
    let admissionNumber: Int
    let enteredAdmissionYear: (Int?) -> Void
    let updateState: (SignupFlowState) -> Void

    var body: some View {
        BitgouelTextField(
            "입학년도",
            text: Binding(
                get: { admissionText },
                set: { newValue in
                    if let number = Int(newValue), number > 0 {
                        enteredAdmissionYear(number)
                        
                        if checkAdmissionNumber(number: number) {
                            updateState(.studentNumber)
                        }
                    } else {
                        enteredAdmissionYear(nil)
                    }

                }
            )
        )
    }

    func checkAdmissionNumber(number: Int) -> Bool {
        number >= 1000
    }
}

import SwiftUI

struct CreditView: View {
    @Binding var credit: String
    let onSelectedCrdit: (Int?) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            BitgouelText(
                text: "학점",
                font: .text1
            )

            BitgouelTextField(
                "학점 입력",
                text: Binding(
                    get: { credit },
                    set: { credit in
                        onSelectedCrdit(Int(credit))
                    }
                )
            )
        }
    }
}

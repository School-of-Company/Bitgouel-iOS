import SwiftUI

struct UniversityDetailBottomSheet: View {
    let universityName: String
    let departmentList: [String]
    let cancel: (Bool) -> Void
    let editAction: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            HStack {
                BitgouelText(
                    text: "대학 상세",
                    font: .title3
                )

                Spacer()

                Button {
                    cancel(false)
                } label: {
                    BitgouelAsset.Icons.cancel.swiftUIImage
                }
            }

            BitgouelText(
                text: universityName,
                font: .text1
            )

            VStack(alignment: .leading, spacing: 16) {
                BitgouelText(
                    text: "학과 목록",
                    font: .text1
                )

                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 12) {
                        ForEach(departmentList, id: \.self) { department in
                            Text(department)
                                .bitgouelFont(.text3, color: .greyscale(.g4))
                        }
                    }
                }
            }
        }
        .overlay(alignment: .bottom) {
            ActivateButton(
                text: "정보 수정",
                buttonType: .pen
            ) {
                editAction()
            }
        }
        .padding(.horizontal, 28)
        .frame(height: 500)
    }
}

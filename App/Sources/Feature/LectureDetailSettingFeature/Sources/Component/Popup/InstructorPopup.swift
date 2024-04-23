import Service
import SwiftUI

struct InstructorPopup: View {
    var instructorList: [InstructorInfoEntity]
    var selectedInstructorID: String
    @Binding var keyword: String
    let onInstructorSelect: (_ instructorName: String, _ instructorID: String) -> Void
    let cancel: (Bool) -> Void

    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(Color.white)
            .frame(height: 480)
            .overlay {
                VStack(spacing: 24) {
                    HStack {
                        BitgouelText(
                            text: "담당 교수 선택",
                            font: .title3
                        )

                        Spacer()

                        Button {
                            cancel(false)
                        } label: {
                            BitgouelAsset.Icons.cancel.swiftUIImage
                        }
                    }
                    .padding(.top, 24)

                    SearchTextField(
                        text: $keyword,
                        "이름 또는 학교명으로 검색..."
                    )

                    Divider()
                        .padding(.top, 16)

                    ScrollView(showsIndicators: false) {
                        if instructorList.isEmpty {
                            NoInfoView()
                        } else {
                            LazyVStack(alignment: .leading, spacing: 16) {
                                ForEach(instructorList, id: \.instructorID) { instructor in
                                    instructorRow(
                                        instructorName: instructor.name,
                                        instructorOrganization: instructor.organization,
                                        instructorID: instructor.instructorID,
                                        onInstructorSelect: onInstructorSelect
                                    )

                                    Divider()
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal, 24)
            }
            .padding(.horizontal, 40)
    }

    @ViewBuilder
    func instructorRow(
        instructorName: String,
        instructorOrganization: String,
        instructorID: String,
        onInstructorSelect: @escaping (_ instructorName: String, _ instructorID: String) -> Void
    ) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            BitgouelText(
                text: instructorName,
                font: .text1
            )

            BitgouelText(
                text: instructorOrganization,
                font: .text2
            )
            .foregroundColor(.bitgouel(.greyscale(.g4)))
        }
        .padding(.leading, 16)
        .onTapGesture {
            onInstructorSelect(instructorName, instructorID)
        }
        .id(instructorID)
    }
}

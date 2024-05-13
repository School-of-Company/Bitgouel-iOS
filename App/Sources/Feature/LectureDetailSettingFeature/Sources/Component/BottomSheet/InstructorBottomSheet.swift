import Service
import SwiftUI

struct InstructorBottomSheet: View {
    var instructorList: [InstructorInfoEntity]
    var selectedInstructorID: String
    @Binding var keyword: String
    let onInstructorSelect: (_ instructorName: String, _ instructorID: String) -> Void

    var body: some View {
        VStack(spacing: 8) {
            SearchTextField(
                text: $keyword,
                "담당 교수 검색"
            )

            ScrollView(showsIndicators: false) {
                if instructorList.isEmpty {
                    NoInfoView(text: "담당 교수가 없어요")
                        .padding(.top, 24)
                } else {
                    LazyVStack(alignment: .leading, spacing: 16) {
                        ForEach(instructorList, id: \.instructorID) { instructor in
                            instructorRow(
                                instructorName: instructor.name,
                                instructorOrganization: instructor.organization,
                                instructorID: instructor.instructorID,
                                isSelected: Binding(
                                    get: { instructor.instructorID == selectedInstructorID },
                                    set: { _ in
                                        onInstructorSelect(instructor.name, instructor.instructorID)
                                    }
                                )
                            )
                            .onTapGesture {
                                onInstructorSelect(instructor.name, instructor.instructorID)
                            }
                        }
                    }
                }
            }
        }
        .frame(height: 400)
        .padding(.horizontal, 28)
    }

    @ViewBuilder
    func instructorRow(
        instructorName: String,
        instructorOrganization: String,
        instructorID: String,
        isSelected: Binding<Bool>
    ) -> some View {
        HStack {
            VStack(alignment: .leading) {
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

            Spacer()

            BitgouelRadioButton(isSelected: isSelected)
        }
        .id(instructorID)
        .padding(.vertical, 24)
    }
}

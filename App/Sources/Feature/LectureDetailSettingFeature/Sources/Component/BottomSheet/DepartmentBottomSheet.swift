import SwiftUI

struct DepartmentBottomSheet: View {
    var selectedDepartment: String
    @Binding var keyword: String
    @State var isSelected: Bool = false
    let departmentList: [String]
    let departmentSelect: (String) -> Void

    var body: some View {
        VStack(spacing: 8) {
            SearchTextField(
                text: $keyword,
                "강의 학과 검색"
            )
            
            ScrollView(showsIndicators: false) {
                if departmentList.isEmpty {
                    HStack {
                        VStack(alignment: .leading) {
                            BitgouelText(
                                text: keyword,
                                font: .text2
                            )
                            
                            Text("새 학과 추가하기")
                                .bitgouelFont(.caption, color: .greyscale(.g4))
                        }

                        Spacer()

                        BitgouelRadioButton(
                            isSelected: Binding(
                                get: { isSelected },
                                set: { selected in
                                    if selected {
                                        isSelected = selected
                                        departmentSelect(keyword)
                                    } else {
                                        isSelected = selected
                                    }
                                }
                            )
                        )
                    }
                    .padding(.vertical, 24)
                } else {
                    LazyVStack(alignment: .leading) {
                        ForEach(departmentList, id: \.self) { department in
                            departmentRow(
                                department: department,
                                isSelected: Binding(
                                    get: { department == selectedDepartment},
                                    set: { _ in departmentSelect(department) }
                                )
                            )
                        }
                    }
                }
            }
        }
        .padding(.horizontal, 28)
        .frame(height: 400)
    }

    @ViewBuilder
    func departmentRow(
        department: String,
        isSelected: Binding<Bool>
    ) -> some View {
        HStack {
            BitgouelText(
                text: department,
                font: .text1
            )

            Spacer()

            BitgouelRadioButton(isSelected: isSelected)
        }
        .id(department)
        .padding(.vertical, 24)
    }
}

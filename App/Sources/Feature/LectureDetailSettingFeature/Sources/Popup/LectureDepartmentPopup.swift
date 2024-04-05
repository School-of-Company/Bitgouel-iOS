import SwiftUI

struct LectureDepartmentPopup: View {
    var departmentList: [String]
    var selectedDepartment: String
    @Binding var keyword: String
    let onDepartmentSelect: (String) -> Void
    let cancel: (Bool) -> Void

    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(Color.white)
            .frame(height: 480)
            .overlay {
                VStack(spacing: 0) {
                    HStack {
                        BitgouelText(
                            text: "학과",
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
                        "학과 이름으로 검색..."
                    )
                    .padding(.top, 24)

                    Divider()
                        .padding(.top, 16)

                    ScrollView(showsIndicators: false) {
                        if departmentList.isEmpty {
                            NoInfoView()
                        } else {
                            LazyVStack(alignment: .leading, spacing: 16) {
                                ForEach(departmentList, id: \.self) { department in
                                    departmentRow(
                                        department: department,
                                        onDepartmentSelect: onDepartmentSelect
                                    )
                                    
                                    Divider()
                                }
                            }
                        }
                    }
                    .padding(.top, 24)
                }
                .padding(.horizontal, 24)
            }
            .padding(.horizontal, 40)
    }

    @ViewBuilder
    func departmentRow(
        department: String,
        onDepartmentSelect: @escaping (String) -> Void
    ) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            BitgouelText(
                text: department,
                font: .text1
            )
        }
        .padding(.leading, 16)
        .onTapGesture {
            onDepartmentSelect(department)
        }
        .id(department)
    }
}

import Service
import SwiftUI

struct SchoolListPopup: View {
    let schoolList: [SchoolInfoModel]
    let selectedSchool: String?
    let onSchoolSelect: (String) -> Void
    let cancel: (Bool) -> Void

    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(Color.white)
            .frame(height: 480)
            .overlay {
                VStack(spacing: 0) {
                    HStack {
                        BitgouelText(
                            text: "학교 선택",
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

                    Spacer()

                    ScrollView(showsIndicators: false) {
                        LazyVStack(spacing: 16) {
                            ForEach(schoolList, id: \.schoolName) { school in
                                schoolListRow(
                                    school: school.schoolName,
                                    selectedSchool: selectedSchool,
                                    onSchoolSelect: onSchoolSelect
                                )
                            }
                        }
                        .padding(.top, 32)

                        Spacer()
                    }
                }
                .padding(.horizontal, 24)
            }
            .padding(.horizontal, 40)
    }

    @ViewBuilder
    func schoolListRow(
        school: String,
        selectedSchool: String?,
        onSchoolSelect: @escaping (String) -> Void
    ) -> some View {
        VStack(alignment: .leading) {
            Text(school)
                .onTapGesture {
                    onSchoolSelect(school)
                }
                .padding(.leading, 16)

            Divider()
                .padding(.top, 16)
        }
        .id(String(school))
        .frame(height: 54)
    }
}

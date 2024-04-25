import SwiftUI

struct DivisionBottomSheet: View {
    var selectedDivision: String
    @Binding var keyword: String
    @State var isSelected: Bool = false
    let divisionList: [String]
    let divisionDidSelect: (String) -> Void

    var body: some View {
        VStack {
            SearchTextField(
                text: $keyword,
                "강의 구분 검색"
            )

            ScrollView(showsIndicators: false) {
                if divisionList.isEmpty {
                    HStack {
                        VStack(alignment: .leading) {
                            BitgouelText(
                                text: keyword,
                                font: .text2
                            )

                            Text("새 계열 추가하기")
                                .bitgouelFont(.caption, color: .greyscale(.g4))
                        }

                        Spacer()

                        BitgouelRadioButton(
                            isSelected: Binding(
                                get: { isSelected },
                                set: { select in
                                    if select {
                                        isSelected = select
                                        divisionDidSelect(keyword)
                                    } else {
                                        isSelected = select
                                    }
                                }
                            )
                        )
                    }
                    .padding(.vertical, 24)
                }
                LazyVStack {
                    ForEach(divisionList, id: \.self) { division in
                        divisionListRow(
                            division: division,
                            isSelected: Binding(
                                get: { division == selectedDivision },
                                set: { _ in
                                    print(division)
                                }
                            )
                        )
                    }
                }
            }
        }
        .padding(.horizontal, 28)
    }

    @ViewBuilder
    func divisionListRow(
        division: String,
        isSelected: Binding<Bool>
    ) -> some View {
        HStack {
            VStack(alignment: .leading) {
                BitgouelText(
                    text: division,
                    font: .text2
                )
            }

            Spacer()

            BitgouelRadioButton(isSelected: isSelected)
        }
        .padding(.vertical, 24)
    }
}

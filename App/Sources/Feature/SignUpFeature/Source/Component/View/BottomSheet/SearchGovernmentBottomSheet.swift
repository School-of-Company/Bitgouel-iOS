import SwiftUI

struct SearchGovernmentBottomSheet: View {
    @State var searchKeyword: String = ""
    let governmentList: [String]
    let selectedGovernment: String?
    let onGovernmentSelect: (String) -> Void

    var searchGovernmentList: [String] {
        if searchKeyword.isEmpty {
            return governmentList
        } else {
            return governmentList.filter {
                $0.contains(searchKeyword)
            }
        }
    }

    var body: some View {
        VStack(spacing: 8) {
            BitgouelTextField(
                "기관 이름으로 검색",
                text: $searchKeyword
            )

            ScrollView {
                LazyVStack {
                    ForEach(searchGovernmentList, id: \.self) { government in
                        RadioButtonListRow(
                            element: government,
                            selectedElement: selectedGovernment
                        ) { government in
                            onGovernmentSelect(government)
                        }
                    }
                }
            }
        }
        .padding(.horizontal, 28)
        .frame(height: 415)
    }
}

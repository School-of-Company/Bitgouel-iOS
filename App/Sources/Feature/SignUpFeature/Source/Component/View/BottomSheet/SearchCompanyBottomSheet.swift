import SwiftUI

struct SearchCompanyBottomSheet: View {
    @State var searchKeyword: String = ""
    let companyList: [String]
    let selectedCompany: String?
    let onCompanySelect: (String) -> Void

    var searchCompanyList: [String] {
        if searchKeyword.isEmpty {
            return companyList
        } else {
            return companyList.filter {
                $0.contains(searchKeyword)
            }
        }
    }

    var body: some View {
        VStack(spacing: 8) {
            BitgouelTextField(
                "기업 이름으로 검색",
                text: $searchKeyword
            )
            
            ScrollView {
                LazyVStack {
                    ForEach(searchCompanyList, id: \.self) { company in
                        RadioButtonListRow(
                            element: company,
                            selectedElement: selectedCompany
                        ) { company in
                            onCompanySelect(company)
                        }
                        
                    }
                }
            }
        }
        .padding(.horizontal, 28)
        .frame(height: 415)
    }
}

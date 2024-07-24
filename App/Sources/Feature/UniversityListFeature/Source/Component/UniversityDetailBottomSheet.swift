import SwiftUI

struct UniversityDetailInfoBottomSheet: View {
    let universityName: String
    let departmentList: [String]

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                BitgouelText(
                    text: "대학 상세",
                    font: .title3
                )

                Spacer()

                Button {
                    
                } label: {
                    
                }
            }
        }
    }
}

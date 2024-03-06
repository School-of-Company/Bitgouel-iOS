import SwiftUI

struct InquiryListView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                ForEach(0...3, id: \.self) { id in
                    RoundListRow(
                        id: "",
                        title: "앗싸",
                        date: "아아악",
                        userID: "idid",
                        name: "name",
                        state: .approve,
                        authority: .student
                    )
                }
            }
            .navigationTitle("문의사항")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        
                    } label: {
                        #warning("학생일 때")
                        BitgouelAsset.Icons.add.swiftUIImage
                        
                        #warning("어드민 일 때")
                        BitgouelAsset.Icons.filter.swiftUIImage
                    }
                }
            }
            
        }
        .padding(.horizontal, 28)
    }
}

import SwiftUI

struct ClubListView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 0) {
                    HStack {
                        BitgouelText(
                            text: "학교이름",
                            font: .title3
                        )
                        
                        Spacer()
                    }
                    .padding(.top, 40)
                
                    Divider()
                        .padding(.top, 12)
                    
                    ClubListRow(clubName: "동아리 이름")
                        .padding(.top, 12)
                    
                    Spacer()
                }
                .padding(.horizontal, 28)
            }
            .navigationTitle("동아리 목록")
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        BitgouelAsset.Icons.setting.swiftUIImage
                            .renderingMode(.template)
                            .frame(width: 24, height: 24)
                            .foregroundColor(.bitgouel(.greyscale(.g8)))
                    }
                }
            }
        }
    }
}

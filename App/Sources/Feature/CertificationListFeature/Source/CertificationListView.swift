import SwiftUI

struct CertificationListView: View {
    @State var isPresentedAlterBottomSheet: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 24) {
                VStack(alignment: .leading, spacing: 4) {
                    BitgouelText(
                        text: "유저 이름",
                        font: .title2
                    )
                    
                    HStack {
                        BitgouelText(
                            text: "총 학점",
                            font: .text3
                        )
                        
                        Spacer()
                        
                        BitgouelText(
                            text: "300",
                            font: .text3
                        )
                    }.foregroundColor(.bitgouel(.primary(.p5)))
                    
                    HStack {
                        BitgouelText(
                            text: "이메일",
                            font: .caption
                        )
                        
                        Spacer()
                        
                        BitgouelText(
                            text: "adjdjdj@.com",
                            font: .text2
                        )
                    }
                    .foregroundColor(.bitgouel(.greyscale(.g4)))
                    
                    HStack {
                        BitgouelText(
                            text: "전화번호",
                            font: .caption
                        )
                        
                        Spacer()
                        
                        BitgouelText(
                            text: "00",
                            font: .caption
                        )
                    }
                }
                .padding(.top, 24)
                
                Divider()
                
                HStack {
                    BitgouelText(
                        text: "자격증",
                        font: .title3
                    )
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        BitgouelAsset.Icons.add.swiftUIImage
                    }
                }
                
                ScrollView {
                    LazyVStack(spacing: 0){
                        ForEach(0..<4, id: \.self) { index in
                            ListRow(
                                id: "",
                                title: "",
                                modifiedAt: Date(),
                                isPresented: Binding(
                                    get: { isPresentedAlterBottomSheet },
                                    set: { state in isPresentedAlterBottomSheet = state }
                                )
                            )
                        }
                    }
                }
            }
            .padding(.horizontal, 28)
            .navigationTitle("학생 정보")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        
                    } label: {
                        BitgouelAsset.Icons.person.swiftUIImage
                    }
                }
            }
        }
    }
}

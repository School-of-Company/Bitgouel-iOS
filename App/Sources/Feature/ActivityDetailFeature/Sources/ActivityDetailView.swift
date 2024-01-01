import SwiftUI

struct ActivityDetailView: View {
    @State var activityDate = Date()
    @State var credit: Int
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                VStack {
                    HStack {
                        BitgouelText(
                            text: "활동 날짜",
                            font: .text1)
                        
                        Spacer()
                    }
                    
                    DatePicker(
                        "활동 날짜 선택",
                        selection: $activityDate,
                        in: Date()...,
                        displayedComponents: [.date]
                    )
                    .datePickerStyle(.compact)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 20)
                    .background(Color.bitgouel(.greyscale(.g9)))
                    .cornerRadius(8, corners: .allCorners)
                    
                    Spacer()
                }
                .padding(.top, 28)
                
                Spacer()
                
                VStack {
                    HStack {
                        BitgouelText(
                            text: "수여 학점",
                            font: .text1)
                        Spacer()
                    }
                    
                    Button {
                        
                    } label: {
                        HStack {
                            BitgouelText(
                                text: "수여 학점 선택",
                                font: .text3
                            )
                            .foregroundColor(.bitgouel(.greyscale(.g2)))
                            .padding(.vertical, 16)
                            .padding(.leading, 20)
                            
                            Spacer()
                            
                            Image("chevron_down")
                                .padding(.trailing, 20)
                        }
                        .background(Color.bitgouel(.greyscale(.g9)))
                        .cornerRadius(8, corners: .allCorners)
                    }
                    
                    Spacer()
                }
                .padding(.top, -160)
                
                Spacer()
            }
            .navigationTitle("활동 세부 설정")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {}, label: {
                        Image("cancel")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                            .foregroundColor(.bitgouel(.greyscale(.g8)))
                    })
                }
            }
        }
        .padding(.horizontal, 28)
    }
}

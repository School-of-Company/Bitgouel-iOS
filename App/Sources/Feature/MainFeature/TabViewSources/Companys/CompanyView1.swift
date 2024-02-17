import SwiftUI

struct CompanyView1: View {
    var body: some View {
        VStack {
            Text("미래형 운송기기")
                .bitgouelFont(.title2, color: .primary(.p9))
                .padding(.top, 72)
            
            HStack {
                VStack(alignment: .leading, spacing: 24) {
                    HStack {
                        ClubCompanyName(
                            name: "보람엔지니어링"
                        )
                        .padding(.trailing, 16)
                        
                        ClubCompanyName(
                            name: "(주)인탑스테크닉"
                        )
                    }
                    
                    HStack {
                        ClubCompanyName(
                            name: "(주)삼도환경"
                        )
                        .padding(.trailing, 16)
                        
                        ClubCompanyName(
                            name: "에이테크솔루션(주)"
                        )
                    }
                    
                    HStack {
                        ClubCompanyName(
                            name: "창원종합사격장"
                        )
                        .padding(.trailing, 16)
                        
                        ClubCompanyName(
                            name: "제3함대(해군)"
                        )
                    }
                    
                    HStack {
                        ClubCompanyName(
                            name: "동양통상"
                        )
                        .padding(.trailing, 16)
                        
                        ClubCompanyName(
                            name: "다이나믹 디자인"
                        )
                    }
                }
                Spacer()
            }
            .padding(.horizontal, 28)
            
            Spacer()
        }
        .background(
            Image("mainpage_image_7")
                .blur(radius: 6, opaque: true)
        )
    }
}

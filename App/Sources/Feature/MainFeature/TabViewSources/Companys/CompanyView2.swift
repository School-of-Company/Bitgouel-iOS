import SwiftUI

struct CompanyView2: View {
    var body: some View {
        VStack {
            Text("에너지산업")
                .bitgouelFont(.title2, color: .primary(.p9))
                .padding(.top, 72)
            
            HStack {
                VStack(alignment: .leading, spacing: 24) {
                    HStack {
                        ClubCompanyName(
                            name: "(유)삼환"
                        )
                        .padding(.trailing, 16)
                        
                        ClubCompanyName(
                            name: "(주)휘라포토닉스"
                        )
                    }
                    
                    HStack {
                        ClubCompanyName(
                            name: "(주)스위코진광"
                        )
                        .padding(.trailing, 16)
                        
                        ClubCompanyName(
                            name: "LG이노텍(주)"
                        )
                    }
                    
                    HStack {
                        ClubCompanyName(
                            name: "(주)유진테크노"
                        )
                        .padding(.trailing, 16)
                        
                        ClubCompanyName(
                            name: "(주)LCM에너지솔루션"
                        )
                    }
                    
                    HStack {
                        ClubCompanyName(
                            name: "주식회사 금철"
                        )
                        .padding(.trailing, 16)
                        
                        ClubCompanyName(
                            name: "주식회사 칼선"
                        )
                    }
                    
                    HStack {
                        ClubCompanyName(
                            name: "(주)남양에스티엔"
                        )
                        .padding(.trailing, 16)
                        
                        ClubCompanyName(
                            name: "주식회사 유니컴퍼니"
                        )
                    }

                    ClubCompanyName(
                        name: "제이제이파트너스(주)"
                    )
                }
                
                Spacer()
            }
            .padding(.horizontal, 28)
            
            Spacer()
        }
        .background(
            Image("mainpage_image_8")
                .blur(radius: 6, opaque: true)
        )
    }
}

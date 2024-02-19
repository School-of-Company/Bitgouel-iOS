import SwiftUI

struct EnergyIndustryCompanyView: View {
    var body: some View {
        VStack {
            Text("에너지산업")
                .bitgouelFont(.title2, color: .primary(.p9))
                .padding(.top, 72)
            
            HStack {
                VStack(alignment: .leading, spacing: 24) {
                    HStack(spacing: 16) {
                        ClubsAndCompanysNameView(
                            name: "(유)삼환"
                        )
                        
                        ClubsAndCompanysNameView(
                            name: "(주)휘라포토닉스"
                        )
                    }
                    
                    HStack(spacing: 16) {
                        ClubsAndCompanysNameView(
                            name: "(주)스위코진광"
                        )
                        
                        ClubsAndCompanysNameView(
                            name: "LG이노텍(주)"
                        )
                    }
                    
                    HStack(spacing: 16) {
                        ClubsAndCompanysNameView(
                            name: "(주)유진테크노"
                        )
                        
                        ClubsAndCompanysNameView(
                            name: "(주)LCM에너지솔루션"
                        )
                    }
                    
                    HStack(spacing: 16) {
                        ClubsAndCompanysNameView(
                            name: "주식회사 금철"
                        )
                        
                        ClubsAndCompanysNameView(
                            name: "주식회사 칼선"
                        )
                    }
                    
                    HStack(spacing: 16) {
                        ClubsAndCompanysNameView(
                            name: "(주)남양에스티엔"
                        )
                        
                        ClubsAndCompanysNameView(
                            name: "주식회사 유니컴퍼니"
                        )
                    }

                    ClubsAndCompanysNameView(
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

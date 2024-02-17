import SwiftUI

struct CompanyView3: View {
    var body: some View {
        VStack {
            Text("의료•헬스케어")
                .bitgouelFont(.title2, color: .primary(.p9))
                .padding(.top, 72)
            
            HStack {
                VStack(alignment: .leading, spacing: 24) {
                    HStack {
                        ClubCompanyName(
                            name: "엠코테크놀로지코리아(주)"
                        )
                        .padding(.trailing, 16)
                        
                        ClubCompanyName(
                            name: "(주)여보야"
                        )
                    }
                    
                    HStack {
                        ClubCompanyName(
                            name: "인디제이"
                        )
                        .padding(.trailing, 16)
                        
                        ClubCompanyName(
                            name: "지니소프트"
                        )
                    }
                    
                    HStack {
                        ClubCompanyName(
                            name: "건주이앤씨"
                        )
                        .padding(.trailing, 16)
                        
                        ClubCompanyName(
                            name: "연제측량기술원"
                        )
                    }

                    ClubCompanyName(
                        name: "드론캐스트"
                    )
                }
                Spacer()
            }
            .padding(.horizontal, 28)
            
            Spacer()
        }
        .background(
            Image("mainpage_image_9")
                .blur(radius: 6, opaque: true)
        )
    }
}

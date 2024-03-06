import SwiftUI

struct CultureIndustryCompanyView: View {
    var body: some View {
        VStack {
            Text("문화산업")
                .bitgouelFont(.title2, color: .primary(.p9))
                .padding(.top, 72)
            
            HStack {
                VStack(alignment: .leading) {
                    HStack(spacing: 16) {
                        ClubsAndCompanysNameView(
                            name: "(주)광주은행"
                        )
                        
                        ClubsAndCompanysNameView(
                            name: "파란손해사정(주)"
                        )
                    }
                    
                    HStack(spacing: 16) {
                        ClubsAndCompanysNameView(
                            name: "한국조경수협회"
                        )
                        
                        ClubsAndCompanysNameView(
                            name: "(사)일도시연구소"
                        )
                    }
                    
                    ClubsAndCompanysNameView(
                        name: "24시노아동물메디컬센터"
                    )
                    
                    HStack(spacing: 16) {
                        ClubsAndCompanysNameView(
                            name: "광주동물메디컬센터"
                        )
                        
                        ClubsAndCompanysNameView(
                            name: "(주)브레드세븐"
                        )
                    }
                    
                    HStack(spacing: 16) {
                        ClubsAndCompanysNameView(
                            name: "파파레브"
                        )
                        
                        ClubsAndCompanysNameView(
                            name: "소맥베이커리"
                        )
                    }
                    
                    HStack(spacing: 16) {
                        ClubsAndCompanysNameView(
                            name: "스튜디오버턴"
                        )
                        
                        ClubsAndCompanysNameView(
                            name: "공감플리서"
                        )
                    }
                    
                    HStack(spacing: 16) {
                        ClubsAndCompanysNameView(
                            name: "(주)195F&B"
                        )
                        
                        ClubsAndCompanysNameView(
                            name: "가매"
                        )
                        
                        ClubsAndCompanysNameView(
                            name: "파운데이"
                        )
                    }
                }
                Spacer()
            }
            .padding(.horizontal, 28)
            
            Spacer()
        }
        .background(
            Image("mainpage_image_11")
                .blur(radius: 6, opaque: true)
        )
    }
}

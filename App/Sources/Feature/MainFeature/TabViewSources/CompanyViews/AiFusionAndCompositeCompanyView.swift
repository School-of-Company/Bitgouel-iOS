import SwiftUI

struct AiFusionAndCompositeCompanyView: View {
    var body: some View {
        VStack {
            Text("AI 융•복합")
                .bitgouelFont(.title2, color: .primary(.p9))
                .padding(.top, 72)
            
            HStack {
                VStack(alignment: .leading) {
                    HStack(spacing: 16) {
                        ClubsAndCompanysNameView(
                            name: "(주)서치"
                        )
                        
                        ClubsAndCompanysNameView(
                            name: "동아간호학원"
                        )
                        
                        ClubsAndCompanysNameView(
                            name: "네일온"
                        )
                    }
                    
                    HStack(spacing: 16) {
                        ClubsAndCompanysNameView(
                            name: "더이인나라"
                        )
                        
                        ClubsAndCompanysNameView(
                            name: "뉴디헤어"
                        )
                    }

                    HStack(spacing: 16) {
                        ClubsAndCompanysNameView(
                            name: "특수전사령부"
                        )
                        
                        ClubsAndCompanysNameView(
                            name: "해병대"
                        )
                    }
                }
                Spacer()
            }
            .padding(.horizontal, 28)
            
            Spacer()
        }
        .background(
            Image("mainpage_image_10")
                .blur(radius: 6, opaque: true)
        )
    }
}

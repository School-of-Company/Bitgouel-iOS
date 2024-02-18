import SwiftUI

struct AiFusionAndCompositeCompanyView: View {
    var body: some View {
        VStack {
            Text("AI 융•복합")
                .bitgouelFont(.title2, color: .primary(.p9))
                .padding(.top, 72)
            
            HStack {
                VStack(alignment: .leading) {
                    HStack {
                        ClubCompanyName(
                            name: "(주)서치"
                        )
                        .padding(.trailing, 16)
                        
                        ClubCompanyName(
                            name: "동아간호학원"
                        )
                        .padding(.trailing, 16)
                        
                        ClubCompanyName(
                            name: "네일온"
                        )
                    }
                    
                    HStack {
                        ClubCompanyName(
                            name: "더이인나라"
                        )
                        .padding(.trailing, 16)
                        
                        ClubCompanyName(
                            name: "뉴디헤어"
                        )
                    }

                    HStack {
                        ClubCompanyName(
                            name: "특수전사령부"
                        )
                        .padding(.trailing, 16)
                        
                        ClubCompanyName(
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

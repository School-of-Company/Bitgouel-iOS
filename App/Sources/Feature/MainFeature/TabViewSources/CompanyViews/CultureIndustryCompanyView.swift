import SwiftUI

struct CultureIndustryCompanyView: View {
    var body: some View {
        VStack {
            Text("문화산업")
                .bitgouelFont(.title2, color: .primary(.p9))
                .padding(.top, 72)
            
            HStack {
                VStack(alignment: .leading) {
                    HStack {
                        ClubCompanyName(
                            name: "(주)광주은행"
                        )
                        .padding(.trailing, 16)
                        
                        ClubCompanyName(
                            name: "파란손해사정(주)"
                        )
                    }
                    
                    HStack {
                        ClubCompanyName(
                            name: "한국조경수협회"
                        )
                        .padding(.trailing, 16)
                        
                        ClubCompanyName(
                            name: "(사)일도시연구소"
                        )
                    }
                    
                    ClubCompanyName(
                        name: "24시노아동물메디컬센터"
                    )
                    
                    HStack {
                        ClubCompanyName(
                            name: "광주동물메디컬센터"
                        )
                        .padding(.trailing, 16)
                        
                        ClubCompanyName(
                            name: "(주)브레드세븐"
                        )
                    }
                    
                    HStack {
                        ClubCompanyName(
                            name: "파파레브"
                        )
                        .padding(.trailing, 16)
                        
                        ClubCompanyName(
                            name: "소맥베이커리"
                        )
                    }
                    
                    HStack {
                        ClubCompanyName(
                            name: "스튜디오버턴"
                        )
                        .padding(.trailing, 16)
                        
                        ClubCompanyName(
                            name: "공감플리서"
                        )
                    }
                    
                    HStack {
                        ClubCompanyName(
                            name: "(주)195F&B"
                        )
                        .padding(.trailing, 16)
                        
                        ClubCompanyName(
                            name: "가매"
                        )
                        .padding(.trailing, 16)
                        
                        ClubCompanyName(
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

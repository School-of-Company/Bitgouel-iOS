import SwiftUI

struct EnergyIndustryClubView: View {
    var body: some View {
        VStack {
            Text("에너지산업")
                .bitgouelFont(.title2, color: .primary(.p9))
                .padding(.top, 72)
            
            HStack {
                VStack(alignment: .leading) {
                    Group {
                        Text("광주공업고등학교")
                            .bitgouelFont(.text1, color: .primary(.p9))
                            .padding(.top, 24)
                        
                        HStack(spacing: 16) {
                            ClubsAndCompanysNameView(
                                name: "전기가 미래다"
                            )
                            
                            ClubsAndCompanysNameView(
                                name: "전자 어벤져스"
                            )
                        }
                        
                        ClubsAndCompanysNameView(
                            name: "전자 히어로스"
                        )
                        
                        Text("광주자동화설비공업고등학교")
                            .bitgouelFont(.text1, color: .primary(.p9))
                            .padding(.top, 24)
                        
                        HStack(spacing: 16) {
                            ClubsAndCompanysNameView(
                                name: "HMI 동아리"
                            )
                            
                            ClubsAndCompanysNameView(
                                name: "마취제"
                            )
                        }
                        
                        HStack(spacing: 16) {
                            ClubsAndCompanysNameView(
                                name: "빛go job go"
                            )
                            
                            ClubsAndCompanysNameView(
                                name: "취업진로 동아리"
                            )
                        }
                        
                        Text("광주전자공업고등학교")
                            .bitgouelFont(.text1, color: .primary(.p9))
                            .padding(.top, 24)
                        
                        HStack(spacing: 16) {
                            ClubsAndCompanysNameView(
                                name: "ACT"
                            )
                            
                            ClubsAndCompanysNameView(
                                name: "ECT"
                            )
                            
                            ClubsAndCompanysNameView(
                                name: "Tesla"
                            )
                        }
                    }
                    
                    Text("금파공업고등학교")
                        .bitgouelFont(.text1, color: .primary(.p9))
                        .padding(.top, 24)
                    
                    HStack(spacing: 16) {
                        ClubsAndCompanysNameView(
                            name: "블라썸(blossom)"
                        )
                        
                        ClubsAndCompanysNameView(
                            name: "유선통신"
                        )
                    }
                    
                    ClubsAndCompanysNameView(
                        name: "전기꿈나무"
                    )
                    
                    Text("동일미래과학고등학교")
                        .bitgouelFont(.text1, color: .primary(.p9))
                        .padding(.top, 24)

                    ClubsAndCompanysNameView(
                        name: "믿고잡고"
                    )
                    
                    Text("숭의과학기술고등학교")
                        .bitgouelFont(.text1, color: .primary(.p9))
                        .padding(.top, 24)
                    
                    HStack(spacing: 16) {
                        ClubsAndCompanysNameView(
                            name: "드림온"
                        )
                        
                        ClubsAndCompanysNameView(
                            name: "볼트와암페어"
                        )
                    }
                    
                    ClubsAndCompanysNameView(
                        name: "에너지지킴이"
                    )
                }
                Spacer()
            }
            .padding(.horizontal, 28)
            
            Spacer()
        }
        .background(
            Image("mainpage_image_4")
                .blur(radius: 6, opaque: true)
        )
    }
}

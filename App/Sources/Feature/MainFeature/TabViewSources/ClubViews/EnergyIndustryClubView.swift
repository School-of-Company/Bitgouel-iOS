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
                        
                        HStack {
                            ClubCompanyName(
                                name: "전기가 미래다"
                            )
                            .padding(.trailing, 16)
                            
                            ClubCompanyName(
                                name: "전자 어벤져스"
                            )
                        }
                        
                        ClubCompanyName(
                            name: "전자 히어로스"
                        )
                        
                        Text("광주자동화설비공업고등학교")
                            .bitgouelFont(.text1, color: .primary(.p9))
                            .padding(.top, 24)
                        
                        HStack {
                            ClubCompanyName(
                                name: "HMI 동아리"
                            )
                            .padding(.trailing, 16)
                            
                            ClubCompanyName(
                                name: "마취제"
                            )
                        }
                        
                        HStack {
                            ClubCompanyName(
                                name: "빛go job go"
                            )
                            .padding(.trailing, 16)
                            
                            ClubCompanyName(
                                name: "취업진로 동아리"
                            )
                        }
                        
                        Text("광주전자공업고등학교")
                            .bitgouelFont(.text1, color: .primary(.p9))
                            .padding(.top, 24)
                        
                        HStack {
                            ClubCompanyName(
                                name: "ACT"
                            )
                            .padding(.trailing, 16)
                            
                            ClubCompanyName(
                                name: "ECT"
                            )
                            .padding(.trailing, 16)
                            
                            ClubCompanyName(
                                name: "Tesla"
                            )
                        }
                    }
                    
                    Text("금파공업고등학교")
                        .bitgouelFont(.text1, color: .primary(.p9))
                        .padding(.top, 24)
                    
                    HStack {
                        ClubCompanyName(
                            name: "블라썸(blossom)"
                        )
                        .padding(.trailing, 16)
                        
                        ClubCompanyName(
                            name: "유선통신"
                        )
                    }
                    
                    ClubCompanyName(
                        name: "전기꿈나무"
                    )
                    
                    Text("동일미래과학고등학교")
                        .bitgouelFont(.text1, color: .primary(.p9))
                        .padding(.top, 24)

                    ClubCompanyName(
                        name: "믿고잡고"
                    )
                    
                    Text("숭의과학기술고등학교")
                        .bitgouelFont(.text1, color: .primary(.p9))
                        .padding(.top, 24)
                    
                    HStack {
                        ClubCompanyName(
                            name: "드림온"
                        )
                        .padding(.trailing, 16)
                        
                        ClubCompanyName(
                            name: "볼트와암페어"
                        )
                    }
                    
                    ClubCompanyName(
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

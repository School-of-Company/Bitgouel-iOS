import SwiftUI

struct FutureTransportClubView: View {
    var body: some View {
        VStack {
            Text("미래형 운송기기")
                .bitgouelFont(.title2, color: .primary(.p9))
                .padding(.top, 72)
            
            HStack {
                VStack(alignment: .leading) {
                    Group {
                        Text("광주공업고등학교")
                            .bitgouelFont(.text1, color: .primary(.p9))
                            .padding(.top, 24)
                        
                        ClubsAndCompanysNameView(
                            name: "SMART JOB PROJECT"
                        )
                        
                        ClubsAndCompanysNameView(
                            name: "나의 미래는 내가 주인공이다!"
                        )
                        
                        HStack(spacing: 16) {
                            ClubsAndCompanysNameView(
                                name: "설비의 달인"
                            )
                            
                            ClubsAndCompanysNameView(
                                name: "특수용접 화이팅"
                            )
                        }
                        
                        Text("광주전자공업고등학교")
                            .bitgouelFont(.text1, color: .primary(.p9))
                            .padding(.top, 24)
                        
                        HStack(spacing: 16) {
                            ClubsAndCompanysNameView(
                                name: "감성기계"
                            )
                            
                            ClubsAndCompanysNameView(
                                name: "열정 그 자체"
                            )
                        }
                        
                        Text("금파공업고등학교")
                            .bitgouelFont(.text1, color: .primary(.p9))
                            .padding(.top, 24)
                        
                        ClubsAndCompanysNameView(
                            name: "레프리"
                        )
                        
                        Text("동일미래과학고등학교")
                            .bitgouelFont(.text1, color: .primary(.p9))
                            .padding(.top, 24)
                        
                        ClubsAndCompanysNameView(
                            name: "놀GO잡GO"
                        )
                    }
                    
                    Text("숭의과학기술고등학교")
                        .bitgouelFont(.text1, color: .primary(.p9))
                        .padding(.top, 24)
                    
                    HStack(spacing: 16) {
                        ClubsAndCompanysNameView(
                            name: "서전트스나이퍼"
                        )
                        
                        ClubsAndCompanysNameView(
                            name: "카-페인팅"
                        )
                    }
                    
                    Text("전남공업고등학교")
                        .bitgouelFont(.text1, color: .primary(.p9))
                        .padding(.top, 24)
                    
                    HStack(spacing: 16) {
                        ClubsAndCompanysNameView(
                            name: "진짜기계"
                        )
                        
                        ClubsAndCompanysNameView(
                            name: "핫앤쿨"
                        )
                    }
                }
                Spacer()
            }
            .padding(.horizontal, 28)
            
            Spacer()
        }
        .background(
            Image("mainpage_image_2")
                .blur(radius: 6, opaque: true)
        )
    }
}

import SwiftUI

struct CultureIndustryClubView: View {
    var body: some View {
        VStack {
            Text("문화산업")
                .bitgouelFont(.title2, color: .primary(.p9))
                .padding(.top, 72)

            HStack {
                VStack(alignment: .leading) {
                    Group {
                        Text("광주공업고등학교")
                            .bitgouelFont(.text1, color: .primary(.p9))
                            .padding(.top, 24)

                        ClubsAndCompanysNameView(
                            name: "건축연구소"
                        )

                        Text("광주여자상업고등학교")
                            .bitgouelFont(.text1, color: .primary(.p9))
                            .padding(.top, 24)

                        HStack(spacing: 16) {
                            ClubsAndCompanysNameView(
                                name: "DCT"
                            )

                            ClubsAndCompanysNameView(
                                name: "뉴 쿡"
                            )

                            ClubsAndCompanysNameView(
                                name: "우아행"
                            )
                        }

                        Text("광주자연과학고등학교")
                            .bitgouelFont(.text1, color: .primary(.p9))
                            .padding(.top, 24)

                        HStack(spacing: 16) {
                            ClubsAndCompanysNameView(
                                name: "금융실무"
                            )

                            ClubsAndCompanysNameView(
                                name: "소개팅"
                            )

                            ClubsAndCompanysNameView(
                                name: "취사모"
                            )
                        }

                        ClubsAndCompanysNameView(
                            name: "베이커리 카페 CEO"
                        )

                        Text("광주전자공업고등학교")
                            .bitgouelFont(.text1, color: .primary(.p9))
                            .padding(.top, 24)

                        ClubsAndCompanysNameView(
                            name: "“M lab” = 메이커 연구소"
                        )
                    }

                    Text("금파공업고등학교")
                        .bitgouelFont(.text1, color: .primary(.p9))
                        .padding(.top, 24)

                    ClubsAndCompanysNameView(
                        name: "금호로80 베이커리"
                    )

                    Text("송원여자상업고등학교")
                        .bitgouelFont(.text1, color: .primary(.p9))
                        .padding(.top, 24)

                    ClubsAndCompanysNameView(
                        name: "클로즈업"
                    )

                    Text("숭의과학기술고등학교")
                        .bitgouelFont(.text1, color: .primary(.p9))
                        .padding(.top, 24)

                    HStack(spacing: 16) {
                        ClubsAndCompanysNameView(
                            name: "내빵네빵"
                        )

                        ClubsAndCompanysNameView(
                            name: "카페바리"
                        )
                    }

                    ClubsAndCompanysNameView(
                        name: "쿠킹마스터즈"
                    )

                    Text("전남공업고등학교")
                        .bitgouelFont(.text1, color: .primary(.p9))
                        .padding(.top, 24)

                    ClubsAndCompanysNameView(
                        name: "그린라이트"
                    )
                }
                Spacer()
            }
            .padding(.horizontal, 28)

            Spacer()
        }
        .background(
            Image("mainpage_image_6")
                .blur(radius: 6, opaque: true)
        )
    }
}

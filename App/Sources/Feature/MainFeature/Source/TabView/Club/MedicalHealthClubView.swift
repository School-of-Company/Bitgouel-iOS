import SwiftUI

struct MedicalHealthClubView: View {
    var body: some View {
        VStack {
            Text("의료•헬스케어")
                .bitgouelFont(.title2, color: .primary(.p9))
                .padding(.top, 72)

            HStack {
                VStack(alignment: .leading) {
                    Group {
                        Text("광주전자공업고등학교")
                            .bitgouelFont(.text1, color: .primary(.p9))
                            .padding(.top, 24)

                        ClubsAndCompanysNameView(
                            name: "발자국"
                        )

                        Text("금파공업고등학교")
                            .bitgouelFont(.text1, color: .primary(.p9))
                            .padding(.top, 24)

                        ClubsAndCompanysNameView(
                            name: "어썸(awesome"
                        )

                        Text("동일미래과학고등학교")
                            .bitgouelFont(.text1, color: .primary(.p9))
                            .padding(.top, 24)

                        HStack(spacing: 16) {
                            ClubsAndCompanysNameView(
                                name: "따고잡고"
                            )

                            ClubsAndCompanysNameView(
                                name: "쓰고잡고"
                            )

                            ClubsAndCompanysNameView(
                                name: "하고잡고"
                            )
                        }

                        Text("송원여자상업고등학교")
                            .bitgouelFont(.text1, color: .primary(.p9))
                            .padding(.top, 24)

                        HStack(spacing: 16) {
                            ClubsAndCompanysNameView(
                                name: "건강지킴이"
                            )

                            ClubsAndCompanysNameView(
                                name: "미용서비스"
                            )
                        }

                        ClubsAndCompanysNameView(
                            name: "뷰티아트"
                        )
                    }

                    Text("숭의과학기술고등학교")
                        .bitgouelFont(.text1, color: .primary(.p9))
                        .padding(.top, 24)

                    ClubsAndCompanysNameView(
                        name: "크로스핏마스터"
                    )

                    Text("전남공업고등학교")
                        .bitgouelFont(.text1, color: .primary(.p9))
                        .padding(.top, 24)

                    ClubsAndCompanysNameView(
                        name: "라온하제"
                    )
                }
                Spacer()
            }
            .padding(.horizontal, 28)

            Spacer()
        }
        .background(
            Image("mainpage_image_5")
                .blur(radius: 6, opaque: true)
        )
    }
}

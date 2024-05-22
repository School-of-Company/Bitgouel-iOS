import SwiftUI

struct MedicalHealthCompanyView: View {
    var body: some View {
        VStack {
            Text("의료•헬스케어")
                .bitgouelFont(.title2, color: .primary(.p9))
                .padding(.top, 72)

            HStack {
                VStack(alignment: .leading, spacing: 24) {
                    HStack(spacing: 16) {
                        ClubsAndCompanysNameView(
                            name: "엠코테크놀로지코리아(주)"
                        )

                        ClubsAndCompanysNameView(
                            name: "(주)여보야"
                        )
                    }

                    HStack(spacing: 16) {
                        ClubsAndCompanysNameView(
                            name: "인디제이"
                        )

                        ClubsAndCompanysNameView(
                            name: "지니소프트"
                        )
                    }

                    HStack(spacing: 16) {
                        ClubsAndCompanysNameView(
                            name: "건주이앤씨"
                        )

                        ClubsAndCompanysNameView(
                            name: "연제측량기술원"
                        )
                    }

                    ClubsAndCompanysNameView(
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
                .resizable()
                .aspectRatio(contentMode: .fill)
                .blur(radius: 6, opaque: true)
        )
    }
}

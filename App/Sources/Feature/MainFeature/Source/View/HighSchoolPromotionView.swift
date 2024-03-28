import SwiftUI

struct HighSchoolPromotionView: View {
    var body: some View {
        VStack(spacing: 16) {
            IntroduceView(
                introduceTitle: "직업계고 소개",
                introduceText: "직업계고 계열별 학교현황 및 진로"
            )

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 24) {
                    Group {
                        highSchoolListRow(
                            schoolImage: "gwangjuNaturalScienceHighSchool",
                            schoolName: "광주자연과학고등학교"
                        )

                        highSchoolListRow(
                            schoolImage: "jeonnamTechnicalHighSchool",
                            schoolName: "전남공업고등학교"
                        )

                        highSchoolListRow(
                            schoolImage: "sunguiScienceTechnologyHighSchool",
                            schoolName: "숭의과학기술고등학교"
                        )

                        highSchoolListRow(
                            schoolImage: "dongilHighSchoolOfFutureScienceHighSchool",
                            schoolName: "동일미래과학고등학교"
                        )

                        highSchoolListRow(
                            schoolImage: "jeonnamGirlsCommercialHighSchool",
                            schoolName: "전남여자상업고등학교"
                        )

                        highSchoolListRow(
                            schoolImage: "seojinGirlsHighSchool",
                            schoolName: "서진여자고등학교"
                        )

                        highSchoolListRow(
                            schoolImage: "gwangjuTechnicalHighSchool",
                            schoolName: "광주공업고등학교"
                        )

                        highSchoolListRow(
                            schoolImage: "kumpaTechnicalHighSchool",
                            schoolName: "금파공업고등학교"
                        )

                        highSchoolListRow(
                            schoolImage: "songwonGirlsCommercialHighSchool",
                            schoolName: "송원여자상업고등학교"
                        )

                        highSchoolListRow(
                            schoolImage: "gwangjuAutomaticEquipmentTechnicalHighSchool",
                            schoolName: "광주자동화설비\n 공업고등학교"
                        )
                    }

                    highSchoolListRow(
                        schoolImage: "gwangjuSoftwareMeisterHighSchool",
                        schoolName: "광주소프트웨어\n마이스터고등학교"
                    )

                    highSchoolListRow(
                        schoolImage: "gwangjuElectronicTechnicalHighSchool",
                        schoolName: "광주전자공업고등학교"
                    )

                    highSchoolListRow(
                        schoolImage: "gwangjuGirlsCommercialHighSchool",
                        schoolName: "광주여자상업고등학교"
                    )
                }
            }
        }
    }

    @ViewBuilder
    func highSchoolListRow(
        schoolImage: String,
        schoolName: String
    ) -> some View {
        VStack(spacing: 8) {
            Image(schoolImage)
                .frame(width: 80, height: 80)

            Text(schoolName)
                .bitgouelFont(.caption, color: .greyscale(.g4))
                .padding(.bottom)
        }
    }
}

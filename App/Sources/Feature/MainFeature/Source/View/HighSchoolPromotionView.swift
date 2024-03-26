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
                            SchoolName: "광주자연과학고등학교"
                        )
                        
                        highSchoolListRow(
                            schoolImage: "jeonnamTechnicalHighSchool",
                            SchoolName: "전남공업고등학교"
                        )
                        
                        highSchoolListRow(
                            schoolImage: "sunguiScienceTechnologyHighSchool",
                            SchoolName: "숭의과학기술고등학교"
                        )
                        
                        highSchoolListRow(
                            schoolImage: "dongilHighSchoolOfFutureScienceHighSchool",
                            SchoolName: "동일미래과학고등학교"
                        )
                        
                        highSchoolListRow(
                            schoolImage: "jeonnamGirlsCommercialHighSchool",
                            SchoolName: "전남여자상업고등학교"
                        )
                        highSchoolListRow(
                            schoolImage: "seojinGirlsHighSchool",
                            SchoolName: "서진여자고등학교"
                        )
                        
                        highSchoolListRow(
                            schoolImage: "gwangjuTechnicalHighSchool",
                            SchoolName: "광주공업고등학교"
                        )
                        
                        highSchoolListRow(
                            schoolImage: "kumpaTechnicalHighSchool",
                            SchoolName: "금파공업고등학교"
                        )
                        
                        highSchoolListRow(
                            schoolImage: "songwonGirlsCommercialHighSchool",
                            SchoolName: "송원여자상업고등학교"
                        )
                        
                        highSchoolListRow(
                            schoolImage: "gwangjuAutomaticEquipmentTechnicalHighSchool",
                            SchoolName: "광주자동화설비\n 공업고등학교"
                        )
                    }
                    
                    highSchoolListRow(
                        schoolImage: "gwangjuSoftwareMeisterHighSchool",
                        SchoolName: "광주소프트웨어\n마이스터고등학교"
                    )
                    
                    highSchoolListRow(
                        schoolImage: "gwangjuElectronicTechnicalHighSchool",
                        SchoolName: "광주전자공업고등학교"
                    )
                    
                    highSchoolListRow(
                        schoolImage: "gwangjuGirlsCommercialHighSchool",
                        SchoolName: "광주여자상업고등학교"
                    )
                }
            }
        }
    }
    
    @ViewBuilder
    func highSchoolListRow(
        schoolImage: String,
        SchoolName: String
    ) -> some View {
        VStack(spacing: 8) {
            Image(schoolImage)
                .frame(width: 80, height: 80)
            
            Text(SchoolName)
                .bitgouelFont(.caption, color: .greyscale(.g4))
                .padding(.bottom)
        }
    }
}

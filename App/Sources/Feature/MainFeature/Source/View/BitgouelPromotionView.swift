import SwiftUI

struct BitgouelPromotionView: View {
    var body: some View {
        VStack {
            Group {
                IntroduceView(
                    introduceTitle: "빛고을 직업교육 혁신지구",
                    introduceText: "지역발전 사업을 위해 당신이 필요해요"
                )
                
                jobDetailRow(
                    jobDetailTitle: "🏫 직업계고",
                    jobDetailText: "  •  교육과정 운영\n  •  진로 지도\n  •  학생 관리"
                )
                
                jobDetailRow(
                    jobDetailTitle: "🎓 지역대학",
                    jobDetailText: "  •  기업 연계 교육\n  •  심화 교육\n  •  후학습지원"
                )
                
                jobDetailRow(
                    jobDetailTitle: "🏢 지역기업",
                    jobDetailText: "  •  현장 맞춤형 교육\n  •  현장실습\n  •  고졸 채용"
                )
                
                jobDetailRow(
                    jobDetailTitle: "💼 유관기관",
                    jobDetailText: "  •  산업 인력 분석\n  •  특화프로그램 운영\n  •  고졸채용네트워크 구축"
                )
            }
        }
    }
    
    @ViewBuilder
    func jobDetailRow(
        jobDetailTitle: String,
        jobDetailText: String
    ) -> some View {
        VStack {
            HStack {
                Text(jobDetailTitle)
                    .bitgouelFont(.title3)
                    .padding(.bottom, 8)

                Spacer()
            }

            HStack {
                Text(jobDetailText)
                    .bitgouelFont(.text2, color: .greyscale(.g4))

                Spacer()
            }
        }
        .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
    }
}

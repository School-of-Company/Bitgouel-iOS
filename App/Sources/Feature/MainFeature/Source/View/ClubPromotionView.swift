import SwiftUI

struct ClubPromotionView: View {
    var body: some View {
        VStack(spacing: 36) {
            IntroduceView(
                introduceTitle: "취업동아리 소개",
                introduceText: ""
            )

            VStack(spacing: 16) {
                clubRoleRow(
                    clubRole: "취동샘",
                    clubRoleDetail: "취업동아리 담당교사\n동아리 운영",
                    clubRoleText: [
                        "  •  취업동아리 지도교사 멘토",
                        "  •  동아리 학생 선발, 학생관리, 프로그램, 학생지원",
                        "  •  전공기초 방과후 운영",
                        "  •  컨설턴트 멘토 매칭 및 상담지"
                    ]
                )

                clubRoleRow(
                    clubRole: "취동선후배",
                    clubRoleDetail: "취업동아리 선•후배\n협력 지지 활동",
                    clubRoleText: [
                        "  •  학교에서 끌어주고, 밀어주는 또래 멘토",
                        "  •  졸업 후에는 현장 실무 및 비전 지원",
                        "  •  재직 기업 채용 시 동아리 후배 추천"
                    ]
                )

                clubRoleRow(
                    clubRole: "대학교수",
                    clubRoleDetail: "현장 실무형 교육 및 멘토",
                    clubRoleText: [
                        "  •  일학습병행 경로 선이수 학점 운영",
                        "  •  대학 학과체험 프로그램, 채용 연계 지원",
                        "  •  전공 심화 맞춤 교육",
                        "  •  진로 지원 취업 동아리 1:1 멘토"
                    ]
                )

                clubRoleRow(
                    clubRole: "기업 현장 교사",
                    clubRoleDetail: "기업 맞춤형 교육 및 멘토",
                    clubRoleText: [
                        "  •  현장중심직무체험, 직무교육운영",
                        "  •  취업경로 학생 취업 연계 지원",
                        "  •  현장 실무 중심 맞춤 지원 및 동아리 1:1 멘토"
                    ]
                )

                clubRoleRow(
                    clubRole: "유관기관 강사",
                    clubRoleDetail: "현장 실무형 교육 및 멘토",
                    clubRoleText: [
                        "  •  취업경로 현장 실무형 맞춤 교육 운영",
                        "  •  참여가업 채용 연계 지원",
                        "  •  현장 실무 중심 지원 멘토 활동"
                    ]
                )
            }
        }
    }

    @ViewBuilder
    func clubRoleRow(
        clubRole: String,
        clubRoleDetail: String,
        clubRoleText: [String]
    ) -> some View {
        VStack {
            HStack {
                Text(clubRole)
                    .bitgouelFont(.text1)

                Spacer()
            }

            HStack {
                Text(clubRoleDetail)
                    .bitgouelFont(.text2, color: .greyscale(.g4))

                Spacer()
            }
            .padding(.bottom, 16)

            LazyVStack(spacing: 0) {
                ForEach(clubRoleText, id: \.self) { text in
                    HStack {
                        Text(text)
                            .bitgouelFont(.caption, color: .greyscale(.g7))

                        Spacer()
                    }
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 24)
    }
}

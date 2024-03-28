import SwiftUI

struct UniversityView: View {
    var body: some View {
        VStack(spacing: 24) {
            IntroduceView(
                introduceTitle: "연계 대학 소개",
                introduceText: ""
            )

            universityRow(
                universityName: "송원대학교",
                universityDepartment: "철도운전관제시스템과, 철도차량전기시스템과,\n미용예술학과, 철도운전경영과, 사회복지학과,\n간호학과, 건축공학과"
            )

            // swiftlint: disable line_length
            universityRow(
                universityName: "호남대학교",
                universityDepartment: "로봇드론공학과, 전기공학과, 정보통신공학과,\n뷰티미용학과, 토목환경공학과, 외식조리학과,\n건축학과, 조경학과, 작업치료학과(수의사),\n경영학과"
            )
            // swiftlint: enable line_length

            universityRow(
                universityName: "조선이공대학교",
                universityDepartment: "기계설기과, 자동화시스템과, 특수전군사학과,\n미래자동차과, 전자과, 하이테크 CAD/CAM과,\n호텔조리파티쉐과"
            )

            universityRow(
                universityName: "동강대학교",
                universityDepartment: "AI융합기계과, K뷰티아트과, AI드론과,\n외식조리제빵과"
            )

            universityRow(
                universityName: "서영대학교",
                universityDepartment: "자동차과, 전기과, 생명공학과, 뷰티미용과,\n치위생과, E크리에이터과"
            )

            universityRow(
                universityName: "남부대학교",
                universityDepartment: "자동차기계공학과, 전기공학과, 항장미용학과,\n호텔조리학과"
            )
        }
    }

    @ViewBuilder
    func universityRow(
        universityName: String,
        universityDepartment: String
    ) -> some View {
        VStack {
            HStack {
                Text(universityName)
                    .bitgouelFont(.text1, color: .primary(.p3))

                Spacer()
            }
            .padding(.bottom, 12)

            HStack {
                Text(universityDepartment)
                    .bitgouelFont(.text3, color: .greyscale(.g4))

                Spacer()
            }
            .padding(.bottom, 24)
        }
    }
}

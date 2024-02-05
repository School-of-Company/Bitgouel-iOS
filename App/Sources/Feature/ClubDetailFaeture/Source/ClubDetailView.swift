import SwiftUI

struct ClubDetailView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            VStack(spacing: 24) {
                VStack(alignment: .leading, spacing: 4) {
                    BitgouelText(
                        text: "동아리 이름",
                        font: .title2
                    )

                    HStack {
                        BitgouelText(
                            text: "소속 학교",
                            font: .text3
                        )

                        Spacer()

                        BitgouelText(
                            text: "학교 이름",
                            font: .text3
                        )
                    }
                    .foregroundColor(.bitgouel(.primary(.p5)))

                    HStack {
                        BitgouelText(
                            text: "담당 선생님",
                            font: .text3
                        )

                        Spacer()

                        BitgouelText(
                            text: "선생님 성함",
                            font: .text3
                        )
                    }
                    .foregroundColor(.bitgouel(.greyscale(.g4)))
                }
                .padding(.top, 24)

                VStack(spacing: 20) {
                    ClubMemberListRow(
                        id: "1",
                        name: "김선생",
                        autority: .teacher
                    )

                    ClubMemberListRow(
                        id: "2",
                        name: "김학생",
                        autority: .student
                    )
                }

                Spacer()
            }
            .padding(.horizontal, 28)
            .bitgouelBackButton(dismiss: dismiss)
        }
    }
}

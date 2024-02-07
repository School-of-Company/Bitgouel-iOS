import SwiftUI

struct ClubDetailView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: ClubDetailViewModel

    init(viewModel: ClubDetailViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationView {
            VStack(spacing: 24) {
                VStack(alignment: .leading, spacing: 4) {
                    BitgouelText(
                        text: viewModel.clubName,
                        font: .title2
                    )

                    HStack {
                        BitgouelText(
                            text: "소속 학교",
                            font: .text3
                        )

                        Spacer()

                        BitgouelText(
                            text: viewModel.highSchoolName,
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
                            text: viewModel.teacher?.name ?? "",
                            font: .text3
                        )
                    }
                    .foregroundColor(.bitgouel(.greyscale(.g4)))
                }
                .padding(.top, 24)

                VStack(alignment: .leading, spacing: 0) {
                    BitgouelText(
                        text: "동아리 인원",
                        font: .text1
                    )

                    Divider()
                        .padding(.top, 12)

                    LazyVStack(spacing: 20) {
                        ClubMemberListRow(
                            id: viewModel.teacher?.id ?? "",
                            name: viewModel.teacher?.name ?? "",
                            autority: .teacher
                        )

                        ForEach(viewModel.students, id: \.id) { student in
                            ClubMemberListRow(
                                id: student.id,
                                name: student.name,
                                autority: .student
                            )
                        }
                    }
                    .padding(.top, 20)
                }

                Spacer()
            }
            .padding(.horizontal, 28)
            .bitgouelBackButton(dismiss: dismiss)
        }
        .onAppear {
            viewModel.onAppear()
        }
    }
}

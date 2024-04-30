import SwiftUI

struct ClubDetailView: View {
    @Environment(\.tabbarHidden) var tabbarHidden
    @StateObject var viewModel: ClubDetailViewModel

    private let studentInfoFactory: any StudentInfoFactory

    init(
        viewModel: ClubDetailViewModel,
        studentInfoFactory: any StudentInfoFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.studentInfoFactory = studentInfoFactory
    }

    var body: some View {
        VStack(spacing: 24) {
            if viewModel.isLoading {
                ProgressView()
                    .progressViewStyle(.circular)
            } else {
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
                .padding(.top, -40)

                VStack(alignment: .leading, spacing: 0) {
                    BitgouelText(
                        text: "동아리 인원",
                        font: .text1
                    )

                    Divider()
                        .padding(.top, 12)

                    ScrollView {
                        LazyVStack(spacing: 20) {
                            ClubMemberListRow(
                                id: viewModel.teacher?.teacherID ?? "",
                                name: viewModel.teacher?.name ?? "",
                                autority: .teacher
                            )

                            ForEach(viewModel.students, id: \.studentID) { student in
                                ClubMemberListRow(
                                    id: student.studentID,
                                    name: student.name,
                                    autority: .student
                                )
                                .onTapGesture {
                                    if viewModel.authority != .student || viewModel.userID == student.userID {
                                        viewModel.studentInfoRowDidTap(selectedStudentID: student.studentID)
                                    }
                                }
                            }
                        }
                    }
                    .padding(.top, 20)
                }
            }
        }
        .navigate(
            to: studentInfoFactory.makeView(
                clubID: viewModel.clubID,
                studentID: viewModel.studentID
            ).eraseToAnyView(),
            when: Binding(
                get: { viewModel.isPresentedCertificationView },
                set: { isPresented in
                    viewModel.updateIsPresentedCertificationView(isPresented: isPresented)
                }
            )
        )
        .padding(.horizontal, 28)
        .onAppear {
            viewModel.onAppear()
        }
    }
}

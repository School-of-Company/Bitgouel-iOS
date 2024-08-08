import SwiftUI

struct LectureApplicantListView: View {
    @StateObject var viewModel: LectureApplicantListViewModel

    init(viewModel: LectureApplicantListViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            checkAllButton()

            ScrollView {
                LazyVStack(alignment: .leading, spacing: 12) {
                    ForEach(viewModel.applicantList, id: \.studentID) { student in
                        LectureApplicantListRow(
                            studentInfo: student,
                            state: $viewModel.state,
                            isSelected: Binding(
                                get: { student.isComplete },
                                set: { isSelected in
                                    if isSelected {
                                        viewModel.insertStudent(studentID: student.studentID)
                                    } else {
                                        viewModel.removeStudent(studentID: student.studentID)
                                    }
                                }
                            )
                        )
                        .onTapGesture {
                            viewModel.fetchSelectedStudentDetail(studentID: student.studentID)
                            viewModel.updateIsShowingApplicantStudentDetailBottomSheet(isShowing: true)
                        }

                        Divider()
                    }
                }
            }
            .padding(.top, 24)

            Spacer()
        }
        .overlay(alignment: .bottom) {
            stateChangeButton()
        }
        .padding(.horizontal, 28)
        .onAppear {
            viewModel.onAppear()
        }
        .refreshable {
            viewModel.onAppear()
        }
        .navigationTitle("강의 \(viewModel.state.rawValue)")
        .bitgouelToast(
            text: viewModel.errorMessage,
            isShowing: $viewModel.isErrorOccurred
        )
        .bitgouelAlert(
            title: "선택한 학생의 강의 이수를 \n확정하시겠습니까?",
            description: "한 번 이수를 확정하면 수정할 수 없습니다!",
            isShowing: $viewModel.isShowingConfirmCompletionAlert,
            alertActions: [
                .init(
                    text: "취소",
                    style: .cancel,
                    action: {
                        viewModel.updateIsShowingConfirmCompletionAlert(isShowing: false)
                    }
                ),
                .init(
                    text: "확정",
                    style: .default,
                    action: {
                        viewModel.setLectureCompletion {
                            viewModel.updateIsShowingConfirmCompletionAlert(isShowing: false)
                            viewModel.updateState(state: .general)
                        }
                    }
                )
            ]
        )
        .bitgouelBottomSheet(isShowing: $viewModel.isShowingApplicantStudentDetailBottomSheet) {
            ApplicantStudentDetailBottomSheet(
                studentInfo: viewModel.studentDetailInfo) { cancel in
                    viewModel.updateIsShowingApplicantStudentDetailBottomSheet(isShowing: cancel)
                }
        }
    }

    @ViewBuilder
    func stateChangeButton() -> some View {
        switch viewModel.state {
        case .general:
            BitgouelButton(
                text: "이수 여부 체크",
                style: .primary
            ) {
                viewModel.updateState(state: .check)
            }

        case .check:
            BitgouelButton(
                text: "선택 학생 이수 확정",
                style: .primary
            ) {
                viewModel.updateIsShowingConfirmCompletionAlert(isShowing: true)
            }
        }
    }

    @ViewBuilder
    func checkAllButton() -> some View {
        switch viewModel.state {
        case .general:
            EmptyView()

        case .check:
            VStack(alignment: .leading, spacing: 4) {
                Text("전체")
                    .bitgouelFont(.caption, color: .greyscale(.g4))
                
                CheckButton(
                    isSelected: Binding(
                        get: { viewModel.isSelectedCheckAllButton },
                        set: { isSelected in
                            if isSelected {
                                viewModel.insertAllStudent()
                            } else {
                                viewModel.removeAllStudent()
                            }
                            viewModel.updateIsSelectedCheckAllButton(isSelected: isSelected)
                        }
                    )
                )
            }
        }
    }
}

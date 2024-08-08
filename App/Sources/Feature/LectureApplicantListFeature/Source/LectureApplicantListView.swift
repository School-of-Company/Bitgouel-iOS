import SwiftUI

struct LectureApplicantListView: View {
    @StateObject var viewModel: LectureApplicantListViewModel

    init(viewModel: LectureApplicantListViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 12) {
                    ForEach(viewModel.applicantList, id: \.studentID) { student in
                        LectureApplicantListRow(
                            studentInfo: student,
                            state: $viewModel.state,
                            isSelected: Binding(
                                get: { student.isComplete },
                                set: { isComplete in } 
                            )
                        )

                        Divider()
                    }
                }
            }
            .padding(.top, 24)

            Spacer()
        }
        .padding(.horizontal, 28)
        .onAppear {
            viewModel.onAppear()
        }
        .refreshable {
            viewModel.onAppear()
        }
        .navigationTitle("강의 신청자 명단")
        .bitgouelToast(
            text: viewModel.errorMessage,
            isShowing: $viewModel.isErrorOccurred
        )
    }
}

import SwiftUI

struct SchoolListView: View {
    @ObservedObject var viewModel: StudentSignUpViewModel

    var body: some View {
        VStack(spacing: 8) {
            BitgouelTextField(
                "학교 이름으로 검색",
                text: $viewModel.schoolSearch
            )
            .padding(.horizontal, 28)

            ScrollView {
                LazyVStack {
                    ForEach(viewModel.searchedSchoolList, id: \.self) { school in
                        SchoolListRowView(viewModel: viewModel, school: school)
                    }
                }
            }
        }
    }
}

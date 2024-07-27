import SwiftUI

struct UniversityListView: View {
    @EnvironmentObject var adminPageState: AdminPageState
    @StateObject var viewModel: UniversityListViewModel

    init(viewModel: UniversityListViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            CountHeader(count: viewModel.universityList.count, epic: "대학")

            ScrollView {
                LazyVStack(alignment: .leading, spacing: 12) {
                    ForEach(viewModel.universityList, id: \.universityID) { university in
                        AdminListPageRow(
                            name: university.universityName,
                            detailInfo: "\(university.departments.count)개 학과"
                        )
                        .onTapGesture {
                            viewModel.updateSelectedUniversityInfo(
                                name: university.universityName,
                                departments: university.departments
                            )

                            viewModel.updateIsShowingUniversityDetailBottomSheet(isShowing: true)
                        }

                        Divider()
                    }
                }
            }
        }
        .overlay(alignment: .bottom) {
            ActivateButton(
                text: "새로운 대학 등록",
                buttonType: .add
            ) {
                viewModel.updateIsPresentedInputUniversityPage(isPresented: true)
            }
        }
        .padding(.horizontal, 28)
        .navigationTitle("대학 목록")
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button {
                    viewModel.updateIsShowingAdminPageBottomSheet(isShowing: true)
                } label: {
                    BitgouelAsset.Icons.sandwich.swiftUIImage
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                }
            }
        }
        .bitgouelBottomSheet(isShowing: $viewModel.isShowingAdminPageBottomSheet) {
            AdminPageListBottomSheet(
                selectedPage: viewModel.selectedPage
            ) { page in
                viewModel.updateSelectedPage(page: page)
                adminPageState.adminPageFlow = page
            } cancel: { cancel in
                viewModel.updateIsShowingAdminPageBottomSheet(isShowing: cancel)
            }
        }
        .bitgouelBottomSheet(isShowing: $viewModel.isShowingUniversityDetailBottomSheet) {
            UniversityDetailBottomSheet(
                universityName: viewModel.selectedUniversityName,
                departmentList: viewModel.selectedDepartmentList
            ) { cancel in
                viewModel.updateIsShowingUniversityDetailBottomSheet(isShowing: cancel)
            } editAction: {
                viewModel.updateIsPresentedInputUniversityPage(isPresented: true)
            }
        }
    }
}

import SwiftUI

struct SchoolListView: View {
    @EnvironmentObject var adminPageState: AdminPageState
    @StateObject var viewModel: SchoolListViewModel

    private let inputSchoolFactory: any InputSchoolFactory

    init(
        viewModel: SchoolListViewModel,
        inputSchoolFactory: any InputSchoolFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.inputSchoolFactory = inputSchoolFactory
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            CountHeader(count: viewModel.schoolList.count, epic: "학교")

            ScrollView {
                LazyVStack(alignment: .leading, spacing: 12) {
                    ForEach(viewModel.schoolList, id: \.schoolID) { school in
                        schoolListRow(
                            schoolName: school.schoolName,
                            line: school.line.display(),
                            departmentsCount: school.departments.count,
                            clubsCount: school.clubs.count
                        )
                        .onTapGesture {
                            viewModel.updateSchoolDetailInfo(
                                info: .init(
                                    schoolID: school.schoolID,
                                    logoImageURL: school.logoImageURL,
                                    name: school.schoolName,
                                    line: school.line,
                                    departmentList: school.departments,
                                    clubList: school.clubs.map {
                                        .init(
                                            clubID: $0.clubID,
                                            name: $0.clubName,
                                            field: $0.field
                                        )
                                    }
                                )
                            )

                            viewModel.updateIsShowingSchoolDetailBottomSheet(isShowing: true)
                        }

                        Divider()
                    }
                }
            }
        }
        .overlay(alignment: .bottom) {
            ActivateButton(
                text: "새로운 학교 등록",
                buttonType: .add
            ) {
                viewModel.updateIsShowingSchoolDetailBottomSheet(isShowing: false)
                viewModel.updateIsPresentedInputSchoolInfoView(isPresented: true, state: "등록")
            }
        }
        .onAppear {
            viewModel.onApper()
        }
        .padding(.horizontal, 28)
        .navigationTitle("학교 목록")
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
        .bitgouelBottomSheet(isShowing: $viewModel.isShowingSchoolDetailBottomSheet) {
            SchoolDetailBottomSheet(
                schoolInfo: viewModel.schoolInfo
            ) {
                viewModel.updateIsShowingSchoolDetailBottomSheet(isShowing: false)
                viewModel.updateIsPresentedInputSchoolInfoView(isPresented: true, state: "수정")
            } cancel: { cancel in
                viewModel.updateIsShowingSchoolDetailBottomSheet(isShowing: cancel)
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
        .navigate(
            to: inputSchoolFactory.makeView(
                state: viewModel.state,
                schoolInfo: viewModel.schoolInfo
            ).eraseToAnyView(),
            when: $viewModel.isPresentedInputSchoolInfoView
        )
    }

    @ViewBuilder
    func schoolListRow(
        schoolName: String,
        line: String,
        departmentsCount: Int,
        clubsCount: Int
    ) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            BitgouelText(
                text: schoolName,
                font: .text1
            )

            VStack(alignment: .leading, spacing: 4) {
                Text(line)
                    .bitgouelFont(.caption, color: .greyscale(.g4))

                Text("\(departmentsCount)개 학과, \(clubsCount)개 동아리")
                    .bitgouelFont(.caption, color: .greyscale(.g7))
            }
        }
    }
}

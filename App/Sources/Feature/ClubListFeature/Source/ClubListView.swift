import SwiftUI

struct ClubListView: View {
    @StateObject var viewModel: ClubListViewModel
    @Binding var selection: TabFlow

    private let clubDetailFactory: any ClubDetailFactory

    init(
        viewModel: ClubListViewModel,
        clubDetailFactory: any ClubDetailFactory,
        selection: Binding<TabFlow>
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.clubDetailFactory = clubDetailFactory
        _selection = selection
    }

    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    LazyVStack(spacing: 40) {
                        ForEach(viewModel.schoolClubList, id: \.id) { school in
                            SchoolListView(
                                schoolName: school.schoolName,
                                clubList: school.clubs
                            ) { clubID in
                                viewModel.updateClubID(clubID: clubID)
                                viewModel.updateIsPresentedClubDetailView(isPresented: true)
                            }
                        }
                    }
                    .padding(.horizontal, 28)
                }

                ZStack(alignment: .center) {
                    if viewModel.isPresentedSelectedSchoolPopup {
                        Color.black.opacity(0.4)
                            .edgesIgnoringSafeArea(.all)
                            .onTapGesture {
                                viewModel.isPresentedSelectedSchoolPopup = false
                            }

                        SchoolListPopup(
                            schoolList: viewModel.schoolList,
                            selectedSchool: viewModel.selectedSchool
                        ) { school in
                            viewModel.selectedSchool = school
                            viewModel.fetchClubList()
                            viewModel.isPresentedSelectedSchoolPopup = false
                        } cancel: { cancle in
                            viewModel.isPresentedSelectedSchoolPopup = cancle
                        }
                    }
                }
                .zIndex(1)
            }
            .onAppear {
                viewModel.onAppear()
            }
            .navigationTitle("동아리 목록")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        viewModel.isPresentedSelectedSchoolPopup = true
                    } label: {
                        BitgouelAsset.Icons.setting.swiftUIImage
                            .renderingMode(.template)
                            .frame(width: 24, height: 24)
                            .foregroundColor(.bitgouel(.greyscale(.g8)))
                    }
                }
            }
            .navigate(
                to: clubDetailFactory.makeView(clubID: viewModel.clubID).eraseToAnyView(),
                when: Binding(
                    get: { viewModel.isPresentedClubDetailView },
                    set: { state in viewModel.isPresentedClubDetailView = state }
                )
            )
            .loginAlert(
                isShowing: Binding(
                    get: { viewModel.isShowingLoginAlert },
                    set: { isShowing in
                        viewModel.updateIsShowingLoginAlert(isShowing: isShowing)
                    }
                )
            ) {
                $selection.wrappedValue = .home
            }
            .bitgouelToast(
                text: viewModel.errorMessage,
                isShowing: $viewModel.isErrorOccurred
            )
        }
    }
}

import SwiftUI

struct ClubListView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.tabbarHidden) var tabbarHidden
    @StateObject var viewModel: ClubListViewModel

    private let clubDetailFactory: any ClubDetailFactory

    init(
        viewModel: ClubListViewModel,
        clubDetailFactory: any ClubDetailFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.clubDetailFactory = clubDetailFactory
    }

    var body: some View {
        NavigationView {
            ZStack {
                if viewModel.selectedSchool == nil {
                    ClubListEmptyContentView()
                }

                if viewModel.selectedSchool != nil {
                    ScrollView {
                        VStack(spacing: 0) {
                            HStack {
                                BitgouelText(
                                    text: viewModel.selectedSchool?.display() ?? "",
                                    font: .title3
                                )

                                Spacer()
                            }
                            .padding(.top, 40)

                            Divider()
                                .padding(.top, 12)

                            LazyVStack(spacing: 0) {
                                ForEach(viewModel.clubList, id: \.id) { club in
                                    ClubListRow(clubName: club.name)
                                        .onTapGesture {
                                            viewModel.updateClubID(clubID: club.id)
                                            viewModel.isPresentedClubDetailView = true
                                        }
                                }
                            }
                            .padding(.top, 8)

                            Spacer()
                        }
                        .padding(.horizontal, 28)
                    }
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
            .onChange(of: viewModel.isPresentedClubDetailView) { newValue in
                tabbarHidden.wrappedValue = newValue
            }
        }
    }
}

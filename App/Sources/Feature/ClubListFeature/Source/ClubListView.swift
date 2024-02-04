import SwiftUI

struct ClubListView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: ClubListViewModel

    init(viewModel: ClubListViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationView {
            ZStack {
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

                        ClubListRow(clubName: "동아리 이름")
                            .padding(.top, 12)

                        Spacer()
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
                            viewModel.isPresentedSelectedSchoolPopup = false
                        } cancel: { cancle in
                            viewModel.isPresentedSelectedSchoolPopup = cancle
                        }
                    }
                }
                .zIndex(1)
            }
            .navigationTitle("동아리 목록")
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
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
        }
    }
}

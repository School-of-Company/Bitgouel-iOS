import SwiftUI

struct CompanyListView: View {
    @EnvironmentObject var adminPageState: AdminPageState
    @StateObject var viewModel: CompanyListViewModel

    private let inputCompanyFactory: any InputCompanyFactory

    init(
        viewModel: CompanyListViewModel,
        inputCompanyFactory: any InputCompanyFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.inputCompanyFactory = inputCompanyFactory
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("총 \(viewModel.companyList.count)개 기업")
                .bitgouelFont(.caption, color: .greyscale(.g4))
                .padding(.top, 24)

            Divider()

            ScrollView(showsIndicators: false) {
                LazyVStack(alignment: .leading, spacing: 12) {
                    ForEach(viewModel.companyList, id: \.companyID) { company in
                        AdminListPageRow(
                            name: company.companyName,
                            detailInfo: company.field.display()
                        )
                        .buttonWrapper {
                            viewModel.updateSelectedCompanyInfo(
                                name: company.companyName,
                                detailInfo: company.field.display(),
                                id: company.companyID
                            )

                            viewModel.updateIsShowingCompanyDetailBottomSheet(isShowing: true)
                        }

                        Divider()
                    }
                }
            }
        }
        .onAppear { viewModel.onAppear() }
        .refreshable { viewModel.onAppear() }
        .overlay(alignment: .bottom) {
            ActivateButton(
                text: "새로운 기업 등록",
                buttonType: .add) {
                    viewModel.updateIsPresentedInputCompanyPage(isPresented: true)
                }
        }
        .padding(.horizontal, 28)
        .navigationTitle("기업목록")
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
        .bitgouelBottomSheet(isShowing: $viewModel.isShowingCompanyDetailBottomSheet) {
            OrganizationDetailBottomSheet(
                epic: "기업",
                name: viewModel.selectedCompanyName,
                detailInfo: viewModel.selectedCompanyDetailInfo
            ) { cancel in
                viewModel.updateIsShowingCompanyDetailBottomSheet(isShowing: cancel)
            } deleteAction: {
                viewModel.deleteCompany {
                    viewModel.updateIsShowingCompanyDetailBottomSheet(isShowing: false)
                    viewModel.onAppear()
                }
            }
        }
        .bitgouelToast(
            text: viewModel.errorMessage,
            isShowing: $viewModel.isErrorOccurred
        )
        .navigate(
            to: inputCompanyFactory.makeView().eraseToAnyView(),
            when: Binding(
                get: { viewModel.isPresentedInputCompanyPage },
                set: { isPresented in
                    viewModel.updateIsPresentedInputCompanyPage(isPresented: isPresented)
                }
            )
        )
    }
}

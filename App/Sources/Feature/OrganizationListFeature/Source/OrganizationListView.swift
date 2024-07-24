import SwiftUI

struct OrganizationListView: View {
    @EnvironmentObject var adminPageState: AdminPageState
    @StateObject var viewModel: OrganizationListViewModel

    private let inputOrganizationFactory: any InputOrganizationFactory

    init(
        viewModel: OrganizationListViewModel,
        inputOrganizationFactory: any InputOrganizationFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.inputOrganizationFactory = inputOrganizationFactory
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            CountHeader(count: viewModel.organizationList.count, epic: viewModel.organization.display())

            ScrollView(showsIndicators: false) {
                LazyVStack(alignment: .leading, spacing: 12) {
                    ForEach(viewModel.organizationList, id: \.organizationID) { organization in
                        AdminListPageRow(
                            name: organization.name,
                            detailInfo: organization.field.display()
                        )
                        .buttonWrapper {
                            viewModel.updateSelectedOrganizationInfo(
                                name: organization.name,
                                field: organization.field.display(),
                                id: organization.organizationID
                            )

                            viewModel.updateIsShowingOrganizationDetailBottomSheet(isShowing: true)
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
                text: "새로운 \(viewModel.organization.display()) 등록",
                buttonType: .add
            ) {
                viewModel.updateIsPresentedInputOrganizationPage(isPresented: true)
            }
        }
        .padding(.horizontal, 28)
        .navigationTitle("\(viewModel.organization.rawValue) 목록")
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
        .bitgouelBottomSheet(isShowing: $viewModel.isShowingOrganizationDetailBottomSheet) {
            OrganizationDetailBottomSheet(
                epic: viewModel.organization.display(),
                name: viewModel.selectedOrganizationName,
                detailInfo: viewModel.selectedOrganizationField
            ) { cancel in
                viewModel.updateIsShowingOrganizationDetailBottomSheet(isShowing: cancel)
            } deleteAction: {
                viewModel.deleteOrganization {
                    viewModel.updateIsShowingOrganizationDetailBottomSheet(isShowing: false)
                    viewModel.onAppear()
                }
            }
        }
        .bitgouelToast(
            text: viewModel.errorMessage,
            isShowing: $viewModel.isErrorOccurred
        )
        .navigate(
            to: inputOrganizationFactory.makeView(type: viewModel.organization).eraseToAnyView(),
            when: Binding(
                get: { viewModel.isPresentedInputOrganizationPage },
                set: { isPresented in
                    viewModel.updateIsPresentedInputOrganizationPage(isPresented: isPresented)
                }
            )
        )
    }
}

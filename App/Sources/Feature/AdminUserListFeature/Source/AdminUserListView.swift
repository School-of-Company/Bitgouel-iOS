import SwiftUI

struct AdminUserListView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: AdminUserListViewModel
    
    private let adminWithdrawUserListFactory: any AdminWithdrawUserListFactory
    private let adminRequestUserSignupFactory: any AdminRequestUserSignupFactory
    
    init(
        viewModel: AdminUserListViewModel,
        adminWithdrawUserListFactory: any AdminWithdrawUserListFactory,
        adminRequestUserSignupFactory: any AdminRequestUserSignupFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.adminWithdrawUserListFactory = adminWithdrawUserListFactory
        self.adminRequestUserSignupFactory = adminRequestUserSignupFactory
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                HStack(spacing: 10) {
                    UserNameSearchTextField(
                        text: $viewModel.keyword
                    )
                    .onChange(of: viewModel.keyword) { _ in
                        viewModel.onAppear()
                    }
                    
                    BitgouelAsset.Icons.filterStroke.swiftUIImage
                        .padding(.horizontal, 10)
                        .padding(.vertical, 15)
                        .overlay {
                            RoundedRectangle(cornerRadius: 8)
                                .strokeBorder(Color.bitgouel(.greyscale(.g7)))
                        }
                        .onTapGesture {
                            viewModel.isPresentedUserTypeFilter = true
                        }
                }
                .padding(.top, 24)
                
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 0) {
                        ForEach(viewModel.userList, id: \.userID) { userInfo in
                            HStack(spacing: 8) {
                                BitgouelText(
                                    text: userInfo.name,
                                    font: .text1
                                )
                                
                                BitgouelText(
                                    text: userInfo.authority.display(),
                                    font: .text1
                                )
                                .foregroundColor(.bitgouel(.greyscale(.g6)))
                            }
                            
                            Divider()
                                .frame(height: 1)
                                .padding(.vertical, 14)
                        }
                    }
                }
                .padding(.top, 24)
            }
            .padding(.horizontal, 28)

            ZStack(alignment: .center) {
                if viewModel.isPresentedUserTypeFilter {
                    Color.black.opacity(0.4)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            viewModel.isPresentedUserTypeFilter = false
                        }
                    
                    UserTypeFilterPopup(
                        userAuthorityType: viewModel.userAuthorityType,
                        selectedAuthority: viewModel.selectedAuthority
                    ) { authority in
                        viewModel.selectedAuthority = authority
                        viewModel.onAppear()
                    } cancel: { cancel in
                        viewModel.updateIsPresentedUserTypeFilter(isPresented: cancel)
                    }
                    .padding(.horizontal, 28)
                    
                }
            }
            .zIndex(1)
        }
        .navigationTitle("사용자 명단")
        .onAppear {
            viewModel.onAppear()
        }
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button {
                    viewModel.isNavigateRequestSignUpDidTap = true
                } label: {
                    BitgouelAsset.Icons.addFill.swiftUIImage
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                }
                
                Button {
                    viewModel.isNavigateWithdrawListDidTap = true
                } label: {
                    BitgouelAsset.Icons.minusFill.swiftUIImage
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                }
            }
        }
        .navigate(
            to: adminRequestUserSignupFactory.makeView().eraseToAnyView(),
            when: Binding(
                get: { viewModel.isNavigateRequestSignUpDidTap }, set: { _ in viewModel.requestSignUpPageDismissed() }
            )
        )
        .navigate(
            to: adminWithdrawUserListFactory.makeView().eraseToAnyView(),
            when: Binding(
                get: { viewModel.isNavigateWithdrawListDidTap },
                set: { _ in viewModel.withdrawListPageDismissed() }
            )
        )
    }
}

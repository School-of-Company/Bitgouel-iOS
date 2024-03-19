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
        VStack(spacing: 0) {
            HStack(spacing: 24) {
                BitgouelText(
                    text: "사용자 명단",
                    font: .title2
                )
                
                Spacer()
                
                BitgouelAsset.Icons.addFill.swiftUIImage
                    .onTapGesture {
                        viewModel.isNavigateRequestSignUpDidTap = true
                    }
                
                BitgouelAsset.Icons.minusFill.swiftUIImage
                    .onTapGesture {
                        viewModel.isNavigateWithdrawListDidTap = true
                    }
            }
            
            HStack(spacing: 10) {
                UserNameSearchTextField(
                    text: $viewModel.searchName
                ) {}
                
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
            
            LazyVStack(alignment: .leading, spacing: 0) {
                ForEach(0..<1) { _ in
                    HStack(spacing: 8) {
                        BitgouelText(
                            text: "홍길동",
                            font: .text1
                        )
                        
                        BitgouelText(
                            text: "학생",
                            font: .text1
                        )
                        .foregroundColor(.bitgouel(.greyscale(.g6)))
                    }
                    
                    Divider()
                        .frame(height: 1)
                        .padding(.vertical, 14)
                }
            }
            .padding(.top, 24)
            
            Spacer()
        }
        .padding(.horizontal, 28)
            ZStack(alignment: .center) {
                if viewModel.isPresentedUserTypeFilter {
                    Color.black.opacity(0.4)
                        .edgesIgnoringSafeArea(.all)
                    
                    UserTypeFilterPopup(
                        userAuthorityType: viewModel.userAuthorityType,
                        selectedAuthority: viewModel.selectedAuthority
                    ) { authority in
                        viewModel.selectedAuthority = authority
                    } cancel: { cancel in
                        viewModel.updateIsPresentedUserTypeFilter(isPresented: cancel)
                    }
                    .padding(.horizontal, 28)
                    
                }
            }
            .navigate(
                to: adminRequestUserSignupFactory.makeView().eraseToAnyView(),
                when: Binding(
                    get: { viewModel.isNavigateRequestSignUpDidTap },
                    set: { _ in viewModel.requestSignUpPageDismissed() }
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

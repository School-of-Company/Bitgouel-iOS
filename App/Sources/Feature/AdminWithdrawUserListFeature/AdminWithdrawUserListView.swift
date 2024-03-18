import SwiftUI

struct AdminWithdrawUserListView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: AdminUserListViewModel
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                HStack(spacing: 24) {
                    BitgouelText(
                        text: "탈퇴 예정자 명단",
                        font: .title2
                    )
                    
                    Spacer()
                    
                    BitgouelAsset.Icons.people.swiftUIImage
                        .onTapGesture {
                            <#code#>
                        }
                    
                    BitgouelAsset.Icons.addFill.swiftUIImage
                        .onTapGesture {
                            <#code#>
                        }
                }
                
                HStack(spacing: 10) {
                    OptionButton(
                        buttonText: "선택 탈퇴",
                        textColor: .bitgouel(.error(.e5)),
                        strokeColor: .bitgouel(.error(.e5)),
                        backgroundColor: .bitgouel(.greyscale(.g10))
                    ) {
                        viewModel.isWithdraw = true
                    }
                    
                    OptionButton(
                        buttonText: "전체 탈퇴",
                        textColor: .bitgouel(.greyscale(.g10)),
                        strokeColor: .bitgouel(.error(.e5)),
                        backgroundColor: .bitgouel(.error(.e5))
                    ) {
                        viewModel.isWithdraw = true
                    }
                    
                    HStack {
                        BitgouelAsset.Icons.filter.swiftUIImage
                        
                        BitgouelText(
                            text: "필터",
                            font: .text3
                        )
                    }
                    .foregroundColor(.bitgouel(.greyscale(.g6)))
                    .padding(.horizontal, 23)
                    .padding(.vertical, 12)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .strokeBorder(Color.bitgouel(.greyscale(.g6)))
                    }
                    .onTapGesture {
                        viewModel.isPresentedUserCohortFilter = true
                    }
                }
                .padding(.top, 24)
                
                LazyVStack(alignment: .leading, spacing: 0) {
                    ForEach(0..<1) { _ in
                        HStack(spacing: 8) {
                            CheckButton(isSelected: $viewModel.isSelectedUserList)
                            
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
                if viewModel.isPresentedUserCohortFilter {
                    Color.black.opacity(0.4)
                        .edgesIgnoringSafeArea(.all)
                    
                    UserCohortFilterPopup(
                        cohortList: viewModel.cohortList,
                        selectedCohort: viewModel.selectedCohort
                    ) { cohort in
                        viewModel.selectedCohort = cohort
                    } cancel: { cancel in
                        viewModel.updateIsPresentedCohortFilter(isPresented: cancel)
                    }
                    .padding(.horizontal, 28)
                }
            }
        }
        .bitgouelAlert(
            title: "탈퇴를 승인 하시겠습니까?",
            description: "",
            isShowing: $viewModel.isWithdraw,
            alertActions: [
                .init(text: "취소", style: .cancel) {
                    viewModel.isWithdraw = false
                },
                .init(text: "승인", style: .error)
            ]
        )
    }
    @ViewBuilder
    func OptionButton(
        buttonText: String,
        textColor: Color,
        strokeColor: Color,
        backgroundColor: Color,
        action: @escaping () -> Void = {}
    ) -> some View {
        BitgouelText(
            text: buttonText,
            font: .text3
        )
        .foregroundColor(textColor)
        .padding(.horizontal, 23)
        .padding(.vertical, 12)
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .strokeBorder(strokeColor)
        }
        .buttonWrapper(action)
        .background(backgroundColor)
        .cornerRadius(8)
    }
}

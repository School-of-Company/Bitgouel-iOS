import SwiftUI

struct MyPageView: View {
    @StateObject var viewModel: MyPageViewModel

    init(viewModel: MyPageViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 40) {
                if let myInfo = viewModel.myInfo {
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            HStack(spacing: 4) {
                                BitgouelText(
                                    text: myInfo.name,
                                    font: .title2
                                )
                                
                                BitgouelText(
                                    text: myInfo.authority.display(),
                                    font: .text1
                                )
                                .foregroundColor(.bitgouel(.greyscale(.g7)))
                            }

                            if viewModel.authority != .admin {
                                HStack(spacing: 4) {
                                    BitgouelText(
                                        text: viewModel.userOrganization,
                                        font: .text1
                                    )
                                    
                                    BitgouelText(
                                        text: "소속",
                                        font: .text1
                                    )
                                    .foregroundColor(.bitgouel(.greyscale(.g7)))
                                }
                                
                                LazyVStack(alignment: .leading, spacing: 4) {
                                    ForEach(viewModel.userInfo, id: \.self) { info in
                                        BitgouelText(
                                            text: info,
                                            font: .text3
                                        )
                                        .foregroundColor(.bitgouel(.greyscale(.g4)))
                                    }
                                }
                            }
                        }
                        
                        Spacer()
                    }
                    .padding(.top, 32)
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            BitgouelText(
                                text: "계정 정보",
                                font: .text1
                            )
                            
                            BitgouelText(
                                text: myInfo.email,
                                font: .text3
                            )
                            .foregroundColor(.bitgouel(.greyscale(.g7)))
                            
                            BitgouelText(
                                text: myInfo.phoneNumber,
                                font: .text3
                            )
                            .foregroundColor(.bitgouel(.greyscale(.g7)))
                        }
                        
                        Spacer()
                    }
                    
                    if viewModel.authority == .admin {
                        adminUserListButton()
                    }
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 21) {
                            BitgouelText(
                                text: "계정 설정",
                                font: .text1
                            )
                            
                            Button {} label: {
                                BitgouelText(
                                    text: "비밀번호 변경",
                                    font: .text3
                                )
                            }
                            .padding(.top, 19)
                            
                            Divider()
                            
                            Button {} label: {
                                BitgouelText(
                                    text: "로그아웃",
                                    font: .text3
                                )
                            }
                            
                            Divider()
                            
                            Button {} label: {
                                BitgouelText(
                                    text: "회원 탈퇴",
                                    font: .text3
                                )
                                .foregroundColor(.bitgouel(.error(.e5)))
                            }
                        }
                        
                        Spacer()
                    }
                    .padding(.top, 60)
                    
                    Spacer()
                }
            }
            .onAppear {
                viewModel.onAppear()
            }
            .navigationTitle("내 정보")
            .padding(.horizontal, 28)
            Spacer()
        }
    }

    @ViewBuilder
    func adminUserListButton() -> some View {
        Button {
            
        } label: {
            BitgouelText(
               text: "사용자 명단 관리하기",
               font: .text3
            )
            .foregroundColor(.bitgouel(.error(.e5)))
        }
    }
}

import SwiftUI

struct SuccessFindPasswordChangeView: View {
    @EnvironmentObject var sceneState: SceneState
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                BitgouelText(
                    text: "빛고을\n직업교육\n혁신지구",
                    font: .title1
                )
                
                Spacer()
            }
            .padding(.top, 53)
            
            Spacer()
            
            VStack {
                BitgouelText(
                    text: "비밀번호 변경 완료",
                    font: .title2
                )
                
                BitgouelText(
                    text: "다시 로그인 해야 합니다",
                    font: .caption
                )
            }
            
            Spacer()
            
            BitgouelButton(
                text: "돌아가기",
                style: .primary
            ) {
                sceneState.sceneFlow = .login
            }
            .padding(.bottom, 20)
        }
        .padding(.horizontal, 28)
        .navigationBarBackButtonHidden()
    }
}

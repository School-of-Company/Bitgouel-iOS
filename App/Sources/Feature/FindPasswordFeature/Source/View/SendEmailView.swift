import SwiftUI

struct SendEmailView: View {
    @Environment(\.dismiss) var dismiss
    let email: String
    let nextToButtonAction: () -> Void

    var body: some View {
        VStack(spacing: 0) {
            BitgouelText(
                text: "\(email)로",
                font: .caption
            )
            .foregroundColor(.bitgouel(.greyscale(.g4)))
            
            BitgouelText(
                text: "확인 이메일 발송됨",
                font: .title2
            )
            .buttonWrapper {
                nextToButtonAction()
            }
        }
        .bitgouelBackButton(dismiss: dismiss)
    }
}

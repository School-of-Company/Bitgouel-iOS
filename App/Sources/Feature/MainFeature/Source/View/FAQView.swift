import Service
import SwiftUI

struct FAQView: View {
    @State var question: String = ""
    @State var answer: String = ""

    var faqList: [FAQInfoEntity]
    let authority: UserAuthorityType

    var body: some View {
        VStack(spacing: 24) {
            IntroduceView(
                introduceTitle: "자주묻는 질문",
                introduceText: "FAQ"
            )

            LazyVStack(spacing: 16) {
                ForEach(faqList, id: \.questionID) { faq in
                    faqRow(
                        question: faq.question,
                        answer: faq.answer
                    )
                }
            }
        }
    }

    @ViewBuilder
    func faqRow(
        question: String,
        answer: String
    ) -> some View {
        VStack(spacing: 12) {
            HStack(spacing: 4) {
                Text("Q.")
                    .bitgouelFont(.text3, color: .primary(.p5))

                BitgouelText(
                    text: question,
                    font: .text3
                )
            }

            if !answer.isEmpty {
                Divider()

                HStack(spacing: 4) {
                    Text("A.")
                        .bitgouelFont(.text3, color: .primary(.p5))

                    Text(answer)
                        .foregroundColor(.bitgouel(.greyscale(.g4)))
                }
            }
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 20)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(.white)
                .shadow(color: .gray, radius: 1, x: 1, y: 1)
                .opacity(0.3)
        )
    }
}

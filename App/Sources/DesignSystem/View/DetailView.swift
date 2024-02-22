import SwiftUI

struct DetailView: View {
    let title: String
    let content: String
    let links: [String]
    let deleteAction: () -> Void
    let editAction: () -> Void
    @Binding var isDelete: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            VStack(alignment: .leading) {
                BitgouelText(
                    text: title,
                    font: .text1
                )
                .padding(.top, 4)
            }

            Divider()

            ScrollView {
                VStack(alignment: .leading, spacing: 28) {
                    BitgouelText(
                        text: content,
                        font: .caption
                    )

                    if !links.isEmpty  {
                        relatedLinkRow()
                            .padding(.top, -24)
                    }
                }
            }

            popupButton()
        }
        .padding(.horizontal, 28)
        .bitgouelAlert(
            title: "게시글을 삭제하시겠습니까?",
            description: content,
            isShowing: $isDelete,
            alertActions: [
                .init(text: "취소", style: .cancel) {
                    isDelete = false
                },
                .init(text: "삭제", style: .error) {
                    deleteAction()
                }
            ]
        )
    }
    
    @ViewBuilder
    func relatedLinkRow() -> some View {
        VStack {
            BitgouelText(
                text: "관련 링크 보기",
                font: .text1
            )
            
            VStack(
                alignment: .leading,
                spacing: 4
            ) {
                ForEach(links, id: \.self) { link in
                    Link(destination: URL(string: link)!) {
                        BitgouelText(
                            text: "\(link)",
                            font: .caption
                        )
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    func popupButton() -> some View {
        HStack {
            CTAButton(
                text: "수정하기",
                style: .default,
                action: {
                    editAction()
                }
            )

            Spacer()

            CTAButton(
                text: "삭제하기",
                style: .error,
                action: {
                    isDelete = true
                }
            )
        }
    }
}

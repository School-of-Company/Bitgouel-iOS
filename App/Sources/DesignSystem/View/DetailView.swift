import SwiftUI

struct DetailView: View {
    let title: String
    let content: String
    let writer: String
    let modifiedAt: String
    let links: [String]
    let writtenBy: Bool
    let deleteAction: () -> Void
    let editAction: () -> Void
    @Binding var isDelete: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            VStack(alignment: .leading, spacing: 4) {
                BitgouelText(
                    text: title,
                    font: .text1
                )
                .padding(.top, 4)

                HStack {
                    Text("\(modifiedAt)에 게시")

                    Spacer()

                    Text(writer)
                }
                .bitgouelFont(.caption, color: .greyscale(.g7))
            }

            Divider()

            ScrollView {
                VStack(alignment: .leading, spacing: 28) {
                    BitgouelText(
                        text: content,
                        font: .caption
                    )

                    if !links.isEmpty {
                        Divider()

                        relatedLinkRow()
                    }
                }
            }

            if writtenBy {
                popupButton()
            }
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
        VStack(alignment: .leading) {
            BitgouelText(
                text: "관련 링크 보기",
                font: .text1
            )

            VStack(alignment: .leading, spacing: 4) {
                ForEach(links, id: \.self) { link in
                    if let url = URL(string: link) {
                        Link(
                            destination: url,
                            label: {
                                BitgouelText(
                                    text: "\(url)",
                                    font: .caption
                                )
                                .multilineTextAlignment(.leading)
                            }
                        )
                    }
                }
            }
        }
    }

    @ViewBuilder
    func popupButton() -> some View {
        HStack {
            BitgouelButton(
                text: "수정하기",
                style: .primary,
                action: {
                    editAction()
                }
            )

            Spacer()

            BitgouelButton(
                text: "삭제하기",
                style: .error,
                action: {
                    isDelete = true
                }
            )
        }
    }
}

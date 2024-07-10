import SwiftUI

public struct OtherPageListBottomSheet: View {
    let pageList: [OtherPage] = OtherPage.allCases
    let selectedPage: OtherPage?
    let onSelectedPage: (OtherPage) -> Void
    let cancel: (Bool) -> Void

    public var body: some View {
        VStack(spacing: 8) {
            HStack {
                BitgouelText(
                    text: "다른 목록 관리",
                    font: .title3
                )

                Spacer()

                Button {
                    cancel(false)
                } label: {
                    BitgouelAsset.Icons.cancel.swiftUIImage
                }
            }
            .padding(.top, 24)

            Spacer()

            ScrollView(showsIndicators: false) {
                VStack(spacing: 16) {
                    ForEach(pageList, id: \.self) { authority in
                        userAuthorityTypeRow(
                            page: authority,
                            selectedPage: selectedPage,
                            onSelectedPage: onSelectedPage
                        )
                    }
                }
            }
        }
        .frame(height: 400)
        .padding(.horizontal, 24)
    }

    @ViewBuilder
    func userAuthorityTypeRow(
        page: OtherPage,
        selectedPage: OtherPage?,
        onSelectedPage: @escaping (OtherPage) -> Void
    ) -> some View {
        HStack {
            Text(page.rawValue)

            Spacer()

            BitgouelRadioButton(
                isSelected: Binding(
                    get: { selectedPage?.rawValue == page.rawValue },
                    set: { isSelected in
                        if isSelected {
                            onSelectedPage(page)
                        }
                    }
                )
            )
        }
        .padding(.vertical, 24)
        .onTapGesture {
            onSelectedPage(page)
        }
    }
}

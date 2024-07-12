import SwiftUI

public struct AdminPageListBottomSheet: View {
    let pageList: [AdminPageFlow] = AdminPageFlow.allCases
    let selectedPage: AdminPageFlow?
    let onSelectedPage: (AdminPageFlow) -> Void
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
                        adminPageTypeRow(
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
    func adminPageTypeRow(
        page: AdminPageFlow,
        selectedPage: AdminPageFlow?,
        onSelectedPage: @escaping (AdminPageFlow) -> Void
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

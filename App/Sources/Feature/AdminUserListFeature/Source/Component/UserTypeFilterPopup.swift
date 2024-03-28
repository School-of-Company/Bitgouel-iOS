import Service
import SwiftUI

struct UserTypeFilterPopup: View {
    let userAuthorityType: [AdminUserListAuthorityType]
    var selectedAuthority: AdminUserListAuthorityType?
    let onAuthoritySelect: (AdminUserListAuthorityType) -> Void
    let cancel: (Bool) -> Void

    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(Color.white)
            .frame(height: 400)
            .overlay {
                VStack(spacing: 0) {
                    HStack {
                        BitgouelText(
                            text: "직업",
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

                    VStack(spacing: 16) {
                        ForEach(userAuthorityType, id: \.self) { authority in
                            userAuthorityTypeRow(
                                authority: authority,
                                selectedAuthority: selectedAuthority,
                                onAuthoritySelect: onAuthoritySelect
                            )
                        }

                        Spacer()
                    }
                    .padding(.top, 32)
                }
                .padding(.horizontal, 24)
            }
    }

    @ViewBuilder
    func userAuthorityTypeRow(
        authority: AdminUserListAuthorityType,
        selectedAuthority: AdminUserListAuthorityType?,
        onAuthoritySelect: @escaping (AdminUserListAuthorityType) -> Void
    ) -> some View {
        HStack(spacing: 8) {
            BitgouelRadioButton(
                isSelected: Binding(
                    get: { selectedAuthority?.adminUserListValue() == authority.adminUserListValue() },
                    set: { isSelected in
                        if isSelected {
                            onAuthoritySelect(authority)
                        }
                    }
                )
            )

            BitgouelText(
                text: authority.adminUserListValue(),
                font: .text3
            )

            Spacer()
        }
    }
}

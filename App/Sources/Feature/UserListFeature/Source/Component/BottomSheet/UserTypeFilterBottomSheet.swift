import Service
import SwiftUI

struct UserTypeFilterBottomSheet: View {
    let userAuthorityType: [AdminUserListAuthorityType] = AdminUserListAuthorityType.allCases
    var selectedAuthority: AdminUserListAuthorityType?
    let onAuthoritySelect: (AdminUserListAuthorityType) -> Void
    let cancel: (Bool) -> Void

    var body: some View {
        VStack(spacing: 8) {
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

            ScrollView(showsIndicators: false) {
                VStack(spacing: 16) {
                    ForEach(userAuthorityType, id: \.self) { authority in
                        userAuthorityTypeRow(
                            authority: authority,
                            selectedAuthority: selectedAuthority,
                            onAuthoritySelect: onAuthoritySelect
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
        authority: AdminUserListAuthorityType,
        selectedAuthority: AdminUserListAuthorityType?,
        onAuthoritySelect: @escaping (AdminUserListAuthorityType) -> Void
    ) -> some View {
        HStack {
            Text(authority.adminUserListValue())

            Spacer()

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
        }
        .padding(.vertical, 24)
        .onTapGesture {
            onAuthoritySelect(authority)
        }
    }
}

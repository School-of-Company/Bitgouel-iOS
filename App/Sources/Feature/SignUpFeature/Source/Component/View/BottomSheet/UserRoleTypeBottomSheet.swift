import Service
import SwiftUI

struct UserRoleTypeBottomSheet: View {
    let selectedAffiliation: AffiliationType
    let selectedUserRole: UserAuthorityType?
    let onUserRoleSelect: (UserAuthorityType) -> Void

    var body: some View {
        ScrollView {
            let data: [UserAuthorityType] = selectedAffiliation == .school
                ? [.student, .teacher]
                : [.companyInstructor, .professor, .bbozzack, .government]

            ForEach(data, id: \.self) { userRole in
                RadioButtonListRow(
                    element: userRole.display(),
                    selectedElement: selectedUserRole?.display()
                ) { _ in
                    onUserRoleSelect(userRole)
                }
            }
        }
        .padding(.horizontal, 28)
    }
}

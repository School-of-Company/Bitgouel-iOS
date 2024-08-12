import SwiftUI

struct AffiliationBottomSheet: View {
    let affiliationList: [AffiliationType] = AffiliationType.allCases
    let selectedAffiliation: AffiliationType?
    let onAffiliationSelect: (AffiliationType) -> Void

    var body: some View {
        ScrollView {
            ForEach(affiliationList, id: \.self) { affiliation in
                RadioButtonListRow(
                    element: affiliation.rawValue,
                    selectedElement: selectedAffiliation?.rawValue
                ) { _ in
                    onAffiliationSelect(affiliation)
                }
            }
        }
        .padding(.horizontal, 28)
    }
}

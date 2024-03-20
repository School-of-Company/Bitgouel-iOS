import SwiftUI
import Service

enum CohortList: String, CaseIterable {
    case first = "1기"
    case second = "2기"
    case third = "3기"
    case fourth = "4기"
}

struct UserCohortFilterPopup: View {
    let cohortList: [CohortList]
    var selectedCohort: CohortList?
    let onCohortSelect: (CohortList) -> Void
    let cancel: (Bool) -> Void
    
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(Color.white)
            .frame(height: 280)
            .overlay {
                VStack(spacing: 0) {
                    HStack {
                        BitgouelText(
                            text: "기수",
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
                        ForEach(cohortList, id: \.self) { cohort in
                            userCohortTypeRow(
                                cohort: cohort,
                                selectedCohort: selectedCohort,
                                onCohortSelect: onCohortSelect)
                        }
                        
                        Spacer()
                    }
                    .padding(.top, 32)
                }
                .padding(.horizontal, 24)
            }
    }
    
    @ViewBuilder
    func userCohortTypeRow(
        cohort: CohortList,
        selectedCohort: CohortList?,
        onCohortSelect: @escaping (CohortList) -> Void
    ) -> some View {
        HStack(spacing: 8) {
            BitgouelRadioButton(
                isSelected: Binding(
                    get: { selectedCohort?.rawValue == cohort.rawValue },
                    set: { isSelected in
                        if isSelected {
                            onCohortSelect(cohort)
                        }
                    }
                )
            )
            
            BitgouelText(
                text: cohort.rawValue,
                font: .text3
            )
            
            Spacer()
        }
    }
}

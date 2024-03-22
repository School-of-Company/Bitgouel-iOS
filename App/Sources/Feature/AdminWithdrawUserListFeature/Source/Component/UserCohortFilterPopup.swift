import SwiftUI
import Service

struct UserCohortFilterPopup: View {
    let currentYear: Int
    var selectedCohort: Int
    let onCohortSelect: (Int) -> Void
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
                    
                    ScrollView {
                        VStack(spacing: 16) {
                            ForEach(2022...currentYear, id: \.self) { cohort in
                                userCohortTypeRow(
                                    cohort: cohort - 2021,
                                    selectedCohort: selectedCohort,
                                    onCohortSelect: onCohortSelect)
                            }
                            
                            Spacer()
                        }
                    }
                    .padding(.top, 32)

                }
                .padding(.horizontal, 24)
            }
    }
    
    @ViewBuilder
    func userCohortTypeRow(
        cohort: Int,
        selectedCohort: Int?,
        onCohortSelect: @escaping (Int) -> Void
    ) -> some View {
        HStack(spacing: 8) {
            BitgouelRadioButton(
                isSelected: Binding(
                    get: { selectedCohort == cohort },
                    set: { isSelected in
                        if isSelected {
                            onCohortSelect(cohort)
                        }
                    }
                )
            )
            
            BitgouelText(
                text: "\(cohort)기",
                font: .text3
            )
            
            Spacer()
        }
    }
}

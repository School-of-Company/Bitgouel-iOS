import SwiftUI

struct SelectedApplicationPeriodView: View {
    var selectedStartDate: Date
    var selectedEndDate: Date
    let onSelectStartDate: (Date) -> Void
    let onSelectEndDate: (Date) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 28) {
            VStack(alignment: .leading, spacing: 8) {
                BitgouelText(
                    text: "신청 시작일",
                    font: .text1
                )

                DatePicker(
                    "시작일",
                    selection: Binding(
                        get: { selectedStartDate },
                        set: { newValue in
                            onSelectStartDate(newValue)
                        }
                    ),
                    displayedComponents: [.date, .hourAndMinute]
                )
                .datePickerStyle(.automatic)
                .environment(\.locale, .init(identifier: "ko_KR"))
                .padding(.horizontal, 14)
                .padding(.vertical, 8)
                .background(Color.bitgouel(.greyscale(.g9)))
                .cornerRadius(8)
            }

            VStack(alignment: .leading, spacing: 8) {
                BitgouelText(
                    text: "신청 마감일",
                    font: .text1
                )

                DatePicker(
                    "마감일",
                    selection: Binding(
                        get: { selectedEndDate },
                        set: { newValue in
                            onSelectEndDate(newValue)
                        }
                    ),
                    displayedComponents: [.date, .hourAndMinute]
                )
                .datePickerStyle(.automatic)
                .environment(\.locale, .init(identifier: "ko_KR"))
                .padding(.horizontal, 14)
                .padding(.vertical, 8)
                .background(Color.bitgouel(.greyscale(.g9)))
                .cornerRadius(8)
            }
        }
    }
}

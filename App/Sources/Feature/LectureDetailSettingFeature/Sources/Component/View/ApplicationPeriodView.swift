import SwiftUI

struct ApplicationPeriodView: View {
    @Binding var selectedStartDate: Date
    @Binding var selectedEndDate: Date

    var body: some View {
        VStack(alignment: .leading, spacing: 28) {
            VStack(alignment: .leading, spacing: 8) {
                BitgouelText(
                    text: "신청 시작일",
                    font: .text1
                )

                DatePicker(
                    "시작일",
                    selection: $selectedStartDate,
                    displayedComponents: [.date, .hourAndMinute]
                )
                .datePickerStyle(.compact).labelsHidden()
                .environment(\.locale, .init(identifier: "ko_KR"))
                .cornerRadius(8)
            }

            VStack(alignment: .leading, spacing: 8) {
                BitgouelText(
                    text: "마감일",
                    font: .text1
                )

                DatePicker(
                    "",
                    selection: $selectedEndDate,
                    displayedComponents: [.date, .hourAndMinute]
                )
                .datePickerStyle(.compact).labelsHidden()
                .environment(\.locale, .init(identifier: "ko_KR"))
                .cornerRadius(8)
            }
        }
    }
}

import SwiftUI

struct MaxRegisteredUserBottomSheet: View {
    @Binding var selectedMaxRegisteredUser: Int
    let maxRegisteredUserValue: [Int] = [5, 6, 7, 8, 9, 10]

    var body: some View {
        Picker("", selection: $selectedMaxRegisteredUser) {
            ForEach(maxRegisteredUserValue, id: \.self) { userCount in
                BitgouelText(
                    text: "\(userCount)명",
                    font: .text2
                )
            }
        }
        .pickerStyle(.wheel)
    }
}

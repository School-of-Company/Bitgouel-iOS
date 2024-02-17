import SwiftUI

struct UniversityView: View {
    var universityName: String
    var universityDepartment: String

    var body: some View {
        VStack {
            HStack {
                Text(universityName)
                    .bitgouelFont(.text1, color: .primary(.p3))

                Spacer()
            }
            .padding(.bottom, 12)

            HStack {
                Text(universityDepartment)
                    .bitgouelFont(.text3, color: .greyscale(.g4))

                Spacer()
            }
            .padding(.bottom, 24)
        }
    }
}

import SwiftUI

struct InputCertificationView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: InputCertificationViewModel

    init(viewModel: InputCertificationViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 8) {
                    BitgouelText(
                        text: "자격증",
                        font: .text1
                    )

                    BitgouelTextField(
                        "자격증 이름 입력",
                        text: Binding(
                            get: { viewModel.certificationName },
                            set: { name in viewModel.certificationName = name }
                        )
                    )
                }
                .padding(.top, 28)

                VStack(alignment: .leading, spacing: 8) {
                    BitgouelText(
                        text: "취득일",
                        font: .text1
                    )

                    DatePicker(
                        "취득일",
                        selection: Binding(get: {
                            viewModel.acquisitionDate
                        }, set: { newValue in
                            viewModel.updateDate(date: newValue)
                        }),
                        displayedComponents: [.date]
                    )
                    .datePickerStyle(.compact)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 20)
                    .background(Color.bitgouel(.greyscale(.g9)))
                    .cornerRadius(8, corners: .allCorners)
                }
                .padding(.top, 28)

                Spacer()

                BitgouelButton(
                    text: "\(viewModel.epic)하기",
                    style: .primary
                ) {
                    viewModel.applyButtonDidTap {
                        dismiss()
                    }
                }
            }
            .padding(.horizontal, 28)
            .navigationTitle("자격증 \(viewModel.epic)")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        BitgouelAsset.Icons.cancel.swiftUIImage
                    }
                }
            }
            .bitgouelToast(
                text: viewModel.errorMessage,
                isShowing: $viewModel.isErrorOccurred
            )
        }
    }
}

import SwiftUI

struct InputCompanyView: View {
    @StateObject var viewModel: InputCompanyViewModel
    @Environment(\.dismiss) var dismiss

    init(viewModel: InputCompanyViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack(spacing: 0) {
            InputDataView(
                epic: "기업",
                state: "등록",
                selectedField: $viewModel.selectedFieldType,
                name: $viewModel.companyName
            ) {
                viewModel.createCompany {
                    dismiss()
                }
            }
        }
        .bitgouelToast(
            text: viewModel.errorMessage,
            isShowing: $viewModel.isErrorOccurred
        )
    }
}

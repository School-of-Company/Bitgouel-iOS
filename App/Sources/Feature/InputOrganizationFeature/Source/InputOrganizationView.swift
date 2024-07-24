import SwiftUI

struct InputOrganizationView: View {
    @StateObject var viewModel: InputOrganizationViewModel
    @Environment(\.dismiss) var dismiss

    init(viewModel: InputOrganizationViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack(spacing: 0) {
            InputDataView(
                epic: viewModel.organization.rawValue,
                state: "등록",
                selectedField: $viewModel.selectedFieldType,
                name: $viewModel.organizationName
            ) {
                viewModel.createOrganization {
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

import SwiftUI

struct InputClubView: View {
    @StateObject var viewModel: InputClubViewModel
    @Environment(\.dismiss) var dismiss

    init(
        viewModel: InputClubViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        InputDataView(
            epic: "동아리",
            state: viewModel.state,
            selectedField: $viewModel.selectedField,
            name: $viewModel.clubName
        ) {
            viewModel.createdClub {
                dismiss()
            }
        } deleteButtonAction: {
            viewModel.updateIsShowingDeleteAlert(isShowing: true)
        } editButtonAction: {
            print("수정")
        }
        .onAppear {
            if viewModel.state == "수정" {
                viewModel.onAppear()
            }
        }
        .bitgouelToast(
            text: viewModel.errorMessage,
            isShowing: $viewModel.isErrorOccurred
        )
        .bitgouelAlert(
            title: "동아리를 삭제하시겠습니까?",
            description: "",
            isShowing: $viewModel.isShowingDeleteAlert,
            alertActions: [
                .init(
                    text: "취소",
                    style: .cancel,
                    action: {
                        viewModel.updateIsShowingDeleteAlert(isShowing: false)
                    }
                ),
                .init(
                    text: "삭제",
                    style: .error,
                    action: {
                        viewModel.deleteClub {
                            dismiss()
                        }
                    }
                )
            ]
        )
    }
}

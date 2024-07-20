import SwiftUI

struct SchoolListView: View {
    @EnvironmentObject var adminPageState: AdminPageState
    @StateObject var viewModel: SchoolListViewModel

    init(viewModel: SchoolListViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack {
            Text("SchoolListView")
        }
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button {
                    viewModel.updateIsShowingAdminPageBottomSheet(isShowing: true)
                } label: {
                    BitgouelAsset.Icons.sandwich.swiftUIImage
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                }
            }
        }
        .bitgouelBottomSheet(isShowing: $viewModel.isShowingAdminPageBottomSheet) {
            AdminPageListBottomSheet(
                selectedPage: viewModel.selectedPage
            ) { page in
                viewModel.updateSelectedPage(page: page)
                adminPageState.adminPageFlow = page
            } cancel: { cancel in
                viewModel.updateIsShowingAdminPageBottomSheet(isShowing: cancel)
            }
        }
    }
}

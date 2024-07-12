import SwiftUI

struct UniversityListView: View {
    @EnvironmentObject var adminPageState: AdminPageState
    @StateObject var viewModel: UniversityListViewModel

    init(viewModel: UniversityListViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            Text("UniversityListView")
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
                selectedPage: viewModel.selectedPage) { page in
                    viewModel.updateSelectedPage(page: page)
                    adminPageState.adminPageFlow = page
                } cancel: { cancel in
                    viewModel.updateIsShowingAdminPageBottomSheet(isShowing: cancel)
                }

        }
    }
}

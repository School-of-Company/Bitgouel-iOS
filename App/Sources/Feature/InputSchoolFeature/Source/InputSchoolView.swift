import SwiftUI

struct InputSchoolView: View {
    @StateObject var viewModel: InputSchoolViewModel

    init(viewModel: InputSchoolViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        Text("schoolInfoView")
    }
}

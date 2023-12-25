import Service
import SwiftUI

struct ActivityListView: View {
    @StateObject var model: ActivityListModel
    @StateObject var viewModel: ActivityListViewModel
    var body: some View {
        BitgouelNavigationTitleView(
            title: "학생활동", buttonItems: [ButtonItem(image: "add", text: "")]) {
                ScrollView {
                    VStack {
                        LazyVStack(spacing: 12) {
                            ForEach(model.content, id: \.activityId) { item in
                                StudentActivityRow(
                                    activityId: item.activityId,
                                    title: item.title,
                                    date: item.activityDate,
                                    userId: item.userId,
                                    name: item.userName,
                                    state: item.approveStatus,
                                    authority: model.authority
                                )
                            }
                        }
                        .padding(.top, 8)
                    }
                }
            }
            .padding(.top, 12)
            .onAppear {
                viewModel.onAppear()
            }
    }
}

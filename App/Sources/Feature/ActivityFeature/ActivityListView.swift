import Service
import SwiftUI

struct ActivityListView: View {
    @StateObject var model: ActivityListModel
    @StateObject var viewModel: ActivityListViewModel
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        BitgouelText(
                            text: "학생활동",
                            font: .title2
                        )

                        Spacer()

                        if model.authority == .student {
                            Button(action: {}, label: {
                                Image(systemName: "plus")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.bitgouel(.greyscale(.g8)))
                            })
                        }
                    }
                    .padding(.top, 32)
                    .padding(.horizontal, 8)

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
                .padding(.horizontal, 28)
            }
        }
        .onAppear {
            viewModel.onAppear()
        }
    }
}

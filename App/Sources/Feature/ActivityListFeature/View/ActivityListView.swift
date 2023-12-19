import Service
import SwiftUI

struct ActivityListView: View {
    @StateObject var model: ActivityListModel

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
                    }
                    .padding(.top, 32)

                    LazyVStack(spacing: 12) {
                        //                        ForEach(model.content, id: \.userId) { item in
                        //                            activityListRow(
                        //                                activityId: item.activityId,
                        //                                title: item.title,
                        //                                date: item.date,
                        //                                userId: item.userId,
                        //                                name: item.name,
                        //                                state: item.state
                        //                            )
                        //                        }

                        activityListRow()
                    }

                    Spacer()
                }
                .padding(.horizontal, 28)
            }
        }
    }

    @ViewBuilder
    func activityListRow(
        //        activityId: UUID,
        //        title: String,
        //        date: String,
        //        userId: UUID,
        //        name: String,
        //        state: ApproveStatusType
    ) -> some View {
        VStack(spacing: 24) {
            HStack {
                VStack(alignment: .leading) {
                    BitgouelText(
                        text: "타이틀",
                        font: .title3
                    )

                    BitgouelText(
                        text: "날짜",
                        font: .text3
                    )
                    .foregroundColor(.bitgouel(.greyscale(.g7)))

                    BitgouelText(
                        text: "업로더",
                        font: .text3
                    )
                    .foregroundColor(.bitgouel(.greyscale(.g7)))
                }
                .padding(.top, 16)
                .padding(.leading, 16)

                Spacer()
            }

            HStack {
                Spacer()

                Text("승인됨")
                    .bitgouelFont(.caption, color: .greyscale(.g10))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(
                        Color.bitgouel(.error(.e5))
                    )
                    .cornerRadius(18)

                Text("승인 대기 중")
                    .bitgouelFont(.caption, color: .greyscale(.g10))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(
                        Color.bitgouel(.primary(.p5))
                    )
                    .cornerRadius(18)
            }
            .padding(.trailing, 16)
            .padding(.bottom, 16)
        }
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.bitgouel(.greyscale(.g9)), lineWidth: 1)
        }
    }
}

#Preview {
    ActivityListView(model: ActivityListModel())
}

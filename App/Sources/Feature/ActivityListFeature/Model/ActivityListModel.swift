import Foundation
import Service

final class ActivityListModel: ObservableObject {
    var content: [SingleActivityEntity] {
        get { _content }
        set {
            _content = newValue
                .map {
                    SingleActivityEntity(
                        activityId: $0.activityId,
                        title: $0.title,
                        date: $0.date,
                        userId: $0.userId,
                        name: $0.name,
                        state: $0.state
                    )
                }
        }
    }

    @Published var _content: [SingleActivityEntity] = []
}

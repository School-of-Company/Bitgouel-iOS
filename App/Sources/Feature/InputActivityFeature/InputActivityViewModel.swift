import Foundation
import Service

final class InputActivityViewModel: BaseViewModel {
    @Published var title: String
    @Published var activityText: String
    
    init(title: String, activityText: String) {
        self.title = title
        self.activityText = activityText
    }
}

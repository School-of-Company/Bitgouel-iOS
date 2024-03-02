import Foundation

final class InputNoticeViewModel: BaseViewModel {
    @Published var noticeTitle: String = ""
    @Published var noticeContent: String = ""
    @Published var isPresentedNoticeSettingView: Bool = false
    var state: String = ""
    
    init(state: String) {
        self.state = state
    }
    
    func updateNoticeTitle(title: String) {
        noticeTitle = title
    }
    
    func updateNoticeContent(content: String) {
        noticeContent = content
    }
}

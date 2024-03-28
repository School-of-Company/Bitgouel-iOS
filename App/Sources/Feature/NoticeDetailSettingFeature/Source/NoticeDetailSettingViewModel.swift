import Foundation
import Service

final class NoticeDetailSettingViewModel: BaseViewModel {
    @Published var noticeLinks: [String] = []
    @Published var link: String = ""

    private var completion: ([String]) -> Void

    init(
        noticeLinks: [String],
        completion: @escaping ([String]) -> Void
    ) {
        self.noticeLinks = noticeLinks
        self.completion = completion
    }

    func applyButtonDidTap(link: [String]) {
        noticeLinks = link
        completion(noticeLinks)
    }
}

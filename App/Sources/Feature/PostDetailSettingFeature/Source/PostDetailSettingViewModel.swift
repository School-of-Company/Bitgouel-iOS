import Foundation

final class PostDetailSettingViewModel: BaseViewModel {
    @Published var inputLinks: [String] = [""]

    private var completion: ([String]) -> Void

    init(
        links: [String],
        completion: @escaping ([String]) -> Void
    ) {
        self.inputLinks = links
        self.completion = completion
    }

    func applyButtonDidTap(links: [String]) {
        inputLinks = links
        completion(inputLinks)
    }
}

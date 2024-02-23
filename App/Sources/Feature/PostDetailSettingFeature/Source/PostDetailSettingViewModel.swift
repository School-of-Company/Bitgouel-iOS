import Foundation

final class PostDetailSettingViewModel: BaseViewModel {
    @Published var inputLinks: [String] = [""]
    @Published var link: String = ""
    
    private var completion: ([String]) -> Void
    
    init(
        links: [String],
        completion: @escaping ([String]) -> Void
    ) {
        self.inputLinks = links
        self.completion = completion
    }
    
    func applyButtonDidTap(link: [String]) {
        inputLinks = link
        completion(inputLinks)
    }
}

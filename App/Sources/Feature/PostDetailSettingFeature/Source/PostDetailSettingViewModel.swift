import Foundation

final class PostDetailSettingViewModel: BaseViewModel {
    @Published var links: [String] = [""]
    @Published var link: String = ""
}

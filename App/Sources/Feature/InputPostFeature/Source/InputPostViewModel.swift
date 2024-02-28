import Foundation
import Service

final class InputPostViewModel: BaseViewModel {
    @Published var postTitle: String = ""
    @Published var postText: String = ""
    @Published var isPresentedPostDetailSettingAppend: Bool = false
    @Published var postRelatedLink: [String] = []

    private let writePostUseCase: any WritePostUseCase

    init(writePostUseCase: any WritePostUseCase) {
        self.writePostUseCase = writePostUseCase
    }

    func isPresentedDetailSetting(state: Bool) {
        self.isPresentedPostDetailSettingAppend = state
    }

    func addPost() {
        Task {
            do {
                try await writePostUseCase(
                    req: InputPostRequestDTO(
                        title: postTitle,
                        content: postText,
                        links: postRelatedLink,
                        feedType: .employment
                    )
                )
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

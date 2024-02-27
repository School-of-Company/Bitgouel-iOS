import Foundation
import Service

final class EditPostViewModel: BaseViewModel {
    @Published var modifiedTitle: String = ""
    @Published var modifiedContent: String = ""
    @Published var modifiedLinks: [String] = [""]
    @Published var postID: String = ""
    @Published var isPresentedPostDetailSettingAppend = false

    private let queryPostDetailUseCase: any QueryPostDetailUseCase
    private let updatePostUseCase: any UpdatePostUseCase

    init(
        postID: String,
        updatePostUseCase: any UpdatePostUseCase,
        queryPostDetailUseCase: any QueryPostDetailUseCase
    ) {
        self.postID = postID
        self.queryPostDetailUseCase = queryPostDetailUseCase
        self.updatePostUseCase = updatePostUseCase
    }

    func updateTitle(title: String) {
        modifiedTitle = title
    }

    func updateContent(content: String) {
        modifiedContent = content
    }

    func updateLinks(links: [String]) {
        modifiedLinks = links
    }

    func isPresentedDetailSetting(state: Bool) {
        isPresentedPostDetailSettingAppend = state
    }

    @MainActor
    func onAppear() {
        Task {
            do {
                let postDetail = try await queryPostDetailUseCase(postID: postID)
                updateTitle(title: postDetail.title)
                updateContent(content: postDetail.content)
                updateLinks(links: postDetail.links)
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    func updatePost() {
        Task {
            do {
                try await updatePostUseCase(
                    postID: postID,
                    req: UpdatePostRequestDTO(
                        title: modifiedTitle,
                        content: modifiedContent,
                        links: modifiedLinks
                    )
                )
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

import Foundation
import Service

final class InputPostViewModel: BaseViewModel {
    @Published var postTitle: String = ""
    @Published var postContent: String = ""
    @Published var postRelatedLink: [String] = []
    @Published var isPresentedPostDetailSettingAppend: Bool = false
    var state: String = ""
    var postID: String = ""

    private let writePostUseCase: any WritePostUseCase
    private let queryPostDetailUseCase: any QueryPostDetailUseCase
    private let updatePostUseCase: any UpdatePostUseCase

    init(
        state: String,
        postID: String,
        writePostUseCase: any WritePostUseCase,
        updatePostUseCase: any UpdatePostUseCase,
        queryPostDetailUseCase: any QueryPostDetailUseCase
    ) {
        self.state = state
        self.postID = postID
        self.writePostUseCase = writePostUseCase
        self.queryPostDetailUseCase = queryPostDetailUseCase
        self.updatePostUseCase = updatePostUseCase
    }

    func updatePostTitle(title: String) {
        postTitle = title
    }

    func updatePostContent(content: String) {
        postContent = content
    }

    func updateLinks(links: [String]) {
        postRelatedLink = links
    }

    func updateIsPresentedPostDetailSettingAppend(isPresented: Bool) {
        isPresentedPostDetailSettingAppend = isPresented
    }

    @MainActor
    func onAppear() {
        Task {
            do {
                let postDetail = try await queryPostDetailUseCase(postID: postID)
                updatePostTitle(title: postDetail.title)
                updatePostContent(content: postDetail.content)
                updateLinks(links: postDetail.links)
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    func applyButtonDidTap() {
        Task {
            do {
                switch state {
                case "추가":
                    return try await addPost()
                    
                case "수정":
                    return try await updatePost()
                    
                default:
                    return
                }
            } catch {
                print(String(describing: error))
            }
        }
    }

    func addPost() async throws {
        return try await writePostUseCase(
            req: InputPostRequestDTO(
                title: postTitle,
                content: postContent,
                links: postRelatedLink,
                feedType: .employment
            )
        )
    }

    func updatePost() async throws {
        return try await updatePostUseCase(
            postID: postID,
            req: UpdatePostRequestDTO(
                title: postTitle,
                content: postContent,
                links: postRelatedLink
            )
        )
    }
}

import Foundation
import Service

final class PostDetailViewModel: BaseViewModel {
    @Published var postDetail: PostDetailEntity?
    @Published var isPostDelete: Bool = false
    @Published var postID: String = ""
    @Published var isPresentedInputPostView: Bool = false

    private let queryPostDetailUseCase: any QueryPostDetailUseCase
    private let deletePostUseCase: any DeletePostUseCase

    init(
        postID: String,
        queryPostDetailUseCase: any QueryPostDetailUseCase,
        deletePostUseCase: any DeletePostUseCase
    ) {
        self.postID = postID
        self.queryPostDetailUseCase = queryPostDetailUseCase
        self.deletePostUseCase = deletePostUseCase
    }

    func updateIsPresentedInputPostView(isPresented: Bool) {
        isPresentedInputPostView = isPresented
    }

    @MainActor
    func onAppear() {
        Task {
            do {
                postDetail = try await queryPostDetailUseCase(postID: postID)
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    func postDelete() {
        Task {
            do {
                try await deletePostUseCase(postID: postID)
                print("게시글 삭제 완료")
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

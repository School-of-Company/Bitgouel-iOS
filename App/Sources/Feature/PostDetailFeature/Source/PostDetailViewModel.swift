import Foundation
import Service

final class PostDetailViewModel: BaseViewModel {
    @Published var postDetail: PostDetailEntity?
    @Published var isPostDelete: Bool = false
    @Published var postID: String = ""
    @Published var isPresentedInputPostView: Bool = false

    private let fetchPostDetailUseCase: any FetchPostDetailUseCase
    private let deletePostUseCase: any DeletePostUseCase

    init(
        postID: String,
        fetchPostDetailUseCase: any FetchPostDetailUseCase,
        deletePostUseCase: any DeletePostUseCase
    ) {
        self.postID = postID
        self.fetchPostDetailUseCase = fetchPostDetailUseCase
        self.deletePostUseCase = deletePostUseCase
    }

    func updateIsPresentedInputPostView(isPresented: Bool) {
        isPresentedInputPostView = isPresented
    }

    @MainActor
    func onAppear() {
        isLoading = true

        Task {
            do {
                postDetail = try await fetchPostDetailUseCase(postID: postID)

                isLoading = false
            } catch {
                errorMessage = error.postDomainErrorMessage()
                isErrorOccurred = true
            }
        }
    }

    @MainActor
    func postDelete(_ success: @escaping () -> Void) {
        Task {
            do {
                try await deletePostUseCase(postID: postID)

                success()
            } catch {
                errorMessage = error.postDomainErrorMessage()
                isErrorOccurred = true
            }
        }
    }
}

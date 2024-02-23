import Foundation
import Service

final class PostDetailViewModel: BaseViewModel {
    @Published var postDetail: PostDetailEntity?
    @Published var isPostDelete: Bool = false
    @Published var postID: String = ""
    @Published var isPresentedEditView: Bool = false

    private let queryPostDetailUseCase: any QueryPostDetailUseCase

    init(
        postID: String,
        queryPostDetailUseCase: any QueryPostDetailUseCase
    ) {
        self.postID = postID
        self.queryPostDetailUseCase = queryPostDetailUseCase
    }
    
    func editAction() {
        isPresentedEditView = true
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
}

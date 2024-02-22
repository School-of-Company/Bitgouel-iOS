import Foundation
import Service

final class PostListViewModel: BaseViewModel {
    @Published var postList: [PostEntity] = []
    @Published var authority: UserAuthorityType = .user
    @Published var isPresentedAleterBottomSheet: Bool = false
    @Published var isPresentedNoticeListView: Bool = false
    @Published var isPresentedInquiryView: Bool = false
    @Published var isPresentedInputPostView: Bool = false
    
    private let loadUserAuthorityUseCase: any LoadUserAuthorityUseCase
    private let queryPostListUseCase: any QueryPostListUseCase
    
    init(
        loadUserAuthorityUseCase: any LoadUserAuthorityUseCase,
        queryPostListUseCase: any QueryPostListUseCase
    ) {
        self.loadUserAuthorityUseCase = loadUserAuthorityUseCase
        self.queryPostListUseCase = queryPostListUseCase
    }
    
    func onAppear() {
        authority = loadUserAuthorityUseCase()
        
        Task {
            do {
                postList = try await queryPostListUseCase(postType: .employment)
                print(postList)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

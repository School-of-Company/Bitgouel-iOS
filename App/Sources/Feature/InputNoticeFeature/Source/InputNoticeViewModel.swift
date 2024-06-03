import Foundation
import Service

final class InputNoticeViewModel: BaseViewModel {
    @Published var noticeTitle: String = ""
    @Published var noticeContent: String = ""
    @Published var noticeLinks: [String] = []
    @Published var isPresentedNoticeDetailSettingAppend: Bool = false
    var state: String = ""
    var noticeID: String = ""

    private let queryPostDetailUseCase: any QueryPostDetailUseCase
    private let writePostUseCase: any WritePostUseCase
    private let updatePostUseCase: any UpdatePostUseCase

    init(
        state: String,
        noticeID: String,
        queryPostDetailUseCase: any QueryPostDetailUseCase,
        writePostUseCase: any WritePostUseCase,
        updatePostUseCase: any UpdatePostUseCase
    ) {
        self.state = state
        self.noticeID = noticeID
        self.queryPostDetailUseCase = queryPostDetailUseCase
        self.writePostUseCase = writePostUseCase
        self.updatePostUseCase = updatePostUseCase
    }

    func updateNoticeTitle(title: String) {
        noticeTitle = title
    }

    func updateNoticeContent(content: String) {
        noticeContent = content
    }

    func updateNoticeLinks(links: [String]) {
        noticeLinks = links
    }

    func updateNoticeDetail(noticeDetail: PostDetailEntity) {
        noticeTitle = noticeDetail.title
        noticeContent = noticeDetail.content
        noticeLinks = noticeDetail.links
    }

    func updateIsPresentedNoticeSettingAppend(isPresented: Bool) {
        isPresentedNoticeDetailSettingAppend = isPresented
    }

    @MainActor
    func onAppear() {
        isLoading = true

        Task {
            do {
                let noticeDetail = try await queryPostDetailUseCase(postID: noticeID)

                updateNoticeDetail(noticeDetail: noticeDetail)
                isLoading = false
            } catch {
                errorMessage = error.postDomainErrorMessage()
                isErrorOccurred = true
            }
        }
    }

    @MainActor
    func applyButtonDidTap(_ success: @escaping () -> Void) {
        Task {
            do {
                switch state {
                case "추가":
                    try await addNotice()
                case "수정":
                    try await updateNotice()
                default:
                    return
                }

                success()
            } catch {
                errorMessage = error.postDomainErrorMessage()
                isErrorOccurred = true
            }
        }
    }

    func addNotice() async throws {
        try await writePostUseCase(
            req: InputPostRequestDTO(
                title: noticeTitle,
                content: noticeContent,
                links: noticeLinks,
                feedType: .notice
            )
        )
    }

    func updateNotice() async throws {
        try await updatePostUseCase(
            postID: noticeID,
            req: UpdatePostRequestDTO(
                title: noticeTitle,
                content: noticeContent,
                links: noticeLinks
            )
        )
    }
}

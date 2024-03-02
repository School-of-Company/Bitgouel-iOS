import Foundation
import Service

final class InputNoticeViewModel: BaseViewModel {
    @Published var noticeTitle: String = ""
    @Published var noticeContent: String = ""
    @Published var noticeLinks: [String] = []
    @Published var isPresentedNoticeSettingView: Bool = false
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

    func updateIsPresentedNoticeSettingView(isPresented: Bool) {
        isPresentedNoticeSettingView = isPresented
    }

    @MainActor
    func onAppear() {
        Task {
            do {
                let noticeDetail = try await queryPostDetailUseCase(postID: noticeID)
                updateNoticeTitle(title: noticeDetail.title)
                updateNoticeContent(content: noticeDetail.content)
                updateNoticeLinks(links: noticeDetail.links)
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
                    return try await addNotice()
                case "수정":
                    return try await updateNotice()
                default:
                    return
                }
            } catch {
                print(String(describing: error))
            }
        }
    }

    func addNotice() async throws {
        return try await writePostUseCase(
            req: InputPostRequestDTO(
                title: noticeTitle,
                content: noticeContent,
                links: noticeLinks,
                feedType: .notice
            )
        )
    }

    func updateNotice() async throws {
        return try await updatePostUseCase(
            postID: noticeID,
            req: UpdatePostRequestDTO(
                title: noticeTitle,
                content: noticeContent,
                links: noticeLinks
            )
        )
    }
}

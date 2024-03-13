import Foundation
import Service
import SwiftUI

@MainActor
final class ActivityDetailViewModel: BaseViewModel {
    @Published var authority: UserAuthorityType = .user
    @Published var isDelete: Bool = false
    @Published var isEdit: Bool = false
    @Published var activityDetail: ActivityDetailEntity?

    private var activityID: String
    private let loadUserAuthorityUseCase: any LoadUserAuthorityUseCase
    private let fetchActivityDetailsUseCase: any FetchActivityDetailsUseCase
    private let deleteActivityUseCase: any DeleteActivityUseCase

    init(
        activityID: String,
        loadUserAuthorityUseCase: any LoadUserAuthorityUseCase,
        fetchActivityDetailsUseCase: any FetchActivityDetailsUseCase,
        deleteActivityUseCase: any DeleteActivityUseCase
    ) {
        self.activityID = activityID
        self.loadUserAuthorityUseCase = loadUserAuthorityUseCase
        self.fetchActivityDetailsUseCase = fetchActivityDetailsUseCase
        self.deleteActivityUseCase = deleteActivityUseCase
    }

    func onAppear() {
        authority = loadUserAuthorityUseCase()

        Task {
            do {
                activityDetail = try await fetchActivityDetailsUseCase(activityID: activityID)
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    func deleteActivity() {
        Task {
            do {
                try await deleteActivityUseCase(activityID: activityID)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

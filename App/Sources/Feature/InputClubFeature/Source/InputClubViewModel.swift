import Foundation
import Service

final class InputClubViewModel: BaseViewModel {
    @Published var clubName: String = ""
    @Published var selectedField: FieldType?
    @Published var isShowingDeleteAlert: Bool = false
    let schoolID: Int
    let state: String
    let clubInfo: ClubDetailModel

    private let createdClubUseCase: any CreatedClubUseCase
    private let deleteClubUseCase: any DeleteClubUseCase
    private let modifyClubUseCase: any ModifyClubUseCase

    init(
        schoolID: Int,
        state: String,
        clubInfo: ClubDetailModel,
        createdClubUseCase: any CreatedClubUseCase,
        deleteClubUseCase: any DeleteClubUseCase,
        modifyClubUseCase: any ModifyClubUseCase
    ) {
        self.schoolID = schoolID
        self.state = state
        self.clubInfo = clubInfo
        self.createdClubUseCase = createdClubUseCase
        self.deleteClubUseCase = deleteClubUseCase
        self.modifyClubUseCase = modifyClubUseCase
    }

    func updateIsShowingDeleteAlert(isShowing: Bool) {
        isShowingDeleteAlert = isShowing
    }

    func onAppear() {
        clubName = clubInfo.name
        selectedField = clubInfo.field
    }

    @MainActor
    func createdClub(_ success: @escaping () -> Void) {
        guard let field = selectedField else { return }

        Task {
            do {
                try await createdClubUseCase(
                    schoolID: schoolID,
                    req: CreatedClubRequestDTO(
                        name: clubName,
                        field: field
                    )
                )

                success()
                
            } catch {
                errorMessage = error.clubDomainErrorMessage()
                isErrorOccurred = true
            }
        }
    }

    @MainActor
    func deleteClub(_ success: @escaping () -> Void) {
        Task {
            do {
                try await deleteClubUseCase(clubID: clubInfo.clubID)

                success()
            } catch {
                errorMessage = error.clubDomainErrorMessage()
                isErrorOccurred = true
            }
        }
    }
}

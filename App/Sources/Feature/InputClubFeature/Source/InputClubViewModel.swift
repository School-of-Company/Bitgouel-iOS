import Foundation
import Service

final class InputClubViewModel: BaseViewModel {
    @Published var clubName: String = ""
    @Published var selectedField: FieldType?
    let schoolID: Int
    let state: String
    let clubInfo: ClubDetailModel

    private let createdClubUseCase: any CreatedClubUseCase

    init(
        schoolID: Int,
        state: String,
        clubInfo: ClubDetailModel,
        createdClubUseCase: any CreatedClubUseCase
    ) {
        self.schoolID = schoolID
        self.state = state
        self.clubInfo = clubInfo
        self.createdClubUseCase = createdClubUseCase
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
}

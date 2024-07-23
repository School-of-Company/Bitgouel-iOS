import Foundation
import Service

final class InputCompanyViewModel: BaseViewModel {
    @Published var selectedFieldType: FieldType?
    @Published var companyName: String = ""

    private let createdCompanyUseCase: any CreatedCompanyUseCase

    init(createdCompanyUseCase: any CreatedCompanyUseCase) {
        self.createdCompanyUseCase = createdCompanyUseCase
    }

    @MainActor
    func createCompany(_ success: @escaping () -> Void) {
        guard let field = selectedFieldType else { return }

        Task {
            do {
                try await createdCompanyUseCase(
                    req: CreatedCompanyRequestDTO(
                        companyName: companyName,
                        field: field
                    )
                )

                success()
            } catch {
                errorMessage = error.companyDomainErrorMessage()
                isErrorOccurred = true
            }
        }
    }
}

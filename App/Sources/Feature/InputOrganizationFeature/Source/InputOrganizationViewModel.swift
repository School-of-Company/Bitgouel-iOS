import Foundation
import Service

final class InputOrganizationViewModel: BaseViewModel {
    @Published var selectedFieldType: FieldType?
    @Published var organizationName: String = ""
    let organization: OrganizationType

    private let createdCompanyUseCase: any CreatedCompanyUseCase
    private let createdGovernmentUseCase: any CreatedGovernmentUseCase

    init(
        organization: OrganizationType,
        createdCompanyUseCase: any CreatedCompanyUseCase,
        createdGovernmentUseCase: any CreatedGovernmentUseCase
    ) {
        self.organization = organization
        self.createdCompanyUseCase = createdCompanyUseCase
        self.createdGovernmentUseCase = createdGovernmentUseCase
    }

    @MainActor
    func createOrganization(_ success: @escaping () -> Void) {
        guard let field = selectedFieldType else { return }

        Task {
            do {
                switch organization {
                case .company:
                    try await createCompany(field: field)

                case .government:
                    try await createGovernment(field: field)
                }

                success()
            } catch {
                errorMessage = error.companyDomainErrorMessage()
                isErrorOccurred = true
            }
        }
    }

    func createCompany(field: FieldType) async throws {
        try await createdCompanyUseCase(
            req: CreatedCompanyRequestDTO(
                companyName: organizationName,
                field: field
            )
        )
    }

    func createGovernment(field: FieldType) async throws {
        try await createdGovernmentUseCase(
            req: CreatedGovernmentRequestDTO(
                field: field,
                governmentName: organizationName
            )
        )
    }
}

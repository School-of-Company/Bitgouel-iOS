import Foundation
import Service

final class InputUniversityViewModel: BaseViewModel {
    @Published var universityName: String
    @Published var departmentList: [String]
    @Published var isShowingDeleteAlert: Bool = false
    @Published var isPresentedInputDepartment: Bool = false
    let state: String
    let universityID: Int

    private let createdUniversityUseCase: any CreatedUniversityUseCase
    private let modifyUniversityUseCase: any ModifyUniversityUseCase
    private let deleteUniversityUseCase: any DeleteUniversityUseCase
    private let createdDepartmentUseCase: any CreatedDepartmentUseCase
    private let deleteDepartmentUseCase: any DeleteDepartmentUseCase

    init(
        state: String,
        universityName: String,
        departmentList: [String],
        universityID: Int,
        createdUniversityUseCase: any CreatedUniversityUseCase,
        modifyUniversityUseCase: any ModifyUniversityUseCase,
        deleteUniversityUseCase: any DeleteUniversityUseCase,
        createdDepartmentUseCase: any CreatedDepartmentUseCase,
        deleteDepartmentUseCase: any DeleteDepartmentUseCase
    ) {
        self.state = state
        self.universityName = universityName
        self.departmentList = departmentList
        self.universityID = universityID
        self.createdUniversityUseCase = createdUniversityUseCase
        self.modifyUniversityUseCase = modifyUniversityUseCase
        self.deleteUniversityUseCase = deleteUniversityUseCase
        self.createdDepartmentUseCase = createdDepartmentUseCase
        self.deleteDepartmentUseCase = deleteDepartmentUseCase
    }

    func updateIsShowingDeleteAlert(isShowing: Bool) {
        isShowingDeleteAlert = isShowing
    }

    func updateIsPresentedInputDepartment(isPresented: Bool) {
        isPresentedInputDepartment = isPresented
    }

    @MainActor
    func modifyUniversity(_ success: @escaping () -> Void) {
        Task {
            do {
                try await modifyUniversityUseCase(
                    universityID: universityID,
                    req: UniversityNameRequestDTO(universityName: universityName)
                )

                success()
            } catch {
                errorMessage = error.universityDomainErrorMessage()
                isErrorOccurred = true
            }
        }
    }

    @MainActor
    func createdUniversity(_ success: @escaping () -> Void) {
        Task {
            do {
                try await createdUniversityUseCase(req: UniversityNameRequestDTO(universityName: universityName))

                success()
            } catch {
                errorMessage = error.universityDomainErrorMessage()
                isErrorOccurred = true
            }
        }
    }

    @MainActor
    func deleteUniversity(_ success: @escaping () -> Void) {
        Task {
            do {
                try await deleteUniversityUseCase(universityID: universityID)

                success()
            } catch {
                errorMessage = error.universityDomainErrorMessage()
                isErrorOccurred = true
            }
        }
    }

    @MainActor
    func deleteDepartment(index: Int) {
        guard let department = departmentList[safe: index] else { return }

        Task {
            do {
                try await deleteDepartmentUseCase(universityID: universityID, department: department)

                departmentList.remove(at: index)
            } catch {
                errorMessage = error.universityDomainErrorMessage()
                isErrorOccurred = true
            }
        }
    }

    @MainActor
    func createdDepartment(department: String) {
        Task {
            do {
                try await createdDepartmentUseCase(
                    universityID: universityID,
                    req: DepartmentRequestDTO(department: department)
                )

                departmentList.append(department)
            } catch {
                errorMessage = error.universityDomainErrorMessage()
                isErrorOccurred = true
            }
        }
    }
}

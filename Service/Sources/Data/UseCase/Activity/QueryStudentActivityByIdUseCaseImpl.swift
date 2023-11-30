import Foundation

struct QueryStudentActivityByIdUseCaseImpl: QueryStudentActivityByIdUseCase {
    private let activityRepository: any ActivityRepository
    
    init(activityRepository: any ActivityRepository) {
        self.activityRepository = activityRepository
    }
    
    func callAsFunction(studentID: String) async throws {
        try await activityRepository.queryStudentActivityById(studentID: studentID)
    }
}

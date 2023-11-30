import Foundation

struct UpdateStudentActivityUseCaseImpl: UpdateStudentActibityUseCase {
    private let activityRepository: any ActivityRepository
    
    init(activityRepository: any ActivityRepository) {
        self.activityRepository = activityRepository
    }
    
    func callAsFunction(userID: String) async throws {
        try await activityRepository.updateStudentActibity(userID: userID)
    }
}

import Service
import SwiftUI

final class ClubDetailViewModel: BaseViewModel {
    @Published var authority: UserAuthorityType = .user
    
    //MARK: ClubInfo
    private let clubId: String
    @Published var clubName: String = ""
    @Published var highSchoolName: String = ""
    @Published var headcount: Int?
    @Published var students: [ClubDetailEntity.memberInfoEntity] = []
    @Published var teacher: ClubDetailEntity.memberInfoEntity?
    
    //MARK: UseCase
    private let loadAuthorityUseCase: any LoadUserAuthorityUseCase
    private let queryClubDetailUseCase: any QueryClubDetailUseCase
    private let queryStudentListByClubUseCase: any QueryStudentListByClubUseCase
    
    init(
        clubId: String,
        loadAuthorityUseCase: any LoadUserAuthorityUseCase,
        queryClubDetailUseCase: any QueryClubDetailUseCase,
        queryStudentListByClubUseCase: any QueryStudentListByClubUseCase
    ) {
        self.clubId = clubId
        self.loadAuthorityUseCase = loadAuthorityUseCase
        self.queryClubDetailUseCase = queryClubDetailUseCase
        self.queryStudentListByClubUseCase = queryStudentListByClubUseCase
    }
    
    func onAppear() {
        self.authority = loadAuthorityUseCase()
        
        Task {
            do {
                let clubDetail: ClubDetailEntity = try await { () async throws -> ClubDetailEntity in
                    switch authority {
                    case .admin: return try await onAppearClubDetailByAdmin(clubId: clubId)
                    default: return try await onAppearClubDetail()
                    }
                }()
            } catch {
                
            }
        }
        
        @Sendable 
        func onAppearClubDetailByAdmin(clubId: String) async throws -> ClubDetailEntity {
            return try await queryClubDetailUseCase(clubId: clubId)
        }
        
        @Sendable 
        func onAppearClubDetail() async throws -> ClubDetailEntity {
            return try await queryStudentListByClubUseCase()
        }
    }
    
    func updateClubDetail(clubInfo: ClubDetailEntity) {
        self.clubName = clubInfo.clubName
        self.highSchoolName = clubInfo.highSchoolName
        self.headcount = clubInfo.headcount
        self.students = clubInfo.students
        self.teacher = clubInfo.teacher
    }
}

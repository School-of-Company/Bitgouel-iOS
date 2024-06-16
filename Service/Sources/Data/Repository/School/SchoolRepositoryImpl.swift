import Foundation

public struct SchoolRepositoryImpl: SchoolRepository {
    private let remoteSchoolDataSource: any RemoteSchoolDataSource

    public init(remoteSchoolDataSource: any RemoteSchoolDataSource) {
        self.remoteSchoolDataSource = remoteSchoolDataSource
    }

    public func fetchSchoolList() async throws -> [SchoolListEntity] {
        try await remoteSchoolDataSource.fetchSchoolList()
    }
}

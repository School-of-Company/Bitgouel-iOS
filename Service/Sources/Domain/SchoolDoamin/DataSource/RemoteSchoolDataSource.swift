import Foundation

public protocol RemoteSchoolDataSource: BaseRemoteDataSource<SchoolAPI> {
    func fetchSchoolList() async throws -> [SchoolListEntity]
}

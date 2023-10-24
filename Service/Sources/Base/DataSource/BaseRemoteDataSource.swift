import Foundation
import Moya

open class BaseRemoteDataSource<API: BitgoeulAPI> {
    private let provider: MoyaProvider<API>
    private let decoder = JSONDecoder()

    public init(
        provider: MoyaProvider<API>? = nil
    ) {
        self.provider = provider ?? MoyaProvider()
    }
}

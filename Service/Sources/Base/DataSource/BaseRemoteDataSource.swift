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

    public func request<T: Decodable>(_ api: API, dto: T.Type) -> Anypu<T, Error> {
        requestPublisher
    }
}

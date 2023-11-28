import UIKit

open class BaseViewModel: ObservableObject {
    @Published public var isErrorOccurred = false
    @Published public var isLoading = false
    @Published public var errorMessage = ""

    public init() {}

    public func addCancellable<T>(
        _ task: @escaping @Sendable () async throws -> T,
        onReceiveValue: @escaping (T) -> Void,
        onReceiveError: ((Error) -> Void)? = nil
    ) {
        isLoading = true
        Task {
            do {
                let value = try await task()
                onReceiveValue(value)
            } catch {
                if let onReceiveError {
                    onReceiveError(error)
                }

                errorMessage = error.localizedDescription
                isErrorOccurred = true
            }
            isLoading = false
        }
    }
}

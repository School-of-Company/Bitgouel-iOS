import Foundation

final class InputCertificationViewModel: BaseViewModel {
    @Published var certificationName: String = ""
    @Published var acquisitionDate: Date

    private let completion: (String, Date) -> Void

    init(
        certificationName: String,
        acquisitionDate: Date,
        completion: @escaping (String, Date) -> Void
    ) {
        self.certificationName = certificationName
        self.acquisitionDate = acquisitionDate
        self.completion = completion
    }

    func updateDate(date: Date) {
        acquisitionDate = date
    }

    func applyButtonDidTap() {
        completion(certificationName, acquisitionDate)
    }
}

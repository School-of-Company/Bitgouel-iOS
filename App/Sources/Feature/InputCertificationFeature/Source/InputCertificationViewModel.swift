import Foundation

final class InputCertificationViewModel: BaseViewModel {
    @Published var certificationName: String = ""
    @Published var acquisitionDate = Date()

    func updateDate(date: Date) {
        acquisitionDate = date
    }
}

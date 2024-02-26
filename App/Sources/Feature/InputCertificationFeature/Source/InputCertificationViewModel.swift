import Foundation
import Service

final class InputCertificationViewModel: BaseViewModel {
    @Published var certificationName: String = ""
    @Published var acquisitionDate = Date()
    
    private let inputCertificationUseCase: any InputCertificationUseCase
    
    init(inputCertificationUseCase: any InputCertificationUseCase) {
        self.inputCertificationUseCase = inputCertificationUseCase
    }

    func updateDate(date: Date) {
        acquisitionDate = date
    }

    func applyButtonDidTap() {
        Task {
            do {
                try await inputCertificationUseCase(
                    req: InputCertificationRequestDTO(
                        name: certificationName,
                        acquisitionDate: acquisitionDate.toStringCustomFormat(format: "yyyy-MM-dd")
                    )
                )
            }
        }
    }
}

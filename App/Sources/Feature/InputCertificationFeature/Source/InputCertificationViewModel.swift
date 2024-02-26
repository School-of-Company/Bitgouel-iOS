import Foundation
import Service

final class InputCertificationViewModel: BaseViewModel {
    @Published var certificationName: String = ""
    @Published var acquisitionDate = Date()
    var epic: String = ""

    private let inputCertificationUseCase: any InputCertificationUseCase
    
    init(
        inputCertificationUseCase: any InputCertificationUseCase,
        epic: String
    ) {
        self.inputCertificationUseCase = inputCertificationUseCase
        self.epic = epic
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

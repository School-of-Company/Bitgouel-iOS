import Foundation
import Service

final class InputCertificationViewModel: BaseViewModel {
    @Published var certificationName: String = ""
    @Published var acquisitionDate: Date
    var epic: String = ""
    var certificationID: String = ""

    private let inputCertificationUseCase: any InputCertificationUseCase
    private let updateCertificationUseCase: any UpdateCertificationUseCase
    
    init(
        inputCertificationUseCase: any InputCertificationUseCase,
        updateCertificationUseCase: any UpdateCertificationUseCase,
        epic: String,
        certificationID: String,
        certificationName: String,
        acquisitionDate: Date
    ) {
        self.inputCertificationUseCase = inputCertificationUseCase
        self.updateCertificationUseCase = updateCertificationUseCase
        self.epic = epic
        self.certificationID = certificationID
        self.certificationName = certificationName
        self.acquisitionDate = acquisitionDate
    }

    func updateDate(date: Date) {
        acquisitionDate = date
    }

    func applyButtonDidTap() {
        Task {
            do {
                switch epic {
                case "등록":
                    return try await inputCertification()
                    
                case "수정":
                    return try await updateCertification()
                    
                default:
                    return
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func inputCertification() async throws {
        try await inputCertificationUseCase(
            req: InputCertificationRequestDTO(
                name: certificationName,
                acquisitionDate: acquisitionDate.toStringCustomFormat(format: "yyyy-MM-dd")
            ))
    }
    
    func updateCertification() async throws {
        try await updateCertificationUseCase(
            certificationID: certificationID,
            req: InputCertificationRequestDTO(
                name: certificationName,
                acquisitionDate: acquisitionDate.toStringCustomFormat(format: "yyyy-MM-dd")
            )
        )
    }
}

import Foundation
import Service

final class InputCompanyViewModel: BaseViewModel {
    @Published var selectedFieldType: FieldType?
    @Published var companyName: String = ""
}

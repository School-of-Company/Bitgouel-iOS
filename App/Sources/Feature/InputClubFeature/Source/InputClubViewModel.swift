import Foundation
import Service

final class InputClubViewModel: BaseViewModel {
    @Published var clubName: String = ""
    @Published var selectedField: FieldType?
    let schoolID: Int
    let state: String
    let clubInfo: ClubDetailModel

    init(
        schoolID: Int,
        state: String,
        clubInfo: ClubDetailModel
    ) {
        self.schoolID = schoolID
        self.state = state
        self.clubInfo = clubInfo
    }

    func onAppear() {
        clubName = clubInfo.name
        selectedField = clubInfo.field
    }
}

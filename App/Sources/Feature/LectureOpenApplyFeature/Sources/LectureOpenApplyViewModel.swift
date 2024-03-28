import Foundation
import SwiftUI
import Service

final class LectureOpenApplyViewModel: ObservableObject {
    @Published var lectureTitle: String = ""
    @Published var lectureText: String = ""
    @Published var isPresentedLectureDetailSettingAppend = false
    
    public let lectureOpenUseCase: any LectureOpenUseCase
    
    init(
        lectureOpenUseCase: any LectureOpenUseCase
    ) {
        self.lectureOpenUseCase = lectureOpenUseCase
    }
    
    func updateIsPresentedLectureDetailSettingAppend(state: Bool) {
        isPresentedLectureDetailSettingAppend = state
    }
}

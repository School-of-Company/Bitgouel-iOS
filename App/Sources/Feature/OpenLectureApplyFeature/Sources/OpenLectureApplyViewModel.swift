import Foundation
import SwiftUI
import Service

final class OpenLectureApplyViewModel: ObservableObject {
    @Published var lectureTitle: String = ""
    @Published var lectureText: String = ""
    @Published var isPresentedLectureDetailSettingAppend = false
    
    public let openLectureUseCase: any OpenLectureUseCase
    
    init(
        openLectureUseCase: any OpenLectureUseCase
    ) {
        self.openLectureUseCase = openLectureUseCase
    }
    
    func updateIsPresentedLectureDetailSettingAppend(state: Bool) {
        isPresentedLectureDetailSettingAppend = state
    }
    
    func updateLectureTitle(title: String) {
        lectureTitle = title
    }
    
    func updateLectureText(text: String) {
        lectureText = text
    }
}

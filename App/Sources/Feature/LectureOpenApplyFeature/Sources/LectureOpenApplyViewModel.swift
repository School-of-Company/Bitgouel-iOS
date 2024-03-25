import Foundation
import SwiftUI
import Service

final class LectureOpenApplyViewModel: ObservableObject {
    @Published var lectureTitle: String = ""
    @Published var lectureText: String = ""
    @Published var isPresentedLectureDetailSettingAppend = false
    
    func updateIsPresentedLectureDetailSettingAppend(state: Bool) {
        isPresentedLectureDetailSettingAppend = state
    }
}

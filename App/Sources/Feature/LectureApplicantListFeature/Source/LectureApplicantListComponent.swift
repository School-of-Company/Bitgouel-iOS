import NeedleFoundation
import Service
import SwiftUI

public protocol LectureApplicantListDependency: Dependency {}

public final class LectureApplicantListComponent: Component<LectureApplicantListDependency>,
    LectureApplicantListFactory {
    public func makeView(lectureID: String) -> some View {
        LectureApplicantListView()
    }
}

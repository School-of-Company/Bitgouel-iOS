import NeedleFoundation
import SwiftUI

public protocol MainTabDependency: Dependency {
    var mainFactory: any MainFactory { get }
    var lectureListFactory: any LectureListFactory { get }
    var postListFactory: any PostListFactory { get }
    var clubListFactory: any ClubListFactory { get }
    var myPageFactory: any MyPageFactory { get }
}

public final class MainTabComponent: Component<MainTabDependency>, MainTabFactory {
    public func makeView() -> some View {
        MainTabView(
            mainFactory: dependency.mainFactory,
            lectureListFactory: dependency.lectureListFactory,
            postListFactory: dependency.postListFactory,
            clubListFactory: dependency.clubListFactory,
            myPageFactory: dependency.myPageFactory
        )
    }
}

import NeedleFoundation
import Service
import SwiftUI

public final class AppComponent: BootstrapComponent {
    public func makeRootView() -> some View {
        rootComponent.makeView()
    }

    var rootComponent: RootComponent {
        RootComponent(parent: self)
    }

    public var keychain: Keychain {
        shared {
            KeychainImpl()
        }
    }
}

public extension AppComponent {
    var loginFactory: any LoginFactory {
        LoginComponent(parent: self)
    }

    var activityListFactory: any ActivityListFactory {
        ActivityListComponent(parent: self)
    }

    var signupFactory: any StudentSignUpFactory {
        StudentSignUpComponent(parent: self)
    }

    var inputActivityFactory: any InputActivityFactory {
        InputActivityComponent(parent: self)
    }

    var activityDetailFactory: any ActivityDetailFactory {
        ActivityDetailComponent(parent: self)
    }

    var activityDetailSettingFactory: any ActivityDetailSettingFactory {
        ActivityDetailSettingComponent(parent: self)
    }

    var clubDetailFactory: any ClubDetailFactory {
        ClubDetailComponent(parent: self)
    }

    var clubListFactory: any ClubListFactory {
        ClubListComponent(parent: self)
    }

    var lectureListFactory: any LectureListFactory {
        LectureListComponent(parent: self)
    }

    var lectureListDetailFactory: any LectureListDetailFactory {
        LectureListDetailComponent(parent: self)
    }

    var postListFactory: any PostListFactory {
        PostListComponent(parent: self)
    }

    var postDetailSettingFactory: any PostDetailSettingFactory {
        PostDetailSettingComponent(parent: self)
    }

    var inputPostFactory: any InputPostFactory {
        InputPostComponent(parent: self)
    }

    var postDetailFactory: any PostDetailFactory {
        PostDetailComponent(parent: self)
    }

    var noticeListFactory: any NoticeListFactory {
        NoticeListComponent(parent: self)
    }

    var inquiryListFactory: any InquiryListFactory {
        InquiryListComponent(parent: self)
    }
}

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

    var activityDetailSettingFactory: any ActivityDetailSettingFactory {
        ActivityDetailSettingComponent(parent: self)
    }
    
    var clubDetailFactory: any ClubDetailFactory {
        ClubDetailComponent(parent: self)
    }
}

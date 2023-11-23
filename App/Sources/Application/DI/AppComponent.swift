import NeedleFoundation
import SwiftUI
import Service

public final class AppComponent: BootstrapComponent {
    public func makeRootView() -> some View {
        rootComponent.makeView()
    }
    
    public var keychain: Keychain {
        shared {
            KeychainImpl()
        }
    }
    
    var rootComponent: RootComponent {
        shared{
            RootComponent(parent: self)
        }
    }
}

public extension AppComponent {
    var loginFactory: any LoginFactory {
        shared {
            LoginComponent(parent: self)
        }
    }
}

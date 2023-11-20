//import Foundation
//import Service
//import SwiftUI
//
//public final class LoginFactory {
//    let dependency: LoginDependency
//    
//    init(dependency: LoginDependency) {
//        self.dependency = dependency
//    }
//    
//    func makeView() -> some View {
//        let viewModel = LoginViewModel(loginUseCase: dependency.authDomainBuildable.loginUseCase)
//        return LoginView(viewModel: viewModel)
//    }
//}

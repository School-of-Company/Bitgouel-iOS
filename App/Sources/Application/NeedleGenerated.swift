

import NeedleFoundation
import Service
import SwiftUI

// swiftlint:disable unused_declaration
private let needleDependenciesHash : String? = nil

// MARK: - Traversal Helpers

private func parent1(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
    return component.parent
}

// MARK: - Providers

#if !NEEDLE_DYNAMIC

private class ActivityDetailSettingDependency0b98c5f90168b920a8b8Provider: ActivityDetailSettingDependency {
    init() {}
}

/// ^->AppComponent->ActivityDetailSettingComponent
private func factoryfd595280dea209e217b9e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return ActivityDetailSettingDependency0b98c5f90168b920a8b8Provider()
}

private class StudentSignUpDependency32f0961d5bf3e2a5f205Provider: StudentSignUpDependency {
    var studentSignupUseCase: any StudentSignupUseCase {
        return appComponent.studentSignupUseCase
    }

    var teacherSignupUseCase: any TeacherSignupUseCase {
        return appComponent.teacherSignupUseCase
    }

    var bbozzakSignupUseCase: any BbozzakSignupUseCase {
        return appComponent.bbozzakSignupUseCase
    }

    var professorSignupUseCase: any ProfessorSignupUseCase {
        return appComponent.professorSignupUseCase
    }

    var governmentSignupUseCase: any GovernmentSignupUseCase {
        return appComponent.governmentSignupUseCase
    }

    var companyInstructorSignupUseCase: any CompanyInstructorSignupUseCase {
        return appComponent.companyInstructorSignupUseCase
    }

    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}

/// ^->AppComponent->StudentSignUpComponent
private func factoryc57b1cf1651b3051e040f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return StudentSignUpDependency32f0961d5bf3e2a5f205Provider(appComponent: parent1(component) as! AppComponent)
}

private class RootDependency3944cc797a4a88956fb5Provider: RootDependency {
    var loginFactory: any LoginFactory {
        return appComponent.loginFactory
    }

    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}

/// ^->AppComponent->RootComponent
private func factory264bfc4d4cb6b0629b40f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return RootDependency3944cc797a4a88956fb5Provider(appComponent: parent1(component) as! AppComponent)
}

private class ActivityListDependencyb8e659960978b8384f80Provider: ActivityListDependency {
    var inputActivityFactory: any InputActivityFactory {
        return appComponent.inputActivityFactory
    }

    var loadUserAuthorityUseCase: any LoadUserAuthorityUseCase {
        return appComponent.loadUserAuthorityUseCase
    }

    var queryMyStudentActivityUseCase: any QueryMyStudentActivityUseCase {
        return appComponent.queryMyStudentActivityUseCase
    }

    var queryStudentActivityListUseCase: any QueryStudentActivityListUseCase {
        return appComponent.queryStudentActivityListUseCase
    }

    var queryStudentActivityByIdUseCase: any QueryStudentActivityByIdUseCase {
        return appComponent.queryStudentActivityByIdUseCase
    }

    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}

/// ^->AppComponent->ActivityListComponent
private func factory7177e6769ee69064a61bf47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return ActivityListDependencyb8e659960978b8384f80Provider(appComponent: parent1(component) as! AppComponent)
}

private class LoginDependencyf4e78d0ad57be469bfd9Provider: LoginDependency {
    var loginUseCase: any LoginUseCase {
        return appComponent.loginUseCase
    }

    var signupFactory: any StudentSignUpFactory {
        return appComponent.signupFactory
    }

    var saveUserAuthorityUseCase: any SaveUserAuthorityUseCase {
        return appComponent.saveUserAuthorityUseCase
    }

    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}

/// ^->AppComponent->LoginComponent
private func factoryd6018e98563de75a2ba4f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return LoginDependencyf4e78d0ad57be469bfd9Provider(appComponent: parent1(component) as! AppComponent)
}

private class InputActivityDependency4e692e68e51cea5b706dProvider: InputActivityDependency {
    var activityDetailSettingFactory: any ActivityDetailSettingFactory {
        return appComponent.activityDetailSettingFactory
    }

    var addStudentActivityUseCase: any AddStudentActivityUseCase {
        return appComponent.addStudentActivityUseCase
    }

    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}

/// ^->AppComponent->InputActivityComponent
private func factory3fc1a279eeb8c906e603f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return InputActivityDependency4e692e68e51cea5b706dProvider(appComponent: parent1(component) as! AppComponent)
}

#else
extension ActivityDetailSettingComponent: Registration {
    public func registerItems() {}
}

extension StudentSignUpComponent: Registration {
    public func registerItems() {
        keyPathToName[\StudentSignUpDependency.studentSignupUseCase] = "studentSignupUseCase-any StudentSignupUseCase"
        keyPathToName[\StudentSignUpDependency.teacherSignupUseCase] = "teacherSignupUseCase-any TeacherSignupUseCase"
        keyPathToName[\StudentSignUpDependency.bbozzakSignupUseCase] = "bbozzakSignupUseCase-any BbozzakSignupUseCase"
        keyPathToName[\StudentSignUpDependency.professorSignupUseCase] =
            "professorSignupUseCase-any ProfessorSignupUseCase"
        keyPathToName[\StudentSignUpDependency.governmentSignupUseCase] =
            "governmentSignupUseCase-any GovernmentSignupUseCase"
        keyPathToName[\StudentSignUpDependency.companyInstructorSignupUseCase] =
            "companyInstructorSignupUseCase-any CompanyInstructorSignupUseCase"
    }
}

extension RootComponent: Registration {
    public func registerItems() {
        keyPathToName[\RootDependency.loginFactory] = "loginFactory-any LoginFactory"
    }
}

extension ActivityListComponent: Registration {
    public func registerItems() {
        keyPathToName[\ActivityListDependency.inputActivityFactory] = "inputActivityFactory-any InputActivityFactory"
        keyPathToName[\ActivityListDependency.loadUserAuthorityUseCase] =
            "loadUserAuthorityUseCase-any LoadUserAuthorityUseCase"
        keyPathToName[\ActivityListDependency.queryMyStudentActivityUseCase] =
            "queryMyStudentActivityUseCase-any QueryMyStudentActivityUseCase"
        keyPathToName[\ActivityListDependency.queryStudentActivityListUseCase] =
            "queryStudentActivityListUseCase-any QueryStudentActivityListUseCase"
        keyPathToName[\ActivityListDependency.queryStudentActivityByIdUseCase] =
            "queryStudentActivityByIdUseCase-any QueryStudentActivityByIdUseCase"
    }
}

extension LoginComponent: Registration {
    public func registerItems() {
        keyPathToName[\LoginDependency.loginUseCase] = "loginUseCase-any LoginUseCase"
        keyPathToName[\LoginDependency.signupFactory] = "signupFactory-any StudentSignUpFactory"
        keyPathToName[\LoginDependency.saveUserAuthorityUseCase] =
            "saveUserAuthorityUseCase-any SaveUserAuthorityUseCase"
    }
}

extension InputActivityComponent: Registration {
    public func registerItems() {
        keyPathToName[\InputActivityDependency.activityDetailSettingFactory] =
            "activityDetailSettingFactory-any ActivityDetailSettingFactory"
        keyPathToName[\InputActivityDependency.addStudentActivityUseCase] =
            "addStudentActivityUseCase-any AddStudentActivityUseCase"
    }
}

extension AppComponent: Registration {
    public func registerItems() {
        localTable["keychain-Keychain"] = { [unowned self] in self.keychain as Any }
        localTable["remoteLectureDataSource-any RemoteLectureDataSource"] = { [unowned self] in
            self.remoteLectureDataSource as Any
        }
        localTable["lectureRepository-any LectureRepository"] = { [unowned self] in self.lectureRepository as Any }
        localTable["lectureOpenUseCase-any LectureOpenUseCase"] = { [unowned self] in self.lectureOpenUseCase as Any }
        localTable["lectureListInquiryUseCase-any LectureListInquirtyUseCase"] = { [unowned self] in
            self.lectureListInquiryUseCase as Any
        }
        localTable["lectureDetailInquiryUseCase-any LectureDetailInquiryUseCase"] = { [unowned self] in
            self.lectureDetailInquiryUseCase as Any
        }
        localTable["lectureApplyUseCase-any LectureApplyUseCase"] = { [unowned self] in
            self.lectureApplyUseCase as Any
        }
        localTable["waitingLectureApproveUseCase-any WaitingLectureApproveUseCase"] = { [unowned self] in
            self.waitingLectureApproveUseCase as Any
        }
        localTable["waitingLectureRejectUseCase-any WaitingLectureRejectUseCase"] = { [unowned self] in
            self.waitingLectureRejectUseCase as Any
        }
        localTable["remoteClubDataSource-any RemoteClubDataSource"] = { [unowned self] in
            self.remoteClubDataSource as Any
        }
        localTable["clubRepository-any ClubRepository"] = { [unowned self] in self.clubRepository as Any }
        localTable["queryClubListUseCase-any QueryClubListUseCase"] = { [unowned self] in
            self.queryClubListUseCase as Any
        }
        localTable["queryClubDetailUseCase-any QueryClubDetailUseCase"] = { [unowned self] in
            self.queryClubDetailUseCase as Any
        }
        localTable["queryStudentListByClubUseCase-any QueryStudentListByClubUseCase"] = { [unowned self] in
            self.queryStudentListByClubUseCase as Any
        }
        localTable["queryStudentDetailByClubUseCase-any QueryStudentDetailByClubUseCase"] = { [unowned self] in
            self.queryStudentDetailByClubUseCase as Any
        }
        localTable["localAuthDataSource-any LocalAuthDataSource"] = { [unowned self] in
            self.localAuthDataSource as Any
        }
        localTable["remoteAuthDataSource-any RemoteAuthDataSource"] = { [unowned self] in
            self.remoteAuthDataSource as Any
        }
        localTable["authRepository-any AuthRepository"] = { [unowned self] in self.authRepository as Any }
        localTable["loginUseCase-any LoginUseCase"] = { [unowned self] in self.loginUseCase as Any }
        localTable["saveUserAuthorityUseCase-any SaveUserAuthorityUseCase"] = { [unowned self] in
            self.saveUserAuthorityUseCase as Any
        }
        localTable["loadUserAuthorityUseCase-any LoadUserAuthorityUseCase"] = { [unowned self] in
            self.loadUserAuthorityUseCase as Any
        }
        localTable["reissueTokenUseCase-any ReissueTokenUseCase"] = { [unowned self] in
            self.reissueTokenUseCase as Any
        }
        localTable["logoutUseCase-any LogoutUseCase"] = { [unowned self] in self.logoutUseCase as Any }
        localTable["withdrawalUseCase-any WithdrawalUseCase"] = { [unowned self] in self.withdrawalUseCase as Any }
        localTable["studentSignupUseCase-any StudentSignupUseCase"] = { [unowned self] in
            self.studentSignupUseCase as Any
        }
        localTable["teacherSignupUseCase-any TeacherSignupUseCase"] = { [unowned self] in
            self.teacherSignupUseCase as Any
        }
        localTable["bbozzakSignupUseCase-any BbozzakSignupUseCase"] = { [unowned self] in
            self.bbozzakSignupUseCase as Any
        }
        localTable["professorSignupUseCase-any ProfessorSignupUseCase"] = { [unowned self] in
            self.professorSignupUseCase as Any
        }
        localTable["governmentSignupUseCase-any GovernmentSignupUseCase"] = { [unowned self] in
            self.governmentSignupUseCase as Any
        }
        localTable["companyInstructorSignupUseCase-any CompanyInstructorSignupUseCase"] = { [unowned self] in
            self.companyInstructorSignupUseCase as Any
        }
        localTable["remoteDataSource-any RemoteActivityDataSource"] = { [unowned self] in self.remoteDataSource as Any }
        localTable["activityRepository-any ActivityRepository"] = { [unowned self] in self.activityRepository as Any }
        localTable["addStudentActivityUseCase-any AddStudentActivityUseCase"] = { [unowned self] in
            self.addStudentActivityUseCase as Any
        }
        localTable["approveStudentActivityUseCase-any ApproveStudentActivityUseCase"] = { [unowned self] in
            self.approveStudentActivityUseCase as Any
        }
        localTable["deleteStudentActivityUseCase-any DeleteStudentActivityUseCase"] = { [unowned self] in
            self.deleteStudentActivityUseCase as Any
        }
        localTable["queryMyStudentActivityUseCase-any QueryMyStudentActivityUseCase"] = { [unowned self] in
            self.queryMyStudentActivityUseCase as Any
        }
        localTable["queryStudentActivityByIdUseCase-any QueryStudentActivityByIdUseCase"] = { [unowned self] in
            self.queryStudentActivityByIdUseCase as Any
        }
        localTable["queryStudentActivityListUseCase-any QueryStudentActivityListUseCase"] = { [unowned self] in
            self.queryStudentActivityListUseCase as Any
        }
        localTable["queryStudentActivityDetailsUseCase-any QueryStudentActivityDetailsUseCase"] = { [unowned self] in
            self.queryStudentActivityDetailsUseCase as Any
        }
        localTable["remoteUserDataSource-any RemoteUserDataSource"] = { [unowned self] in
            self.remoteUserDataSource as Any
        }
        localTable["userRepository-any UserRepository"] = { [unowned self] in self.userRepository as Any }
        localTable["changePasswordUseCase-any ChangePasswordUseCase"] = { [unowned self] in
            self.changePasswordUseCase as Any
        }
        localTable["queryMyInfoUseCase-any QueryMyInfoUseCase"] = { [unowned self] in self.queryMyInfoUseCase as Any }
        localTable["loginFactory-any LoginFactory"] = { [unowned self] in self.loginFactory as Any }
        localTable["activityListFactory-any ActivityListFactory"] = { [unowned self] in
            self.activityListFactory as Any
        }
        localTable["signupFactory-any StudentSignUpFactory"] = { [unowned self] in self.signupFactory as Any }
        localTable["inputActivityFactory-any InputActivityFactory"] = { [unowned self] in
            self.inputActivityFactory as Any
        }
        localTable["activityDetailSettingFactory-any ActivityDetailSettingFactory"] = { [unowned self] in
            self.activityDetailSettingFactory as Any
        }
    }
}

#endif

private func factoryEmptyDependencyProvider(_ component: NeedleFoundation.Scope) -> AnyObject {
    return EmptyDependencyProvider(component: component)
}

// MARK: - Registration
private func registerProviderFactory(
    _ componentPath: String,
    _ factory: @escaping (NeedleFoundation.Scope) -> AnyObject
) {
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: componentPath, factory)
}

#if !NEEDLE_DYNAMIC

@inline(never) private func register1() {
    registerProviderFactory(
        "^->AppComponent->ActivityDetailSettingComponent",
        factoryfd595280dea209e217b9e3b0c44298fc1c149afb
    )
    registerProviderFactory("^->AppComponent->StudentSignUpComponent", factoryc57b1cf1651b3051e040f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->RootComponent", factory264bfc4d4cb6b0629b40f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->ActivityListComponent", factory7177e6769ee69064a61bf47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->LoginComponent", factoryd6018e98563de75a2ba4f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->InputActivityComponent", factory3fc1a279eeb8c906e603f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent", factoryEmptyDependencyProvider)
}
#endif

public func registerProviderFactories() {
    #if !NEEDLE_DYNAMIC
    register1()
    #endif
}

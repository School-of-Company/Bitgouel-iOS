

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

private class InputPostDependency2bb888f6c56a6060d23fProvider: InputPostDependency {
    var postDetailSettingFactory: any PostDetailSettingFactory {
        return appComponent.postDetailSettingFactory
    }
    var writePostUseCase: any WritePostUseCase {
        return appComponent.writePostUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->InputPostComponent
private func factoryfd208488fdd5cb4acc65f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return InputPostDependency2bb888f6c56a6060d23fProvider(appComponent: parent1(component) as! AppComponent)
}
private class ClubListDependency90c6e61626f7c53ad50fProvider: ClubListDependency {
    var queryClubListUseCase: any QueryClubListUseCase {
        return appComponent.queryClubListUseCase
    }
    var clubDetailFactory: any ClubDetailFactory {
        return appComponent.clubDetailFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->ClubListComponent
private func factory050817f1b6d356b83467f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return ClubListDependency90c6e61626f7c53ad50fProvider(appComponent: parent1(component) as! AppComponent)
}
private class LectureListDetailDependency2a815f1240973966e6a6Provider: LectureListDetailDependency {
    var queryLectureDetailUseCase: any QueryLectureDetailUseCase {
        return appComponent.queryLectureDetailUseCase
    }
    var lectureApplyUseCase: any LectureApplyUseCase {
        return appComponent.lectureApplyUseCase
    }
    var lectureCancelUseCase: any LectureCancelUseCase {
        return appComponent.lectureCancelUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->LectureListDetailComponent
private func factory22af859a70aa8ba0b346f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return LectureListDetailDependency2a815f1240973966e6a6Provider(appComponent: parent1(component) as! AppComponent)
}
private class NoticeListDependency0e93eb53be8626c408e4Provider: NoticeListDependency {


    init() {

    }
}
/// ^->AppComponent->NoticeListComponent
private func factorye14e687c08985bdffcd0e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return NoticeListDependency0e93eb53be8626c408e4Provider()
}
private class SignUpDependencyf83ac0c64026320e6dc2Provider: SignUpDependency {
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
    var successSignUpFactory: any SuccessSignUpFactory {
        return appComponent.successSignUpFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->SignUpComponent
private func factory306e8ce5cfdf41304709f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return SignUpDependencyf83ac0c64026320e6dc2Provider(appComponent: parent1(component) as! AppComponent)
}
private class ActivityDetailSettingDependency0b98c5f90168b920a8b8Provider: ActivityDetailSettingDependency {


    init() {

    }
}
/// ^->AppComponent->ActivityDetailSettingComponent
private func factoryfd595280dea209e217b9e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return ActivityDetailSettingDependency0b98c5f90168b920a8b8Provider()
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
private class PostListDependencye041dce90a2be61e7af5Provider: PostListDependency {
    var noticeListFactory: any NoticeListFactory {
        return appComponent.noticeListFactory
    }
    var inquiryListFactory: any InquiryListFactory {
        return appComponent.inquiryListFactory
    }
    var inputPostFactory: any InputPostFactory {
        return appComponent.inputPostFactory
    }
    var postDetailFactory: any PostDetailFactory {
        return appComponent.postDetailFactory
    }
    var loadUserAuthorityUseCase: any LoadUserAuthorityUseCase {
        return appComponent.loadUserAuthorityUseCase
    }
    var queryPostListUseCase: any QueryPostListUseCase {
        return appComponent.queryPostListUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->PostListComponent
private func factory0c89e2bbcc02dbcac018f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return PostListDependencye041dce90a2be61e7af5Provider(appComponent: parent1(component) as! AppComponent)
}
private class ClubdetailDependency09c03e1ee67d1fbecba1Provider: ClubdetailDependency {
    var loadUserAuthorityUseCase: any LoadUserAuthorityUseCase {
        return appComponent.loadUserAuthorityUseCase
    }
    var queryClubDetailUseCase: any QueryClubDetailUseCase {
        return appComponent.queryClubDetailUseCase
    }
    var queryStudentListByClubUseCase: any QueryStudentListByClubUseCase {
        return appComponent.queryStudentListByClubUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->ClubDetailComponent
private func factory1559652f8e80cfa88d06f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return ClubdetailDependency09c03e1ee67d1fbecba1Provider(appComponent: parent1(component) as! AppComponent)
}
private class SuccessSignUpDependencydbc5dd5670791a0302f6Provider: SuccessSignUpDependency {
    var loginFactory: any LoginFactory {
        return appComponent.loginFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->SuccessSignUpComponent
private func factorybf219b153b668170161df47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return SuccessSignUpDependencydbc5dd5670791a0302f6Provider(appComponent: parent1(component) as! AppComponent)
}
private class PostDetailDependencycf431278832ae8226535Provider: PostDetailDependency {
    var editPostFactory: any EditPostFactory {
        return appComponent.editPostFactory
    }
    var queryPostDetailUseCase: any QueryPostDetailUseCase {
        return appComponent.queryPostDetailUseCase
    }
    var deletePostUseCase: any DeletePostUseCase {
        return appComponent.deletePostUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->PostDetailComponent
private func factorybc555a73df3767a26999f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return PostDetailDependencycf431278832ae8226535Provider(appComponent: parent1(component) as! AppComponent)
}
private class InquiryListDependencyec75a7335a50ded93b28Provider: InquiryListDependency {


    init() {

    }
}
/// ^->AppComponent->InquiryListComponent
private func factorydd7e28250a180554c7a0e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return InquiryListDependencyec75a7335a50ded93b28Provider()
}
private class EditPostDependency2fc4e7c9e3795c6e218eProvider: EditPostDependency {
    var postDetailSettingFactory: any PostDetailSettingFactory {
        return appComponent.postDetailSettingFactory
    }
    var queryPostDetailUseCase: any QueryPostDetailUseCase {
        return appComponent.queryPostDetailUseCase
    }
    var updatePostUseCase: any UpdatePostUseCase {
        return appComponent.updatePostUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->EditPostComponent
private func factoryf55a9d7f6c1ed8d0f0aef47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return EditPostDependency2fc4e7c9e3795c6e218eProvider(appComponent: parent1(component) as! AppComponent)
}
private class ActivityListDependencyb8e659960978b8384f80Provider: ActivityListDependency {
    var activityDetailFactory: any ActivityDetailFactory {
        return appComponent.activityDetailFactory
    }
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
    var queryStudentActivityByIDUseCase: any QueryStudentActivityByIDUseCase {
        return appComponent.queryStudentActivityByIDUseCase
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
    var signupFactory: any SignUpFactory {
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
private class LectureListDependencyf05b805b4d41a7643bcdProvider: LectureListDependency {
    var lectureListDetailFactory: any LectureListDetailFactory {
        return appComponent.lectureListDetailFactory
    }
    var loadUserAuthorityUseCase: any LoadUserAuthorityUseCase {
        return appComponent.loadUserAuthorityUseCase
    }
    var queryLectureListUseCase: any QueryLectureListUseCase {
        return appComponent.queryLectureListUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->LectureListComponent
private func factorya2eac906a839dcacda45f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return LectureListDependencyf05b805b4d41a7643bcdProvider(appComponent: parent1(component) as! AppComponent)
}
private class PostDetailSettingDependency372dc6ac7d7de7c5ac4eProvider: PostDetailSettingDependency {


    init() {

    }
}
/// ^->AppComponent->PostDetailSettingComponent
private func factoryaacb19523586bb790cade3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return PostDetailSettingDependency372dc6ac7d7de7c5ac4eProvider()
}
private class ActivityDetailDependencyc459286ea5f8c1b2ecdbProvider: ActivityDetailDependency {
    var loadUserAuthorityUseCase: any LoadUserAuthorityUseCase {
        return appComponent.loadUserAuthorityUseCase
    }
    var queryStudentActivityDetailsUseCase: any QueryStudentActivityDetailsUseCase {
        return appComponent.queryStudentActivityDetailsUseCase
    }
    var approveStudentActivityUseCase: any ApproveStudentActivityUseCase {
        return appComponent.approveStudentActivityUseCase
    }
    var rejectStudentActivityUseCase: any RejectStudentActivityUseCase {
        return appComponent.rejectStudentActivityUseCase
    }
    var deleteStudentActivityUseCase: any DeleteStudentActivityUseCase {
        return appComponent.deleteStudentActivityUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->ActivityDetailComponent
private func factory7c395808ac9dfb8fb229f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return ActivityDetailDependencyc459286ea5f8c1b2ecdbProvider(appComponent: parent1(component) as! AppComponent)
}
private class NoticeDetailDependency3e09bbd26d7f6105e665Provider: NoticeDetailDependency {


    init() {

    }
}
/// ^->AppComponent->NoticeDetailViewComponent
private func factory0798e0f01e95aeaff56fe3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return NoticeDetailDependency3e09bbd26d7f6105e665Provider()
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
extension InputPostComponent: Registration {
    public func registerItems() {
        keyPathToName[\InputPostDependency.postDetailSettingFactory] = "postDetailSettingFactory-any PostDetailSettingFactory"
        keyPathToName[\InputPostDependency.writePostUseCase] = "writePostUseCase-any WritePostUseCase"
    }
}
extension ClubListComponent: Registration {
    public func registerItems() {
        keyPathToName[\ClubListDependency.queryClubListUseCase] = "queryClubListUseCase-any QueryClubListUseCase"
        keyPathToName[\ClubListDependency.clubDetailFactory] = "clubDetailFactory-any ClubDetailFactory"
    }
}
extension LectureListDetailComponent: Registration {
    public func registerItems() {
        keyPathToName[\LectureListDetailDependency.queryLectureDetailUseCase] = "queryLectureDetailUseCase-any QueryLectureDetailUseCase"
        keyPathToName[\LectureListDetailDependency.lectureApplyUseCase] = "lectureApplyUseCase-any LectureApplyUseCase"
        keyPathToName[\LectureListDetailDependency.lectureCancelUseCase] = "lectureCancelUseCase-any LectureCancelUseCase"
    }
}
extension NoticeListComponent: Registration {
    public func registerItems() {

    }
}
extension SignUpComponent: Registration {
    public func registerItems() {
        keyPathToName[\SignUpDependency.studentSignupUseCase] = "studentSignupUseCase-any StudentSignupUseCase"
        keyPathToName[\SignUpDependency.teacherSignupUseCase] = "teacherSignupUseCase-any TeacherSignupUseCase"
        keyPathToName[\SignUpDependency.bbozzakSignupUseCase] = "bbozzakSignupUseCase-any BbozzakSignupUseCase"
        keyPathToName[\SignUpDependency.professorSignupUseCase] = "professorSignupUseCase-any ProfessorSignupUseCase"
        keyPathToName[\SignUpDependency.governmentSignupUseCase] = "governmentSignupUseCase-any GovernmentSignupUseCase"
        keyPathToName[\SignUpDependency.companyInstructorSignupUseCase] = "companyInstructorSignupUseCase-any CompanyInstructorSignupUseCase"
        keyPathToName[\SignUpDependency.successSignUpFactory] = "successSignUpFactory-any SuccessSignUpFactory"
    }
}
extension ActivityDetailSettingComponent: Registration {
    public func registerItems() {

    }
}
extension RootComponent: Registration {
    public func registerItems() {
        keyPathToName[\RootDependency.loginFactory] = "loginFactory-any LoginFactory"
    }
}
extension PostListComponent: Registration {
    public func registerItems() {
        keyPathToName[\PostListDependency.noticeListFactory] = "noticeListFactory-any NoticeListFactory"
        keyPathToName[\PostListDependency.inquiryListFactory] = "inquiryListFactory-any InquiryListFactory"
        keyPathToName[\PostListDependency.inputPostFactory] = "inputPostFactory-any InputPostFactory"
        keyPathToName[\PostListDependency.postDetailFactory] = "postDetailFactory-any PostDetailFactory"
        keyPathToName[\PostListDependency.loadUserAuthorityUseCase] = "loadUserAuthorityUseCase-any LoadUserAuthorityUseCase"
        keyPathToName[\PostListDependency.queryPostListUseCase] = "queryPostListUseCase-any QueryPostListUseCase"
    }
}
extension ClubDetailComponent: Registration {
    public func registerItems() {
        keyPathToName[\ClubdetailDependency.loadUserAuthorityUseCase] = "loadUserAuthorityUseCase-any LoadUserAuthorityUseCase"
        keyPathToName[\ClubdetailDependency.queryClubDetailUseCase] = "queryClubDetailUseCase-any QueryClubDetailUseCase"
        keyPathToName[\ClubdetailDependency.queryStudentListByClubUseCase] = "queryStudentListByClubUseCase-any QueryStudentListByClubUseCase"
    }
}
extension SuccessSignUpComponent: Registration {
    public func registerItems() {
        keyPathToName[\SuccessSignUpDependency.loginFactory] = "loginFactory-any LoginFactory"
    }
}
extension PostDetailComponent: Registration {
    public func registerItems() {
        keyPathToName[\PostDetailDependency.editPostFactory] = "editPostFactory-any EditPostFactory"
        keyPathToName[\PostDetailDependency.queryPostDetailUseCase] = "queryPostDetailUseCase-any QueryPostDetailUseCase"
        keyPathToName[\PostDetailDependency.deletePostUseCase] = "deletePostUseCase-any DeletePostUseCase"
    }
}
extension InquiryListComponent: Registration {
    public func registerItems() {

    }
}
extension EditPostComponent: Registration {
    public func registerItems() {
        keyPathToName[\EditPostDependency.postDetailSettingFactory] = "postDetailSettingFactory-any PostDetailSettingFactory"
        keyPathToName[\EditPostDependency.queryPostDetailUseCase] = "queryPostDetailUseCase-any QueryPostDetailUseCase"
        keyPathToName[\EditPostDependency.updatePostUseCase] = "updatePostUseCase-any UpdatePostUseCase"
    }
}
extension ActivityListComponent: Registration {
    public func registerItems() {
        keyPathToName[\ActivityListDependency.activityDetailFactory] = "activityDetailFactory-any ActivityDetailFactory"
        keyPathToName[\ActivityListDependency.inputActivityFactory] = "inputActivityFactory-any InputActivityFactory"
        keyPathToName[\ActivityListDependency.loadUserAuthorityUseCase] = "loadUserAuthorityUseCase-any LoadUserAuthorityUseCase"
        keyPathToName[\ActivityListDependency.queryMyStudentActivityUseCase] = "queryMyStudentActivityUseCase-any QueryMyStudentActivityUseCase"
        keyPathToName[\ActivityListDependency.queryStudentActivityListUseCase] = "queryStudentActivityListUseCase-any QueryStudentActivityListUseCase"
        keyPathToName[\ActivityListDependency.queryStudentActivityByIDUseCase] = "queryStudentActivityByIDUseCase-any QueryStudentActivityByIDUseCase"
    }
}
extension LoginComponent: Registration {
    public func registerItems() {
        keyPathToName[\LoginDependency.loginUseCase] = "loginUseCase-any LoginUseCase"
        keyPathToName[\LoginDependency.signupFactory] = "signupFactory-any SignUpFactory"
        keyPathToName[\LoginDependency.saveUserAuthorityUseCase] = "saveUserAuthorityUseCase-any SaveUserAuthorityUseCase"
    }
}
extension LectureListComponent: Registration {
    public func registerItems() {
        keyPathToName[\LectureListDependency.lectureListDetailFactory] = "lectureListDetailFactory-any LectureListDetailFactory"
        keyPathToName[\LectureListDependency.loadUserAuthorityUseCase] = "loadUserAuthorityUseCase-any LoadUserAuthorityUseCase"
        keyPathToName[\LectureListDependency.queryLectureListUseCase] = "queryLectureListUseCase-any QueryLectureListUseCase"
    }
}
extension PostDetailSettingComponent: Registration {
    public func registerItems() {

    }
}
extension ActivityDetailComponent: Registration {
    public func registerItems() {
        keyPathToName[\ActivityDetailDependency.loadUserAuthorityUseCase] = "loadUserAuthorityUseCase-any LoadUserAuthorityUseCase"
        keyPathToName[\ActivityDetailDependency.queryStudentActivityDetailsUseCase] = "queryStudentActivityDetailsUseCase-any QueryStudentActivityDetailsUseCase"
        keyPathToName[\ActivityDetailDependency.approveStudentActivityUseCase] = "approveStudentActivityUseCase-any ApproveStudentActivityUseCase"
        keyPathToName[\ActivityDetailDependency.rejectStudentActivityUseCase] = "rejectStudentActivityUseCase-any RejectStudentActivityUseCase"
        keyPathToName[\ActivityDetailDependency.deleteStudentActivityUseCase] = "deleteStudentActivityUseCase-any DeleteStudentActivityUseCase"
    }
}
extension NoticeDetailViewComponent: Registration {
    public func registerItems() {

    }
}
extension InputActivityComponent: Registration {
    public func registerItems() {
        keyPathToName[\InputActivityDependency.activityDetailSettingFactory] = "activityDetailSettingFactory-any ActivityDetailSettingFactory"
        keyPathToName[\InputActivityDependency.addStudentActivityUseCase] = "addStudentActivityUseCase-any AddStudentActivityUseCase"
    }
}
extension AppComponent: Registration {
    public func registerItems() {

        localTable["keychain-Keychain"] = { [unowned self] in self.keychain as Any }
        localTable["remoteLectureDataSource-any RemoteLectureDataSource"] = { [unowned self] in self.remoteLectureDataSource as Any }
        localTable["lectureRepository-any LectureRepository"] = { [unowned self] in self.lectureRepository as Any }
        localTable["lectureOpenUseCase-any LectureOpenUseCase"] = { [unowned self] in self.lectureOpenUseCase as Any }
        localTable["queryLectureListUseCase-any QueryLectureListUseCase"] = { [unowned self] in self.queryLectureListUseCase as Any }
        localTable["queryLectureDetailUseCase-any QueryLectureDetailUseCase"] = { [unowned self] in self.queryLectureDetailUseCase as Any }
        localTable["lectureApplyUseCase-any LectureApplyUseCase"] = { [unowned self] in self.lectureApplyUseCase as Any }
        localTable["lectureCancelUseCase-any LectureCancelUseCase"] = { [unowned self] in self.lectureCancelUseCase as Any }
        localTable["remoteClubDataSource-any RemoteClubDataSource"] = { [unowned self] in self.remoteClubDataSource as Any }
        localTable["clubRepository-any ClubRepository"] = { [unowned self] in self.clubRepository as Any }
        localTable["queryClubListUseCase-any QueryClubListUseCase"] = { [unowned self] in self.queryClubListUseCase as Any }
        localTable["queryClubDetailUseCase-any QueryClubDetailUseCase"] = { [unowned self] in self.queryClubDetailUseCase as Any }
        localTable["queryStudentListByClubUseCase-any QueryStudentListByClubUseCase"] = { [unowned self] in self.queryStudentListByClubUseCase as Any }
        localTable["queryStudentDetailByClubUseCase-any QueryStudentDetailByClubUseCase"] = { [unowned self] in self.queryStudentDetailByClubUseCase as Any }
        localTable["remotePostDataSource-any RemotePostDataSource"] = { [unowned self] in self.remotePostDataSource as Any }
        localTable["postRepository-any PostRepository"] = { [unowned self] in self.postRepository as Any }
        localTable["writePostUseCase-any WritePostUseCase"] = { [unowned self] in self.writePostUseCase as Any }
        localTable["queryPostListUseCase-any QueryPostListUseCase"] = { [unowned self] in self.queryPostListUseCase as Any }
        localTable["queryPostDetailUseCase-any QueryPostDetailUseCase"] = { [unowned self] in self.queryPostDetailUseCase as Any }
        localTable["updatePostUseCase-any UpdatePostUseCase"] = { [unowned self] in self.updatePostUseCase as Any }
        localTable["deletePostUseCase-any DeletePostUseCase"] = { [unowned self] in self.deletePostUseCase as Any }
        localTable["localAuthDataSource-any LocalAuthDataSource"] = { [unowned self] in self.localAuthDataSource as Any }
        localTable["remoteAuthDataSource-any RemoteAuthDataSource"] = { [unowned self] in self.remoteAuthDataSource as Any }
        localTable["authRepository-any AuthRepository"] = { [unowned self] in self.authRepository as Any }
        localTable["loginUseCase-any LoginUseCase"] = { [unowned self] in self.loginUseCase as Any }
        localTable["saveUserAuthorityUseCase-any SaveUserAuthorityUseCase"] = { [unowned self] in self.saveUserAuthorityUseCase as Any }
        localTable["loadUserAuthorityUseCase-any LoadUserAuthorityUseCase"] = { [unowned self] in self.loadUserAuthorityUseCase as Any }
        localTable["reissueTokenUseCase-any ReissueTokenUseCase"] = { [unowned self] in self.reissueTokenUseCase as Any }
        localTable["logoutUseCase-any LogoutUseCase"] = { [unowned self] in self.logoutUseCase as Any }
        localTable["withdrawalUseCase-any WithdrawalUseCase"] = { [unowned self] in self.withdrawalUseCase as Any }
        localTable["studentSignupUseCase-any StudentSignupUseCase"] = { [unowned self] in self.studentSignupUseCase as Any }
        localTable["teacherSignupUseCase-any TeacherSignupUseCase"] = { [unowned self] in self.teacherSignupUseCase as Any }
        localTable["bbozzakSignupUseCase-any BbozzakSignupUseCase"] = { [unowned self] in self.bbozzakSignupUseCase as Any }
        localTable["professorSignupUseCase-any ProfessorSignupUseCase"] = { [unowned self] in self.professorSignupUseCase as Any }
        localTable["governmentSignupUseCase-any GovernmentSignupUseCase"] = { [unowned self] in self.governmentSignupUseCase as Any }
        localTable["companyInstructorSignupUseCase-any CompanyInstructorSignupUseCase"] = { [unowned self] in self.companyInstructorSignupUseCase as Any }
        localTable["remoteActivityDataSource-any RemoteActivityDataSource"] = { [unowned self] in self.remoteActivityDataSource as Any }
        localTable["activityRepository-any ActivityRepository"] = { [unowned self] in self.activityRepository as Any }
        localTable["addStudentActivityUseCase-any AddStudentActivityUseCase"] = { [unowned self] in self.addStudentActivityUseCase as Any }
        localTable["rejectStudentActivityUseCase-any RejectStudentActivityUseCase"] = { [unowned self] in self.rejectStudentActivityUseCase as Any }
        localTable["approveStudentActivityUseCase-any ApproveStudentActivityUseCase"] = { [unowned self] in self.approveStudentActivityUseCase as Any }
        localTable["deleteStudentActivityUseCase-any DeleteStudentActivityUseCase"] = { [unowned self] in self.deleteStudentActivityUseCase as Any }
        localTable["queryMyStudentActivityUseCase-any QueryMyStudentActivityUseCase"] = { [unowned self] in self.queryMyStudentActivityUseCase as Any }
        localTable["queryStudentActivityByIDUseCase-any QueryStudentActivityByIDUseCase"] = { [unowned self] in self.queryStudentActivityByIDUseCase as Any }
        localTable["queryStudentActivityListUseCase-any QueryStudentActivityListUseCase"] = { [unowned self] in self.queryStudentActivityListUseCase as Any }
        localTable["queryStudentActivityDetailsUseCase-any QueryStudentActivityDetailsUseCase"] = { [unowned self] in self.queryStudentActivityDetailsUseCase as Any }
        localTable["remoteUserDataSource-any RemoteUserDataSource"] = { [unowned self] in self.remoteUserDataSource as Any }
        localTable["userRepository-any UserRepository"] = { [unowned self] in self.userRepository as Any }
        localTable["changePasswordUseCase-any ChangePasswordUseCase"] = { [unowned self] in self.changePasswordUseCase as Any }
        localTable["queryMyInfoUseCase-any QueryMyInfoUseCase"] = { [unowned self] in self.queryMyInfoUseCase as Any }
        localTable["loginFactory-any LoginFactory"] = { [unowned self] in self.loginFactory as Any }
        localTable["activityListFactory-any ActivityListFactory"] = { [unowned self] in self.activityListFactory as Any }
        localTable["signupFactory-any SignUpFactory"] = { [unowned self] in self.signupFactory as Any }
        localTable["successSignUpFactory-any SuccessSignUpFactory"] = { [unowned self] in self.successSignUpFactory as Any }
        localTable["inputActivityFactory-any InputActivityFactory"] = { [unowned self] in self.inputActivityFactory as Any }
        localTable["activityDetailFactory-any ActivityDetailFactory"] = { [unowned self] in self.activityDetailFactory as Any }
        localTable["activityDetailSettingFactory-any ActivityDetailSettingFactory"] = { [unowned self] in self.activityDetailSettingFactory as Any }
        localTable["clubDetailFactory-any ClubDetailFactory"] = { [unowned self] in self.clubDetailFactory as Any }
        localTable["clubListFactory-any ClubListFactory"] = { [unowned self] in self.clubListFactory as Any }
        localTable["lectureListFactory-any LectureListFactory"] = { [unowned self] in self.lectureListFactory as Any }
        localTable["lectureListDetailFactory-any LectureListDetailFactory"] = { [unowned self] in self.lectureListDetailFactory as Any }
        localTable["postListFactory-any PostListFactory"] = { [unowned self] in self.postListFactory as Any }
        localTable["postDetailSettingFactory-any PostDetailSettingFactory"] = { [unowned self] in self.postDetailSettingFactory as Any }
        localTable["inputPostFactory-any InputPostFactory"] = { [unowned self] in self.inputPostFactory as Any }
        localTable["postDetailFactory-any PostDetailFactory"] = { [unowned self] in self.postDetailFactory as Any }
        localTable["editPostFactory-any EditPostFactory"] = { [unowned self] in self.editPostFactory as Any }
        localTable["noticeListFactory-any NoticeListFactory"] = { [unowned self] in self.noticeListFactory as Any }
        localTable["inquiryListFactory-any InquiryListFactory"] = { [unowned self] in self.inquiryListFactory as Any }
        localTable["noticeDetailFactory-any NoticeDetailFactory"] = { [unowned self] in self.noticeDetailFactory as Any }
        localTable["remoteCertificationDataSource-any RemoteCertificationDataSource"] = { [unowned self] in self.remoteCertificationDataSource as Any }
        localTable["certificationRepository-any CertificationRepository"] = { [unowned self] in self.certificationRepository as Any }
        localTable["queryCertificationListByTeacherUseCase-any QueryCertificationListByTeacherUseCase"] = { [unowned self] in self.queryCertificationListByTeacherUseCase as Any }
        localTable["queryCertificationListByStudentUseCase-any QueryCertificationListByStudentUseCase"] = { [unowned self] in self.queryCertificationListByStudentUseCase as Any }
        localTable["inputCertificationUseCase-any InputCertificationUseCase"] = { [unowned self] in self.inputCertificationUseCase as Any }
        localTable["updateCertificationUseCase-any UpdateCertificationUseCase"] = { [unowned self] in self.updateCertificationUseCase as Any }
    }
}


#endif

private func factoryEmptyDependencyProvider(_ component: NeedleFoundation.Scope) -> AnyObject {
    return EmptyDependencyProvider(component: component)
}

// MARK: - Registration
private func registerProviderFactory(_ componentPath: String, _ factory: @escaping (NeedleFoundation.Scope) -> AnyObject) {
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: componentPath, factory)
}

#if !NEEDLE_DYNAMIC

@inline(never) private func register1() {
    registerProviderFactory("^->AppComponent->InputPostComponent", factoryfd208488fdd5cb4acc65f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->ClubListComponent", factory050817f1b6d356b83467f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->LectureListDetailComponent", factory22af859a70aa8ba0b346f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->NoticeListComponent", factorye14e687c08985bdffcd0e3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->SignUpComponent", factory306e8ce5cfdf41304709f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->ActivityDetailSettingComponent", factoryfd595280dea209e217b9e3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->RootComponent", factory264bfc4d4cb6b0629b40f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->PostListComponent", factory0c89e2bbcc02dbcac018f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->ClubDetailComponent", factory1559652f8e80cfa88d06f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->SuccessSignUpComponent", factorybf219b153b668170161df47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->PostDetailComponent", factorybc555a73df3767a26999f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->InquiryListComponent", factorydd7e28250a180554c7a0e3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->EditPostComponent", factoryf55a9d7f6c1ed8d0f0aef47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->ActivityListComponent", factory7177e6769ee69064a61bf47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->LoginComponent", factoryd6018e98563de75a2ba4f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->LectureListComponent", factorya2eac906a839dcacda45f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->PostDetailSettingComponent", factoryaacb19523586bb790cade3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->ActivityDetailComponent", factory7c395808ac9dfb8fb229f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->NoticeDetailViewComponent", factory0798e0f01e95aeaff56fe3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->InputActivityComponent", factory3fc1a279eeb8c906e603f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent", factoryEmptyDependencyProvider)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}



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
/// ^->AppComponent->InputPostComponent
private func factoryfd208488fdd5cb4acc65f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return InputPostDependency2bb888f6c56a6060d23fProvider(appComponent: parent1(component) as! AppComponent)
}
private class InputCertificationDependency4e950d4995ce855c5cd5Provider: InputCertificationDependency {
    var inputCertificationUseCase: any InputCertificationUseCase {
        return appComponent.inputCertificationUseCase
    }
    var updateCertificationUseCase: any UpdateCertificationUseCase {
        return appComponent.updateCertificationUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->InputCertificationComponent
private func factory2810b45b31199a5f0c2af47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return InputCertificationDependency4e950d4995ce855c5cd5Provider(appComponent: parent1(component) as! AppComponent)
}
private class ClubListDependency90c6e61626f7c53ad50fProvider: ClubListDependency {
    var queryClubListUseCase: any QueryClubListUseCase {
        return appComponent.queryClubListUseCase
    }
    var loadUserAuthorityUseCase: any LoadUserAuthorityUseCase {
        return appComponent.loadUserAuthorityUseCase
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
    var fetchLectureDetailUseCase: any FetchLectureDetailUseCase {
        return appComponent.fetchLectureDetailUseCase
    }
    var applyLectureUseCase: any ApplyLectureUseCase {
        return appComponent.applyLectureUseCase
    }
    var cancelLectureUseCase: any CancelLectureUseCase {
        return appComponent.cancelLectureUseCase
    }
    var loadUserAuthorityUseCase: any LoadUserAuthorityUseCase {
        return appComponent.loadUserAuthorityUseCase
    }
    var lectureApplicantListFactory: any LectureApplicantListFactory {
        return appComponent.lectureApplicantListFactory
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
private class AdminUserListDependency44bf9c85ea93b1b98debProvider: AdminUserListDependency {
    var adminRequestUserSignupFactory: any AdminRequestUserSignupFactory {
        return appComponent.adminRequestUserSignupFactory
    }
    var adminWithdrawUserListFactory: any AdminWithdrawUserListFactory {
        return appComponent.adminWithdrawUserListFactory
    }
    var fetchUserListUseCase: any FetchUserListUseCase {
        return appComponent.fetchUserListUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->AdminUserListComponent
private func factory55b3a27a2b6be9af9ba4f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return AdminUserListDependency44bf9c85ea93b1b98debProvider(appComponent: parent1(component) as! AppComponent)
}
private class NoticeListDependency0e93eb53be8626c408e4Provider: NoticeListDependency {
    var inquiryListFactory: any InquiryListFactory {
        return appComponent.inquiryListFactory
    }
    var noticeDetailFactory: any NoticeDetailFactory {
        return appComponent.noticeDetailFactory
    }
    var inputNoticeFactory: any InputNoticeFactory {
        return appComponent.inputNoticeFactory
    }
    var queryPostListUseCase: any QueryPostListUseCase {
        return appComponent.queryPostListUseCase
    }
    var loadUserAuthorityUseCase: any LoadUserAuthorityUseCase {
        return appComponent.loadUserAuthorityUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->NoticeListComponent
private func factorye14e687c08985bdffcd0f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return NoticeListDependency0e93eb53be8626c408e4Provider(appComponent: parent1(component) as! AppComponent)
}
private class OpenedLectureDependencyf5f55fb6c2a2daeac985Provider: OpenedLectureDependency {
    var openLectureUseCase: any OpenLectureUseCase {
        return appComponent.openLectureUseCase
    }
    var lectureDetailSettingFactory: any LectureDetailSettingFactory {
        return appComponent.lectureDetailSettingFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->OpenedLectureComponent
private func factory6636d97d1a9f0c8216d2f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return OpenedLectureDependencyf5f55fb6c2a2daeac985Provider(appComponent: parent1(component) as! AppComponent)
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
private class MainTabDependency2826cdb310ed0b17a725Provider: MainTabDependency {
    var mainFactory: any MainFactory {
        return appComponent.mainFactory
    }
    var lectureListFactory: any LectureListFactory {
        return appComponent.lectureListFactory
    }
    var postListFactory: any PostListFactory {
        return appComponent.postListFactory
    }
    var clubListFactory: any ClubListFactory {
        return appComponent.clubListFactory
    }
    var myPageFactory: any MyPageFactory {
        return appComponent.myPageFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->MainTabComponent
private func factory1ab5a747ddf21e1393f9f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return MainTabDependency2826cdb310ed0b17a725Provider(appComponent: parent1(component) as! AppComponent)
}
private class NoticeDetailSettingDependencye2c86b5d9ab8fbf629c4Provider: NoticeDetailSettingDependency {


    init() {

    }
}
/// ^->AppComponent->NoticeDetailSettingComponent
private func factory24d19202afbef2333be9e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return NoticeDetailSettingDependencye2c86b5d9ab8fbf629c4Provider()
}
private class MyPageDependency48d84b530313b3ee40feProvider: MyPageDependency {
    var changePasswordFactory: any ChangePasswordFactory {
        return appComponent.changePasswordFactory
    }
    var adminUserListFactory: any AdminUserListFactory {
        return appComponent.adminUserListFactory
    }
    var loadUserAuthorityUseCase: any LoadUserAuthorityUseCase {
        return appComponent.loadUserAuthorityUseCase
    }
    var fetchMyInfoUseCase: any FetchMyInfoUseCase {
        return appComponent.fetchMyInfoUseCase
    }
    var logoutUseCase: any LogoutUseCase {
        return appComponent.logoutUseCase
    }
    var withdrawalUseCase: any WithdrawalUseCase {
        return appComponent.withdrawalUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->MyPageComponent
private func factory0f6f456ebf157d02dfb3f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return MyPageDependency48d84b530313b3ee40feProvider(appComponent: parent1(component) as! AppComponent)
}
private class InquiryDetailDependencyf68d260d1f6dc07aaedbProvider: InquiryDetailDependency {
    var inputInquiryFactory: any InputInquiryFactory {
        return appComponent.inputInquiryFactory
    }
    var writeInquiryAnswerFactory: any WriteInquiryAnswerFactory {
        return appComponent.writeInquiryAnswerFactory
    }
    var fetchInquiryDetailUseCase: any FetchInquiryDetailUseCase {
        return appComponent.fetchInquiryDetailUseCase
    }
    var loadUserAuthorityUseCase: any LoadUserAuthorityUseCase {
        return appComponent.loadUserAuthorityUseCase
    }
    var deleteMyInquiryUseCase: any DeleteMyInquiryUseCase {
        return appComponent.deleteMyInquiryUseCase
    }
    var deleteInquiryByAdminUseCase: any DeleteInquiryByAdminUseCase {
        return appComponent.deleteInquiryByAdminUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->InquiryDetailComponent
private func factory2d6736bd037393a86ae3f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return InquiryDetailDependencyf68d260d1f6dc07aaedbProvider(appComponent: parent1(component) as! AppComponent)
}
private class InputNoticeDependency7b594803ad882c7e25c9Provider: InputNoticeDependency {
    var noticeDetailSettingFactory: any NoticeDetailSettingFactory {
        return appComponent.noticeDetailSettingFactory
    }
    var queryPostDetailUseCase: any QueryPostDetailUseCase {
        return appComponent.queryPostDetailUseCase
    }
    var writePostUseCase: any WritePostUseCase {
        return appComponent.writePostUseCase
    }
    var updatePostUseCase: any UpdatePostUseCase {
        return appComponent.updatePostUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->InputNoticeComponent
private func factory4545df5fcd42aaf8ed60f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return InputNoticeDependency7b594803ad882c7e25c9Provider(appComponent: parent1(component) as! AppComponent)
}
private class LectureDetailSettingDependencyd72c0b79ce6406870a95Provider: LectureDetailSettingDependency {
    var openedLectureFactory: any OpenedLectureFactory {
        return appComponent.openedLectureFactory
    }
    var fetchInstructorListUseCase: any FetchInstructorListUseCase {
        return appComponent.fetchInstructorListUseCase
    }
    var fetchLineListUseCase: any FetchLineListUseCase {
        return appComponent.fetchLineListUseCase
    }
    var fetchDepartmentListUseCase: any FetchDepartmentListUseCase {
        return appComponent.fetchDepartmentListUseCase
    }
    var fetchDivisionListUseCase: any FetchDivisionListUseCase {
        return appComponent.fetchDivisionListUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->LectureDetailSettingComponent
private func factoryd0ffb7dfc6fd9633e0e6f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return LectureDetailSettingDependencyd72c0b79ce6406870a95Provider(appComponent: parent1(component) as! AppComponent)
}
private class MainDependency7c6a5b4738b211b8e155Provider: MainDependency {
    var fetchFAQListUseCase: any FetchFAQListUseCase {
        return appComponent.fetchFAQListUseCase
    }
    var loadUserAuthorityUseCase: any LoadUserAuthorityUseCase {
        return appComponent.loadUserAuthorityUseCase
    }
    var inputFAQUseCase: any InputFAQUseCase {
        return appComponent.inputFAQUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->MainComponent
private func factoryc9274e46e78e70f29c54f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return MainDependency7c6a5b4738b211b8e155Provider(appComponent: parent1(component) as! AppComponent)
}
private class RootDependency3944cc797a4a88956fb5Provider: RootDependency {
    var loginFactory: any LoginFactory {
        return appComponent.loginFactory
    }
    var mainTabFactory: any MainTabFactory {
        return appComponent.mainTabFactory
    }
    var findPasswordFactory: any FindPasswordFactory {
        return appComponent.findPasswordFactory
    }
    var successSignUpFactory: any SuccessSignUpFactory {
        return appComponent.successSignUpFactory
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
private class ChangePasswordDependency04ab7ced24136c4fb27eProvider: ChangePasswordDependency {
    var successChangePasswordFactory: any SuccessChangePasswordFactory {
        return appComponent.successChangePasswordFactory
    }
    var changePasswordUseCase: any ChangePasswordUseCase {
        return appComponent.changePasswordUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->ChangePasswordComponent
private func factoryab7c4d87dab53e0a51b9f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return ChangePasswordDependency04ab7ced24136c4fb27eProvider(appComponent: parent1(component) as! AppComponent)
}
private class ClubdetailDependency09c03e1ee67d1fbecba1Provider: ClubdetailDependency {
    var studentInfoFactory: any StudentInfoFactory {
        return appComponent.studentInfoFactory
    }
    var loadUserAuthorityUseCase: any LoadUserAuthorityUseCase {
        return appComponent.loadUserAuthorityUseCase
    }
    var queryClubDetailUseCase: any QueryClubDetailUseCase {
        return appComponent.queryClubDetailUseCase
    }
    var queryStudentListByClubUseCase: any QueryStudentListByClubUseCase {
        return appComponent.queryStudentListByClubUseCase
    }
    var fetchMyInfoUseCase: any FetchMyInfoUseCase {
        return appComponent.fetchMyInfoUseCase
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


    init() {

    }
}
/// ^->AppComponent->SuccessSignUpComponent
private func factorybf219b153b668170161de3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return SuccessSignUpDependencydbc5dd5670791a0302f6Provider()
}
private class FindPasswordDependency542eacce769b9dc25904Provider: FindPasswordDependency {
    var sendEmailCertificationLinkUseCase: any SendEmailCertificationLinkUseCase {
        return appComponent.sendEmailCertificationLinkUseCase
    }
    var fetchEmailVertificationStatusUseCase: any FetchEmailVertificationStatusUseCase {
        return appComponent.fetchEmailVertificationStatusUseCase
    }
    var newPasswordFactory: any NewPasswordFactory {
        return appComponent.newPasswordFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->FindPasswordComponent
private func factory15775d8436b06b9741d1f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return FindPasswordDependency542eacce769b9dc25904Provider(appComponent: parent1(component) as! AppComponent)
}
private class AdminRequestUserSignupDependency260e3843e854d6971798Provider: AdminRequestUserSignupDependency {
    var adminUserListFactory: any AdminUserListFactory {
        return appComponent.adminUserListFactory
    }
    var adminWithdrawUserListFactory: any AdminWithdrawUserListFactory {
        return appComponent.adminWithdrawUserListFactory
    }
    var fetchUserListUseCase: any FetchUserListUseCase {
        return appComponent.fetchUserListUseCase
    }
    var approveUserSignupUseCase: any ApproveUserSignupUseCase {
        return appComponent.approveUserSignupUseCase
    }
    var rejectUserSignupUseCase: any RejectUserSignupUseCase {
        return appComponent.rejectUserSignupUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->AdminRequestUserSignupComponent
private func factory2c6c6f3f10221ceac3a8f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return AdminRequestUserSignupDependency260e3843e854d6971798Provider(appComponent: parent1(component) as! AppComponent)
}
private class LectureApplicantListDependency5bfdb7310dde792c0738Provider: LectureApplicantListDependency {
    var fetchApplicantListUseCase: any FetchApplicantListUseCase {
        return appComponent.fetchApplicantListUseCase
    }
    var modifyApplicantWhetherUseCase: any ModifyApplicantWhetherUseCase {
        return appComponent.modifyApplicantWhetherUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->LectureApplicantListComponent
private func factory78a87c10d14f7bbaaa9df47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return LectureApplicantListDependency5bfdb7310dde792c0738Provider(appComponent: parent1(component) as! AppComponent)
}
private class StudentInfoDependency5d1163a5288c79c06dffProvider: StudentInfoDependency {
    var activityListFactory: any ActivityListFactory {
        return appComponent.activityListFactory
    }
    var inputCertificationFactory: any InputCertificationFactory {
        return appComponent.inputCertificationFactory
    }
    var loadUserAuthorityUseCase: any LoadUserAuthorityUseCase {
        return appComponent.loadUserAuthorityUseCase
    }
    var queryStudentDetailByClubUseCase: any QueryStudentDetailByClubUseCase {
        return appComponent.queryStudentDetailByClubUseCase
    }
    var queryCertificationListByStudentUseCase: any QueryCertificationListByStudentUseCase {
        return appComponent.queryCertificationListByStudentUseCase
    }
    var queryCertificationListByTeacherUseCase: any QueryCertificationListByTeacherUseCase {
        return appComponent.queryCertificationListByTeacherUseCase
    }
    var fetchAppliedLectureListUseCase: any FetchAppliedLectureListUseCase {
        return appComponent.fetchAppliedLectureListUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->StudentInfoComponent
private func factory5ce0f173abbf535f654ff47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return StudentInfoDependency5d1163a5288c79c06dffProvider(appComponent: parent1(component) as! AppComponent)
}
private class AdminWithdrawUserListDependency06942465f0ac1aaeda24Provider: AdminWithdrawUserListDependency {
    var adminUserListFactory: any AdminUserListFactory {
        return appComponent.adminUserListFactory
    }
    var adminRequestUserSignupFactory: any AdminRequestUserSignupFactory {
        return appComponent.adminRequestUserSignupFactory
    }
    var fetchWithdrawUserListUseCase: any FetchWithdrawUserListUseCase {
        return appComponent.fetchWithdrawUserListUseCase
    }
    var withdrawUserUseCase: any WithdrawUserUseCase {
        return appComponent.withdrawUserUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->AdminWithdrawUserListComponent
private func factory1ef284da45544ee52e3ef47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return AdminWithdrawUserListDependency06942465f0ac1aaeda24Provider(appComponent: parent1(component) as! AppComponent)
}
private class WriteInquiryAnswerDependencyeba82c0423abdd3e1acfProvider: WriteInquiryAnswerDependency {
    var replyInquiryUseCase: any ReplyInquiryUseCase {
        return appComponent.replyInquiryUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->WriteInquiryAnswerComponent
private func factory3d4cadf14cd9a3336981f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return WriteInquiryAnswerDependencyeba82c0423abdd3e1acfProvider(appComponent: parent1(component) as! AppComponent)
}
private class PostDetailDependencycf431278832ae8226535Provider: PostDetailDependency {
    var inputPostFactory: any InputPostFactory {
        return appComponent.inputPostFactory
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
private class SuccessChangePasswordDependency05dde412f91beb4c3b8dProvider: SuccessChangePasswordDependency {
    var myPageFactory: any MyPageFactory {
        return appComponent.myPageFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->SuccessChangePasswordComponent
private func factoryde3552d9e0f793ec8b8df47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return SuccessChangePasswordDependency05dde412f91beb4c3b8dProvider(appComponent: parent1(component) as! AppComponent)
}
private class NewPasswordDependency3320cbf6e40b8cd8a8eaProvider: NewPasswordDependency {
    var findPasswordUseCase: any FindPasswordUseCase {
        return appComponent.findPasswordUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->NewPasswordComponent
private func factory52985a6d5ec65d75bd97f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return NewPasswordDependency3320cbf6e40b8cd8a8eaProvider(appComponent: parent1(component) as! AppComponent)
}
private class InquiryListDependencyec75a7335a50ded93b28Provider: InquiryListDependency {
    var inputInquiryFactory: any InputInquiryFactory {
        return appComponent.inputInquiryFactory
    }
    var inquiryDetailFactory: any InquiryDetailFactory {
        return appComponent.inquiryDetailFactory
    }
    var loadUserAuthorityUseCase: any LoadUserAuthorityUseCase {
        return appComponent.loadUserAuthorityUseCase
    }
    var fetchMyInquiryListUseCase: any FetchMyInquiryListUseCase {
        return appComponent.fetchMyInquiryListUseCase
    }
    var fetchInquiryByAdminUseCase: any FetchInquiryByAdminUseCase {
        return appComponent.fetchInquiryByAdminUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->InquiryListComponent
private func factorydd7e28250a180554c7a0f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return InquiryListDependencyec75a7335a50ded93b28Provider(appComponent: parent1(component) as! AppComponent)
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
    var fetchMyActivityUseCase: any FetchMyActivityUseCase {
        return appComponent.fetchMyActivityUseCase
    }
    var fetchActivityByIDUseCase: any FetchActivityByIDUseCase {
        return appComponent.fetchActivityByIDUseCase
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
    var findPasswordFactory: any FindPasswordFactory {
        return appComponent.findPasswordFactory
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
    var openedLectureFactory: any OpenedLectureFactory {
        return appComponent.openedLectureFactory
    }
    var loadUserAuthorityUseCase: any LoadUserAuthorityUseCase {
        return appComponent.loadUserAuthorityUseCase
    }
    var fetchLectureListUseCase: any FetchLectureListUseCase {
        return appComponent.fetchLectureListUseCase
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
    var inputActivityFactory: any InputActivityFactory {
        return appComponent.inputActivityFactory
    }
    var loadUserAuthorityUseCase: any LoadUserAuthorityUseCase {
        return appComponent.loadUserAuthorityUseCase
    }
    var fetchActivityDetailUseCase: any FetchActivityDetailUseCase {
        return appComponent.fetchActivityDetailUseCase
    }
    var deleteActivityUseCase: any DeleteActivityUseCase {
        return appComponent.deleteActivityUseCase
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
    var inputNoticeFactory: any InputNoticeFactory {
        return appComponent.inputNoticeFactory
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
/// ^->AppComponent->NoticeDetailViewComponent
private func factory0798e0f01e95aeaff56ff47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return NoticeDetailDependency3e09bbd26d7f6105e665Provider(appComponent: parent1(component) as! AppComponent)
}
private class InputInquiryDependency0f59954f6ae75e794799Provider: InputInquiryDependency {
    var inputInquiryUseCase: any InputInquiryUseCase {
        return appComponent.inputInquiryUseCase
    }
    var modifyMyInquiryUseCase: any ModifyMyInquiryUseCase {
        return appComponent.modifyMyInquiryUseCase
    }
    var fetchInquiryDetailUseCase: any FetchInquiryDetailUseCase {
        return appComponent.fetchInquiryDetailUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->InputInquiryComponent
private func factory818540ce7b5cc0ed9d3bf47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return InputInquiryDependency0f59954f6ae75e794799Provider(appComponent: parent1(component) as! AppComponent)
}
private class InputActivityDependency4e692e68e51cea5b706dProvider: InputActivityDependency {
    var activityDetailSettingFactory: any ActivityDetailSettingFactory {
        return appComponent.activityDetailSettingFactory
    }
    var fetchActivityDetailUseCase: any FetchActivityDetailUseCase {
        return appComponent.fetchActivityDetailUseCase
    }
    var inputActivityUseCase: any InputActivityUseCase {
        return appComponent.inputActivityUseCase
    }
    var modifyActivityUseCase: any ModifyActivityUseCase {
        return appComponent.modifyActivityUseCase
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
        keyPathToName[\InputPostDependency.queryPostDetailUseCase] = "queryPostDetailUseCase-any QueryPostDetailUseCase"
        keyPathToName[\InputPostDependency.updatePostUseCase] = "updatePostUseCase-any UpdatePostUseCase"
    }
}
extension InputCertificationComponent: Registration {
    public func registerItems() {
        keyPathToName[\InputCertificationDependency.inputCertificationUseCase] = "inputCertificationUseCase-any InputCertificationUseCase"
        keyPathToName[\InputCertificationDependency.updateCertificationUseCase] = "updateCertificationUseCase-any UpdateCertificationUseCase"
    }
}
extension ClubListComponent: Registration {
    public func registerItems() {
        keyPathToName[\ClubListDependency.queryClubListUseCase] = "queryClubListUseCase-any QueryClubListUseCase"
        keyPathToName[\ClubListDependency.loadUserAuthorityUseCase] = "loadUserAuthorityUseCase-any LoadUserAuthorityUseCase"
        keyPathToName[\ClubListDependency.clubDetailFactory] = "clubDetailFactory-any ClubDetailFactory"
    }
}
extension LectureListDetailComponent: Registration {
    public func registerItems() {
        keyPathToName[\LectureListDetailDependency.fetchLectureDetailUseCase] = "fetchLectureDetailUseCase-any FetchLectureDetailUseCase"
        keyPathToName[\LectureListDetailDependency.applyLectureUseCase] = "applyLectureUseCase-any ApplyLectureUseCase"
        keyPathToName[\LectureListDetailDependency.cancelLectureUseCase] = "cancelLectureUseCase-any CancelLectureUseCase"
        keyPathToName[\LectureListDetailDependency.loadUserAuthorityUseCase] = "loadUserAuthorityUseCase-any LoadUserAuthorityUseCase"
        keyPathToName[\LectureListDetailDependency.lectureApplicantListFactory] = "lectureApplicantListFactory-any LectureApplicantListFactory"
    }
}
extension AdminUserListComponent: Registration {
    public func registerItems() {
        keyPathToName[\AdminUserListDependency.adminRequestUserSignupFactory] = "adminRequestUserSignupFactory-any AdminRequestUserSignupFactory"
        keyPathToName[\AdminUserListDependency.adminWithdrawUserListFactory] = "adminWithdrawUserListFactory-any AdminWithdrawUserListFactory"
        keyPathToName[\AdminUserListDependency.fetchUserListUseCase] = "fetchUserListUseCase-any FetchUserListUseCase"
    }
}
extension NoticeListComponent: Registration {
    public func registerItems() {
        keyPathToName[\NoticeListDependency.inquiryListFactory] = "inquiryListFactory-any InquiryListFactory"
        keyPathToName[\NoticeListDependency.noticeDetailFactory] = "noticeDetailFactory-any NoticeDetailFactory"
        keyPathToName[\NoticeListDependency.inputNoticeFactory] = "inputNoticeFactory-any InputNoticeFactory"
        keyPathToName[\NoticeListDependency.queryPostListUseCase] = "queryPostListUseCase-any QueryPostListUseCase"
        keyPathToName[\NoticeListDependency.loadUserAuthorityUseCase] = "loadUserAuthorityUseCase-any LoadUserAuthorityUseCase"
    }
}
extension OpenedLectureComponent: Registration {
    public func registerItems() {
        keyPathToName[\OpenedLectureDependency.openLectureUseCase] = "openLectureUseCase-any OpenLectureUseCase"
        keyPathToName[\OpenedLectureDependency.lectureDetailSettingFactory] = "lectureDetailSettingFactory-any LectureDetailSettingFactory"
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
extension MainTabComponent: Registration {
    public func registerItems() {
        keyPathToName[\MainTabDependency.mainFactory] = "mainFactory-any MainFactory"
        keyPathToName[\MainTabDependency.lectureListFactory] = "lectureListFactory-any LectureListFactory"
        keyPathToName[\MainTabDependency.postListFactory] = "postListFactory-any PostListFactory"
        keyPathToName[\MainTabDependency.clubListFactory] = "clubListFactory-any ClubListFactory"
        keyPathToName[\MainTabDependency.myPageFactory] = "myPageFactory-any MyPageFactory"
    }
}
extension NoticeDetailSettingComponent: Registration {
    public func registerItems() {

    }
}
extension MyPageComponent: Registration {
    public func registerItems() {
        keyPathToName[\MyPageDependency.changePasswordFactory] = "changePasswordFactory-any ChangePasswordFactory"
        keyPathToName[\MyPageDependency.adminUserListFactory] = "adminUserListFactory-any AdminUserListFactory"
        keyPathToName[\MyPageDependency.loadUserAuthorityUseCase] = "loadUserAuthorityUseCase-any LoadUserAuthorityUseCase"
        keyPathToName[\MyPageDependency.fetchMyInfoUseCase] = "fetchMyInfoUseCase-any FetchMyInfoUseCase"
        keyPathToName[\MyPageDependency.logoutUseCase] = "logoutUseCase-any LogoutUseCase"
        keyPathToName[\MyPageDependency.withdrawalUseCase] = "withdrawalUseCase-any WithdrawalUseCase"
    }
}
extension InquiryDetailComponent: Registration {
    public func registerItems() {
        keyPathToName[\InquiryDetailDependency.inputInquiryFactory] = "inputInquiryFactory-any InputInquiryFactory"
        keyPathToName[\InquiryDetailDependency.writeInquiryAnswerFactory] = "writeInquiryAnswerFactory-any WriteInquiryAnswerFactory"
        keyPathToName[\InquiryDetailDependency.fetchInquiryDetailUseCase] = "fetchInquiryDetailUseCase-any FetchInquiryDetailUseCase"
        keyPathToName[\InquiryDetailDependency.loadUserAuthorityUseCase] = "loadUserAuthorityUseCase-any LoadUserAuthorityUseCase"
        keyPathToName[\InquiryDetailDependency.deleteMyInquiryUseCase] = "deleteMyInquiryUseCase-any DeleteMyInquiryUseCase"
        keyPathToName[\InquiryDetailDependency.deleteInquiryByAdminUseCase] = "deleteInquiryByAdminUseCase-any DeleteInquiryByAdminUseCase"
    }
}
extension InputNoticeComponent: Registration {
    public func registerItems() {
        keyPathToName[\InputNoticeDependency.noticeDetailSettingFactory] = "noticeDetailSettingFactory-any NoticeDetailSettingFactory"
        keyPathToName[\InputNoticeDependency.queryPostDetailUseCase] = "queryPostDetailUseCase-any QueryPostDetailUseCase"
        keyPathToName[\InputNoticeDependency.writePostUseCase] = "writePostUseCase-any WritePostUseCase"
        keyPathToName[\InputNoticeDependency.updatePostUseCase] = "updatePostUseCase-any UpdatePostUseCase"
    }
}
extension LectureDetailSettingComponent: Registration {
    public func registerItems() {
        keyPathToName[\LectureDetailSettingDependency.openedLectureFactory] = "openedLectureFactory-any OpenedLectureFactory"
        keyPathToName[\LectureDetailSettingDependency.fetchInstructorListUseCase] = "fetchInstructorListUseCase-any FetchInstructorListUseCase"
        keyPathToName[\LectureDetailSettingDependency.fetchLineListUseCase] = "fetchLineListUseCase-any FetchLineListUseCase"
        keyPathToName[\LectureDetailSettingDependency.fetchDepartmentListUseCase] = "fetchDepartmentListUseCase-any FetchDepartmentListUseCase"
        keyPathToName[\LectureDetailSettingDependency.fetchDivisionListUseCase] = "fetchDivisionListUseCase-any FetchDivisionListUseCase"
    }
}
extension MainComponent: Registration {
    public func registerItems() {
        keyPathToName[\MainDependency.fetchFAQListUseCase] = "fetchFAQListUseCase-any FetchFAQListUseCase"
        keyPathToName[\MainDependency.loadUserAuthorityUseCase] = "loadUserAuthorityUseCase-any LoadUserAuthorityUseCase"
        keyPathToName[\MainDependency.inputFAQUseCase] = "inputFAQUseCase-any InputFAQUseCase"
    }
}
extension RootComponent: Registration {
    public func registerItems() {
        keyPathToName[\RootDependency.loginFactory] = "loginFactory-any LoginFactory"
        keyPathToName[\RootDependency.mainTabFactory] = "mainTabFactory-any MainTabFactory"
        keyPathToName[\RootDependency.findPasswordFactory] = "findPasswordFactory-any FindPasswordFactory"
        keyPathToName[\RootDependency.successSignUpFactory] = "successSignUpFactory-any SuccessSignUpFactory"
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
extension ChangePasswordComponent: Registration {
    public func registerItems() {
        keyPathToName[\ChangePasswordDependency.successChangePasswordFactory] = "successChangePasswordFactory-any SuccessChangePasswordFactory"
        keyPathToName[\ChangePasswordDependency.changePasswordUseCase] = "changePasswordUseCase-any ChangePasswordUseCase"
    }
}
extension ClubDetailComponent: Registration {
    public func registerItems() {
        keyPathToName[\ClubdetailDependency.studentInfoFactory] = "studentInfoFactory-any StudentInfoFactory"
        keyPathToName[\ClubdetailDependency.loadUserAuthorityUseCase] = "loadUserAuthorityUseCase-any LoadUserAuthorityUseCase"
        keyPathToName[\ClubdetailDependency.queryClubDetailUseCase] = "queryClubDetailUseCase-any QueryClubDetailUseCase"
        keyPathToName[\ClubdetailDependency.queryStudentListByClubUseCase] = "queryStudentListByClubUseCase-any QueryStudentListByClubUseCase"
        keyPathToName[\ClubdetailDependency.fetchMyInfoUseCase] = "fetchMyInfoUseCase-any FetchMyInfoUseCase"
    }
}
extension SuccessSignUpComponent: Registration {
    public func registerItems() {

    }
}
extension FindPasswordComponent: Registration {
    public func registerItems() {
        keyPathToName[\FindPasswordDependency.sendEmailCertificationLinkUseCase] = "sendEmailCertificationLinkUseCase-any SendEmailCertificationLinkUseCase"
        keyPathToName[\FindPasswordDependency.fetchEmailVertificationStatusUseCase] = "fetchEmailVertificationStatusUseCase-any FetchEmailVertificationStatusUseCase"
        keyPathToName[\FindPasswordDependency.newPasswordFactory] = "newPasswordFactory-any NewPasswordFactory"
    }
}
extension AdminRequestUserSignupComponent: Registration {
    public func registerItems() {
        keyPathToName[\AdminRequestUserSignupDependency.adminUserListFactory] = "adminUserListFactory-any AdminUserListFactory"
        keyPathToName[\AdminRequestUserSignupDependency.adminWithdrawUserListFactory] = "adminWithdrawUserListFactory-any AdminWithdrawUserListFactory"
        keyPathToName[\AdminRequestUserSignupDependency.fetchUserListUseCase] = "fetchUserListUseCase-any FetchUserListUseCase"
        keyPathToName[\AdminRequestUserSignupDependency.approveUserSignupUseCase] = "approveUserSignupUseCase-any ApproveUserSignupUseCase"
        keyPathToName[\AdminRequestUserSignupDependency.rejectUserSignupUseCase] = "rejectUserSignupUseCase-any RejectUserSignupUseCase"
    }
}
extension LectureApplicantListComponent: Registration {
    public func registerItems() {
        keyPathToName[\LectureApplicantListDependency.fetchApplicantListUseCase] = "fetchApplicantListUseCase-any FetchApplicantListUseCase"
        keyPathToName[\LectureApplicantListDependency.modifyApplicantWhetherUseCase] = "modifyApplicantWhetherUseCase-any ModifyApplicantWhetherUseCase"
    }
}
extension StudentInfoComponent: Registration {
    public func registerItems() {
        keyPathToName[\StudentInfoDependency.activityListFactory] = "activityListFactory-any ActivityListFactory"
        keyPathToName[\StudentInfoDependency.inputCertificationFactory] = "inputCertificationFactory-any InputCertificationFactory"
        keyPathToName[\StudentInfoDependency.loadUserAuthorityUseCase] = "loadUserAuthorityUseCase-any LoadUserAuthorityUseCase"
        keyPathToName[\StudentInfoDependency.queryStudentDetailByClubUseCase] = "queryStudentDetailByClubUseCase-any QueryStudentDetailByClubUseCase"
        keyPathToName[\StudentInfoDependency.queryCertificationListByStudentUseCase] = "queryCertificationListByStudentUseCase-any QueryCertificationListByStudentUseCase"
        keyPathToName[\StudentInfoDependency.queryCertificationListByTeacherUseCase] = "queryCertificationListByTeacherUseCase-any QueryCertificationListByTeacherUseCase"
        keyPathToName[\StudentInfoDependency.fetchAppliedLectureListUseCase] = "fetchAppliedLectureListUseCase-any FetchAppliedLectureListUseCase"
    }
}
extension AdminWithdrawUserListComponent: Registration {
    public func registerItems() {
        keyPathToName[\AdminWithdrawUserListDependency.adminUserListFactory] = "adminUserListFactory-any AdminUserListFactory"
        keyPathToName[\AdminWithdrawUserListDependency.adminRequestUserSignupFactory] = "adminRequestUserSignupFactory-any AdminRequestUserSignupFactory"
        keyPathToName[\AdminWithdrawUserListDependency.fetchWithdrawUserListUseCase] = "fetchWithdrawUserListUseCase-any FetchWithdrawUserListUseCase"
        keyPathToName[\AdminWithdrawUserListDependency.withdrawUserUseCase] = "withdrawUserUseCase-any WithdrawUserUseCase"
    }
}
extension WriteInquiryAnswerComponent: Registration {
    public func registerItems() {
        keyPathToName[\WriteInquiryAnswerDependency.replyInquiryUseCase] = "replyInquiryUseCase-any ReplyInquiryUseCase"
    }
}
extension PostDetailComponent: Registration {
    public func registerItems() {
        keyPathToName[\PostDetailDependency.inputPostFactory] = "inputPostFactory-any InputPostFactory"
        keyPathToName[\PostDetailDependency.queryPostDetailUseCase] = "queryPostDetailUseCase-any QueryPostDetailUseCase"
        keyPathToName[\PostDetailDependency.deletePostUseCase] = "deletePostUseCase-any DeletePostUseCase"
    }
}
extension SuccessChangePasswordComponent: Registration {
    public func registerItems() {
        keyPathToName[\SuccessChangePasswordDependency.myPageFactory] = "myPageFactory-any MyPageFactory"
    }
}
extension NewPasswordComponent: Registration {
    public func registerItems() {
        keyPathToName[\NewPasswordDependency.findPasswordUseCase] = "findPasswordUseCase-any FindPasswordUseCase"
    }
}
extension InquiryListComponent: Registration {
    public func registerItems() {
        keyPathToName[\InquiryListDependency.inputInquiryFactory] = "inputInquiryFactory-any InputInquiryFactory"
        keyPathToName[\InquiryListDependency.inquiryDetailFactory] = "inquiryDetailFactory-any InquiryDetailFactory"
        keyPathToName[\InquiryListDependency.loadUserAuthorityUseCase] = "loadUserAuthorityUseCase-any LoadUserAuthorityUseCase"
        keyPathToName[\InquiryListDependency.fetchMyInquiryListUseCase] = "fetchMyInquiryListUseCase-any FetchMyInquiryListUseCase"
        keyPathToName[\InquiryListDependency.fetchInquiryByAdminUseCase] = "fetchInquiryByAdminUseCase-any FetchInquiryByAdminUseCase"
    }
}
extension ActivityListComponent: Registration {
    public func registerItems() {
        keyPathToName[\ActivityListDependency.activityDetailFactory] = "activityDetailFactory-any ActivityDetailFactory"
        keyPathToName[\ActivityListDependency.inputActivityFactory] = "inputActivityFactory-any InputActivityFactory"
        keyPathToName[\ActivityListDependency.loadUserAuthorityUseCase] = "loadUserAuthorityUseCase-any LoadUserAuthorityUseCase"
        keyPathToName[\ActivityListDependency.fetchMyActivityUseCase] = "fetchMyActivityUseCase-any FetchMyActivityUseCase"
        keyPathToName[\ActivityListDependency.fetchActivityByIDUseCase] = "fetchActivityByIDUseCase-any FetchActivityByIDUseCase"
    }
}
extension LoginComponent: Registration {
    public func registerItems() {
        keyPathToName[\LoginDependency.loginUseCase] = "loginUseCase-any LoginUseCase"
        keyPathToName[\LoginDependency.signupFactory] = "signupFactory-any SignUpFactory"
        keyPathToName[\LoginDependency.saveUserAuthorityUseCase] = "saveUserAuthorityUseCase-any SaveUserAuthorityUseCase"
        keyPathToName[\LoginDependency.findPasswordFactory] = "findPasswordFactory-any FindPasswordFactory"
    }
}
extension LectureListComponent: Registration {
    public func registerItems() {
        keyPathToName[\LectureListDependency.lectureListDetailFactory] = "lectureListDetailFactory-any LectureListDetailFactory"
        keyPathToName[\LectureListDependency.openedLectureFactory] = "openedLectureFactory-any OpenedLectureFactory"
        keyPathToName[\LectureListDependency.loadUserAuthorityUseCase] = "loadUserAuthorityUseCase-any LoadUserAuthorityUseCase"
        keyPathToName[\LectureListDependency.fetchLectureListUseCase] = "fetchLectureListUseCase-any FetchLectureListUseCase"
    }
}
extension PostDetailSettingComponent: Registration {
    public func registerItems() {

    }
}
extension ActivityDetailComponent: Registration {
    public func registerItems() {
        keyPathToName[\ActivityDetailDependency.inputActivityFactory] = "inputActivityFactory-any InputActivityFactory"
        keyPathToName[\ActivityDetailDependency.loadUserAuthorityUseCase] = "loadUserAuthorityUseCase-any LoadUserAuthorityUseCase"
        keyPathToName[\ActivityDetailDependency.fetchActivityDetailUseCase] = "fetchActivityDetailUseCase-any FetchActivityDetailUseCase"
        keyPathToName[\ActivityDetailDependency.deleteActivityUseCase] = "deleteActivityUseCase-any DeleteActivityUseCase"
    }
}
extension NoticeDetailViewComponent: Registration {
    public func registerItems() {
        keyPathToName[\NoticeDetailDependency.inputNoticeFactory] = "inputNoticeFactory-any InputNoticeFactory"
        keyPathToName[\NoticeDetailDependency.queryPostDetailUseCase] = "queryPostDetailUseCase-any QueryPostDetailUseCase"
        keyPathToName[\NoticeDetailDependency.deletePostUseCase] = "deletePostUseCase-any DeletePostUseCase"
    }
}
extension InputInquiryComponent: Registration {
    public func registerItems() {
        keyPathToName[\InputInquiryDependency.inputInquiryUseCase] = "inputInquiryUseCase-any InputInquiryUseCase"
        keyPathToName[\InputInquiryDependency.modifyMyInquiryUseCase] = "modifyMyInquiryUseCase-any ModifyMyInquiryUseCase"
        keyPathToName[\InputInquiryDependency.fetchInquiryDetailUseCase] = "fetchInquiryDetailUseCase-any FetchInquiryDetailUseCase"
    }
}
extension InputActivityComponent: Registration {
    public func registerItems() {
        keyPathToName[\InputActivityDependency.activityDetailSettingFactory] = "activityDetailSettingFactory-any ActivityDetailSettingFactory"
        keyPathToName[\InputActivityDependency.fetchActivityDetailUseCase] = "fetchActivityDetailUseCase-any FetchActivityDetailUseCase"
        keyPathToName[\InputActivityDependency.inputActivityUseCase] = "inputActivityUseCase-any InputActivityUseCase"
        keyPathToName[\InputActivityDependency.modifyActivityUseCase] = "modifyActivityUseCase-any ModifyActivityUseCase"
    }
}
extension AppComponent: Registration {
    public func registerItems() {

        localTable["keychain-Keychain"] = { [unowned self] in self.keychain as Any }
        localTable["remoteLectureDataSource-any RemoteLectureDataSource"] = { [unowned self] in self.remoteLectureDataSource as Any }
        localTable["lectureRepository-any LectureRepository"] = { [unowned self] in self.lectureRepository as Any }
        localTable["openLectureUseCase-any OpenLectureUseCase"] = { [unowned self] in self.openLectureUseCase as Any }
        localTable["fetchLectureListUseCase-any FetchLectureListUseCase"] = { [unowned self] in self.fetchLectureListUseCase as Any }
        localTable["fetchLectureDetailUseCase-any FetchLectureDetailUseCase"] = { [unowned self] in self.fetchLectureDetailUseCase as Any }
        localTable["applyLectureUseCase-any ApplyLectureUseCase"] = { [unowned self] in self.applyLectureUseCase as Any }
        localTable["cancelLectureUseCase-any CancelLectureUseCase"] = { [unowned self] in self.cancelLectureUseCase as Any }
        localTable["fetchInstructorListUseCase-any FetchInstructorListUseCase"] = { [unowned self] in self.fetchInstructorListUseCase as Any }
        localTable["fetchLineListUseCase-any FetchLineListUseCase"] = { [unowned self] in self.fetchLineListUseCase as Any }
        localTable["fetchDepartmentListUseCase-any FetchDepartmentListUseCase"] = { [unowned self] in self.fetchDepartmentListUseCase as Any }
        localTable["fetchDivisionListUseCase-any FetchDivisionListUseCase"] = { [unowned self] in self.fetchDivisionListUseCase as Any }
        localTable["fetchAppliedLectureListUseCase-any FetchAppliedLectureListUseCase"] = { [unowned self] in self.fetchAppliedLectureListUseCase as Any }
        localTable["fetchApplicantListUseCase-any FetchApplicantListUseCase"] = { [unowned self] in self.fetchApplicantListUseCase as Any }
        localTable["modifyApplicantWhetherUseCase-any ModifyApplicantWhetherUseCase"] = { [unowned self] in self.modifyApplicantWhetherUseCase as Any }
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
        localTable["remoteInquiryDataSource-RemoteInquiryDataSource"] = { [unowned self] in self.remoteInquiryDataSource as Any }
        localTable["inquiryRepository-InquiryRepository"] = { [unowned self] in self.inquiryRepository as Any }
        localTable["inputInquiryUseCase-any InputInquiryUseCase"] = { [unowned self] in self.inputInquiryUseCase as Any }
        localTable["fetchMyInquiryListUseCase-any FetchMyInquiryListUseCase"] = { [unowned self] in self.fetchMyInquiryListUseCase as Any }
        localTable["fetchInquiryDetailUseCase-any FetchInquiryDetailUseCase"] = { [unowned self] in self.fetchInquiryDetailUseCase as Any }
        localTable["deleteMyInquiryUseCase-any DeleteMyInquiryUseCase"] = { [unowned self] in self.deleteMyInquiryUseCase as Any }
        localTable["modifyMyInquiryUseCase-any ModifyMyInquiryUseCase"] = { [unowned self] in self.modifyMyInquiryUseCase as Any }
        localTable["replyInquiryUseCase-any ReplyInquiryUseCase"] = { [unowned self] in self.replyInquiryUseCase as Any }
        localTable["fetchInquiryByAdminUseCase-any FetchInquiryByAdminUseCase"] = { [unowned self] in self.fetchInquiryByAdminUseCase as Any }
        localTable["deleteInquiryByAdminUseCase-any DeleteInquiryByAdminUseCase"] = { [unowned self] in self.deleteInquiryByAdminUseCase as Any }
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
        localTable["findPasswordUseCase-any FindPasswordUseCase"] = { [unowned self] in self.findPasswordUseCase as Any }
        localTable["remoteActivityDataSource-any RemoteActivityDataSource"] = { [unowned self] in self.remoteActivityDataSource as Any }
        localTable["activityRepository-any ActivityRepository"] = { [unowned self] in self.activityRepository as Any }
        localTable["inputActivityUseCase-any InputActivityUseCase"] = { [unowned self] in self.inputActivityUseCase as Any }
        localTable["modifyActivityUseCase-any ModifyActivityUseCase"] = { [unowned self] in self.modifyActivityUseCase as Any }
        localTable["deleteActivityUseCase-any DeleteActivityUseCase"] = { [unowned self] in self.deleteActivityUseCase as Any }
        localTable["fetchMyActivityUseCase-any FetchMyActivityUseCase"] = { [unowned self] in self.fetchMyActivityUseCase as Any }
        localTable["fetchActivityByIDUseCase-any FetchActivityByIDUseCase"] = { [unowned self] in self.fetchActivityByIDUseCase as Any }
        localTable["fetchActivityListUseCase-any FetchActivityListUseCase"] = { [unowned self] in self.fetchActivityListUseCase as Any }
        localTable["fetchActivityDetailUseCase-any FetchActivityDetailUseCase"] = { [unowned self] in self.fetchActivityDetailUseCase as Any }
        localTable["remoteAdminDataSource-any RemoteAdminDataSource"] = { [unowned self] in self.remoteAdminDataSource as Any }
        localTable["adminRepository-any AdminRepository"] = { [unowned self] in self.adminRepository as Any }
        localTable["fetchUserListUseCase-any FetchUserListUseCase"] = { [unowned self] in self.fetchUserListUseCase as Any }
        localTable["fetchUserDetailUseCase-any FetchUserDetailUseCase"] = { [unowned self] in self.fetchUserDetailUseCase as Any }
        localTable["approveUserSignupUseCase-any ApproveUserSignupUseCase"] = { [unowned self] in self.approveUserSignupUseCase as Any }
        localTable["rejectUserSignupUseCase-any RejectUserSignupUseCase"] = { [unowned self] in self.rejectUserSignupUseCase as Any }
        localTable["withdrawUserUseCase-any WithdrawUserUseCase"] = { [unowned self] in self.withdrawUserUseCase as Any }
        localTable["remoteUserDataSource-any RemoteUserDataSource"] = { [unowned self] in self.remoteUserDataSource as Any }
        localTable["userRepository-any UserRepository"] = { [unowned self] in self.userRepository as Any }
        localTable["changePasswordUseCase-any ChangePasswordUseCase"] = { [unowned self] in self.changePasswordUseCase as Any }
        localTable["fetchMyInfoUseCase-any FetchMyInfoUseCase"] = { [unowned self] in self.fetchMyInfoUseCase as Any }
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
        localTable["openedLectureFactory-any OpenedLectureFactory"] = { [unowned self] in self.openedLectureFactory as Any }
        localTable["lectureDetailSettingFactory-any LectureDetailSettingFactory"] = { [unowned self] in self.lectureDetailSettingFactory as Any }
        localTable["postListFactory-any PostListFactory"] = { [unowned self] in self.postListFactory as Any }
        localTable["postDetailSettingFactory-any PostDetailSettingFactory"] = { [unowned self] in self.postDetailSettingFactory as Any }
        localTable["inputPostFactory-any InputPostFactory"] = { [unowned self] in self.inputPostFactory as Any }
        localTable["postDetailFactory-any PostDetailFactory"] = { [unowned self] in self.postDetailFactory as Any }
        localTable["noticeListFactory-any NoticeListFactory"] = { [unowned self] in self.noticeListFactory as Any }
        localTable["inquiryListFactory-any InquiryListFactory"] = { [unowned self] in self.inquiryListFactory as Any }
        localTable["noticeDetailFactory-any NoticeDetailFactory"] = { [unowned self] in self.noticeDetailFactory as Any }
        localTable["studentInfoFactory-any StudentInfoFactory"] = { [unowned self] in self.studentInfoFactory as Any }
        localTable["inputCertificationFactory-any InputCertificationFactory"] = { [unowned self] in self.inputCertificationFactory as Any }
        localTable["mainFactory-any MainFactory"] = { [unowned self] in self.mainFactory as Any }
        localTable["myPageFactory-any MyPageFactory"] = { [unowned self] in self.myPageFactory as Any }
        localTable["mainTabFactory-any MainTabFactory"] = { [unowned self] in self.mainTabFactory as Any }
        localTable["inputNoticeFactory-any InputNoticeFactory"] = { [unowned self] in self.inputNoticeFactory as Any }
        localTable["noticeDetailSettingFactory-any NoticeDetailSettingFactory"] = { [unowned self] in self.noticeDetailSettingFactory as Any }
        localTable["inputInquiryFactory-any InputInquiryFactory"] = { [unowned self] in self.inputInquiryFactory as Any }
        localTable["inquiryDetailFactory-any InquiryDetailFactory"] = { [unowned self] in self.inquiryDetailFactory as Any }
        localTable["writeInquiryAnswerFactory-any WriteInquiryAnswerFactory"] = { [unowned self] in self.writeInquiryAnswerFactory as Any }
        localTable["changePasswordFactory-any ChangePasswordFactory"] = { [unowned self] in self.changePasswordFactory as Any }
        localTable["successChangePasswordFactory-any SuccessChangePasswordFactory"] = { [unowned self] in self.successChangePasswordFactory as Any }
        localTable["adminUserListFactory-any AdminUserListFactory"] = { [unowned self] in self.adminUserListFactory as Any }
        localTable["adminRequestUserSignupFactory-any AdminRequestUserSignupFactory"] = { [unowned self] in self.adminRequestUserSignupFactory as Any }
        localTable["adminWithdrawUserListFactory-any AdminWithdrawUserListFactory"] = { [unowned self] in self.adminWithdrawUserListFactory as Any }
        localTable["findPasswordFactory-any FindPasswordFactory"] = { [unowned self] in self.findPasswordFactory as Any }
        localTable["newPasswordFactory-any NewPasswordFactory"] = { [unowned self] in self.newPasswordFactory as Any }
        localTable["lectureApplicantListFactory-any LectureApplicantListFactory"] = { [unowned self] in self.lectureApplicantListFactory as Any }
        localTable["remoteWithdrawDataSource-any RemoteWithdrawDataSource"] = { [unowned self] in self.remoteWithdrawDataSource as Any }
        localTable["withdrawRepository-any WithdrawRepository"] = { [unowned self] in self.withdrawRepository as Any }
        localTable["fetchWithdrawUserListUseCase-any FetchWithdrawUserListUseCase"] = { [unowned self] in self.fetchWithdrawUserListUseCase as Any }
        localTable["remoteEmailDataSource-any RemoteEmailDataSource"] = { [unowned self] in self.remoteEmailDataSource as Any }
        localTable["emailRepository-any EmailRepository"] = { [unowned self] in self.emailRepository as Any }
        localTable["sendEmailCertificationLinkUseCase-any SendEmailCertificationLinkUseCase"] = { [unowned self] in self.sendEmailCertificationLinkUseCase as Any }
        localTable["fetchEmailVertificationStatusUseCase-any FetchEmailVertificationStatusUseCase"] = { [unowned self] in self.fetchEmailVertificationStatusUseCase as Any }
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
    registerProviderFactory("^->AppComponent->InputCertificationComponent", factory2810b45b31199a5f0c2af47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->ClubListComponent", factory050817f1b6d356b83467f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->LectureListDetailComponent", factory22af859a70aa8ba0b346f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->AdminUserListComponent", factory55b3a27a2b6be9af9ba4f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->NoticeListComponent", factorye14e687c08985bdffcd0f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->OpenedLectureComponent", factory6636d97d1a9f0c8216d2f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->SignUpComponent", factory306e8ce5cfdf41304709f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->ActivityDetailSettingComponent", factoryfd595280dea209e217b9e3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->MainTabComponent", factory1ab5a747ddf21e1393f9f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->NoticeDetailSettingComponent", factory24d19202afbef2333be9e3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->MyPageComponent", factory0f6f456ebf157d02dfb3f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->InquiryDetailComponent", factory2d6736bd037393a86ae3f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->InputNoticeComponent", factory4545df5fcd42aaf8ed60f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->LectureDetailSettingComponent", factoryd0ffb7dfc6fd9633e0e6f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->MainComponent", factoryc9274e46e78e70f29c54f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->RootComponent", factory264bfc4d4cb6b0629b40f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->PostListComponent", factory0c89e2bbcc02dbcac018f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->ChangePasswordComponent", factoryab7c4d87dab53e0a51b9f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->ClubDetailComponent", factory1559652f8e80cfa88d06f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->SuccessSignUpComponent", factorybf219b153b668170161de3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->FindPasswordComponent", factory15775d8436b06b9741d1f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->AdminRequestUserSignupComponent", factory2c6c6f3f10221ceac3a8f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->LectureApplicantListComponent", factory78a87c10d14f7bbaaa9df47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->StudentInfoComponent", factory5ce0f173abbf535f654ff47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->AdminWithdrawUserListComponent", factory1ef284da45544ee52e3ef47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->WriteInquiryAnswerComponent", factory3d4cadf14cd9a3336981f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->PostDetailComponent", factorybc555a73df3767a26999f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->SuccessChangePasswordComponent", factoryde3552d9e0f793ec8b8df47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->NewPasswordComponent", factory52985a6d5ec65d75bd97f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->InquiryListComponent", factorydd7e28250a180554c7a0f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->ActivityListComponent", factory7177e6769ee69064a61bf47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->LoginComponent", factoryd6018e98563de75a2ba4f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->LectureListComponent", factorya2eac906a839dcacda45f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->PostDetailSettingComponent", factoryaacb19523586bb790cade3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->ActivityDetailComponent", factory7c395808ac9dfb8fb229f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->NoticeDetailViewComponent", factory0798e0f01e95aeaff56ff47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->InputInquiryComponent", factory818540ce7b5cc0ed9d3bf47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->InputActivityComponent", factory3fc1a279eeb8c906e603f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent", factoryEmptyDependencyProvider)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}

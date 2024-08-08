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

    var signupFactory: any SignUpFactory {
        SignUpComponent(parent: self)
    }

    var successSignUpFactory: any SuccessSignUpFactory {
        SuccessSignUpComponent(parent: self)
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

    var inputLectureFactory: any InputLectureFactory {
        InputLectureComponent(parent: self)
    }

    var lectureDetailSettingFactory: any LectureDetailSettingFactory {
        LectureDetailSettingComponent(parent: self)
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

    var noticeDetailFactory: any NoticeDetailFactory {
        NoticeDetailViewComponent(parent: self)
    }

    var studentInfoFactory: any StudentInfoFactory {
        StudentInfoComponent(parent: self)
    }

    var inputCertificationFactory: any InputCertificationFactory {
        InputCertificationComponent(parent: self)
    }

    var mainFactory: any MainFactory {
        MainComponent(parent: self)
    }

    var myPageFactory: any MyPageFactory {
        MyPageComponent(parent: self)
    }

    var mainTabFactory: any MainTabFactory {
        MainTabComponent(parent: self)
    }

    var inputNoticeFactory: any InputNoticeFactory {
        InputNoticeComponent(parent: self)
    }

    var noticeDetailSettingFactory: any NoticeDetailSettingFactory {
        NoticeDetailSettingComponent(parent: self)
    }

    var inputInquiryFactory: any InputInquiryFactory {
        InputInquiryComponent(parent: self)
    }

    var inquiryDetailFactory: any InquiryDetailFactory {
        InquiryDetailComponent(parent: self)
    }

    var writeInquiryAnswerFactory: any WriteInquiryAnswerFactory {
        WriteInquiryAnswerComponent(parent: self)
    }

    var changePasswordFactory: any ChangePasswordFactory {
        ChangePasswordComponent(parent: self)
    }

    var successChangePasswordFactory: any SuccessChangePasswordFactory {
        SuccessChangePasswordComponent(parent: self)
    }

    var userListFactory: any UserListFactory {
        UserListComponent(parent: self)
    }

    var requestUserSignupFactory: any RequestUserSignupFactory {
        RequestUserSignupComponent(parent: self)
    }

    var withdrawUserListFactory: any WithdrawUserListFactory {
        WithdrawUserListComponent(parent: self)
    }

    var findPasswordFactory: any FindPasswordFactory {
        FindPasswordComponent(parent: self)
    }

    var newPasswordFactory: any NewPasswordFactory {
        NewPasswordComponent(parent: self)
    }

    var lectureApplicantListFactory: any LectureApplicantListFactory {
        LectureApplicantListComponent(parent: self)
    }

    var adminRootFactory: any AdminRootFactory {
        AdminRootComponent(parent: self)
    }

    var schoolListFactory: any SchoolListFactory {
        SchoolListComponent(parent: self)
    }

    var organizationListFactory: any OrganizationListFactory {
        OrganizationListComponent(parent: self)
    }

    var universityListFactory: any UniversityListFactory {
        UniversityListComponent(parent: self)
    }

    var inputOrganizationFactory: any InputOrganizationFactory {
        InputOrganizationComponent(parent: self)
    }

    var inputUniversityFactory: any InputUniversityFactory {
        InputUniversityComponent(parent: self)
    }

    var inputSchoolFactory: any InputSchoolFactory {
        InputSchoolComponent(parent: self)
    }

    var inputClubFactory: any InputClubFactory {
        InputClubComponent(parent: self)
    }
}

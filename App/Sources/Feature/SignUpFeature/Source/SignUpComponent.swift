import NeedleFoundation
import Service
import SwiftUI

public protocol SignUpDependency: Dependency {
    var studentSignupUseCase: any StudentSignupUseCase { get }
    var teacherSignupUseCase: any TeacherSignupUseCase { get }
    var bbozzakSignupUseCase: any BbozzakSignupUseCase { get }
    var professorSignupUseCase: any ProfessorSignupUseCase { get }
    var governmentSignupUseCase: any GovernmentSignupUseCase { get }
    var companyInstructorSignupUseCase: any CompanyInstructorSignupUseCase { get }
    var successSignUpFactory: any SuccessSignUpFactory { get }
    var fetchAllSchoolNameUseCase: any FetchAllSchoolNameUseCase { get }
    var fetchAllClubNameUseCase: any FetchAllClubNameUseCase { get }
    var fetchCompanyListUseCase: any FetchCompanyListUseCase { get }
    var fetchUniversityListUseCase: any FetchUniversityListUseCase { get }
    var fetchGovernmentListUseCase: any FetchGovernmentListUseCase { get }
}

public final class SignUpComponent: Component<SignUpDependency>, SignUpFactory {
    public func makeView() -> some View {
        SignUpView(
            viewModel: .init(
                studentSignupUseCase: self.dependency.studentSignupUseCase,
                teacherSignupUseCase: self.dependency.teacherSignupUseCase,
                bbozzakSignupUseCase: self.dependency.bbozzakSignupUseCase,
                professorSignupUseCase: self.dependency.professorSignupUseCase,
                governmentSignupUseCase: self.dependency.governmentSignupUseCase,
                companyInstructorSignupUseCase: self.dependency.companyInstructorSignupUseCase,
                fetchAllSchoolNameUseCase: dependency.fetchAllSchoolNameUseCase,
                fetchAllClubNameUseCase: dependency.fetchAllClubNameUseCase,
                fetchCompanyListUseCase: dependency.fetchCompanyListUseCase,
                fetchUniversityListUseCase: dependency.fetchUniversityListUseCase,
                fetchGovernmentListUseCase: dependency.fetchGovernmentListUseCase
            ),
            successSignUpFactory: self.dependency.successSignUpFactory
        )
    }
}

import NeedleFoundation
import Service
import SwiftUI

public protocol StudentSignUpDependency: Dependency {
    var studentSignupUseCase: any StudentSignupUseCase { get }
    var teacherSignupUseCase: any TeacherSignupUseCase { get }
    var bbozzakSignupUseCase: any BbozzakSignupUseCase { get }
    var professorSignupUseCase: any ProfessorSignupUseCase { get }
    var governmentSignupUseCase: any GovernmentSignupUseCase { get }
    var companyInstructorSignupUseCase: any CompanyInstructorSignupUseCase { get }
}

public final class StudentSignUpComponent: Component<StudentSignUpDependency>, StudentSignUpFactory {
    public func makeView() -> some View {
        StudentSignUpView(
            viewModel: .init(
                studentSignupUseCase: self.dependency.studentSignupUseCase,
                teacherSignupUseCase: self.dependency.teacherSignupUseCase,
                bbozzakSignupUseCase: self.dependency.bbozzakSignupUseCase,
                professorSignupUseCase: self.dependency.professorSignupUseCase,
                governmentSignupUseCase: self.dependency.governmentSignupUseCase,
                companyInstructorSignupUseCase: self.dependency.companyInstructorSignupUseCase
            ),
            commonViewModel: CommonSignUpViewModel()
        )
    }
}

import Foundation

public struct StudentsEntity: Equatable {
    public let students: [SingleStudentEntity]

    public init(students: [SingleStudentEntity]) {
        self.students = students
    }
}

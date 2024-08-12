import Foundation

struct UserInfoModel {
    var email: String
    var name: String
    var phoneNumber: String
    var password: String
    var highschool: String
    var clubName: String

    init(
        email: String,
        name: String,
        phoneNumber: String,
        password: String,
        highschool: String,
        clubName: String
    ) {
        self.email = email
        self.name = name
        self.phoneNumber = phoneNumber
        self.password = password
        self.highschool = highschool
        self.clubName = clubName
    }
}

struct StudentInfoModel {
    var grade: Int
    var classRoom: Int
    var number: Int

    init(
        grade: Int,
        classRoom: Int,
        number: Int
    ) {
        self.grade = grade
        self.classRoom = classRoom
        self.number = number
    }
}

struct GovernmentInfoModel {
    var name: String
    var position: String
    var sectors: String

    init(
        name: String,
        position: String,
        sectors: String
    ) {
        self.name = name
        self.position = position
        self.sectors = sectors
    }
}

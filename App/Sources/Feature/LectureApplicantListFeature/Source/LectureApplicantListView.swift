import SwiftUI

struct LectureApplicantListView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("강의 이수 여부")
                .bitgouelFont(.text3, color: .greyscale(.g4))
                .padding(.top, 8)

            ScrollView {
                LazyVStack(alignment: .leading, spacing: 12) {
                    ForEach(1..<4, id: \.self) { id in
                        LectureApplicantListRow(
                            studentID: "\(id)",
                            email: "hey@gmail.com",
                            name: "딩가딩가",
                            grade: 1,
                            classNumber: 2,
                            number: 12,
                            cohort: 5,
                            phoneNumber: "010-1234-5678",
                            schoolName: "딩가딩가학교",
                            clubName: "딩가딩가딩") { checkStudentID in
                                print(checkStudentID)
                            }

                        Divider()
                    }
                }
            }
            .padding(.top, 24)

            Spacer()
        }
        .padding(.horizontal, 28)
        .navigationTitle("강의 신청자 명단")
    }
}

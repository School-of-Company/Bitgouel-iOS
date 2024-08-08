import SwiftUI
import Service

struct ApplicantStudentDetailBottomSheet: View {
    let studentInfo: AppliedLectureStudentDetailEntity?
    let cancel: (Bool) -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            if let studentInfo = studentInfo {
                HStack {
                    BitgouelText(
                        text: "학생 상세",
                        font: .title3
                    )

                    Spacer()
                    
                    Button {
                        cancel(false)
                    } label: {
                        BitgouelAsset.Icons.cancel.swiftUIImage
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(.bitgouel(.greyscale(.g7)))
                            .frame(width: 24, height: 24)
                    }
                }
                .padding(.vertical, 8)

                VStack(alignment: .leading, spacing: 24) {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("이름")
                            .bitgouelFont(.caption, color: .greyscale(.g4))
                        
                        BitgouelText(
                            text: studentInfo.name,
                            font: .text1
                        )
                    }
                    
                    infoForm(title: "학교", text: studentInfo.school)
                    
                    infoForm(
                        title: "학번 | 기수",
                        text: "\(studentInfo.grade)학년 \(studentInfo.classNumber)반 \(studentInfo.number)번 | \(studentInfo.cohort)기"
                    )
                    
                    infoForm(title: "이메일", text: studentInfo.email)
                    
                    infoForm(title: "전화번호", text: studentInfo.phoneNumber.withHypen)
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text("강의 이수 여부")
                            .bitgouelFont(.caption, color: .greyscale(.g4))
                        
                        completionStatusRow()
                    }
                }
                .padding(.vertical, 8)
            }

            Spacer()
        }
        .padding(.horizontal, 28)
        .frame(height: 500)
    }
    
    @ViewBuilder
    func infoForm(
        title: String,
        text: String
    ) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .bitgouelFont(.caption, color: .greyscale(.g4))
            
            BitgouelText(
                text: text,
                font: .text3
            )
        }
    }
    
    @ViewBuilder
    func completionStatusRow() -> some View {
        if let completeStatus = studentInfo?.completeStatus {
            switch completeStatus {
            case .notCompletedYet:
                completionStatusText(state: "이수 미완료", grade: 0)
                
            case .completedIn3RD:
                completionStatusText(state: "이수완료", grade: 3)
                
            case .completedIn2RD:
                completionStatusText(state: "이수완료", grade: 2)
                
            case .completedIn1RD:
                completionStatusText(state: "이수완료", grade: 1)
            }
        }
    }
    
    @ViewBuilder
    func completionStatusText(
        state: String,
        grade: Int
    ) -> some View {
        HStack(spacing: 4) {
            Text(state)
                .bitgouelFont(.text3, color: .primary(.p5))
            
            if let date = studentInfo?.currentCompletedDate {
                HStack(spacing: 0) {
                    BitgouelText(text: date.toStringCustomFormat(format: "yyyy년 M월 d일"), font: .caption)
                    
                    if state == "이수완료" {
                        BitgouelText(text: "(\(grade)학년)", font: .caption)
                    }
                }
            }
        }
    }
}

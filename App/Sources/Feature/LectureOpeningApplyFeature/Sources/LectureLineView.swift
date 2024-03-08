import SwiftUI

struct LectureLineView: View {
    @StateObject var viewModel: LectureOpeningApplyViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(spacing: 16) {
                Text("전기•전자")
                    .bitgouelFont(.text2, color: viewModel.lectureLineText1)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .overlay {
                        RoundedRectangle(cornerRadius: 99)
                            .stroke(viewModel.lectureLineStroke1)
                    }
                    .background(viewModel.lectureLineBackground1)
                    .cornerRadius(99)
                    .buttonWrapper {
                        viewModel.electricity.toggle()
                    }
                
                Text("기계")
                    .bitgouelFont(.text2, color: viewModel.lectureLineText2)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .overlay {
                        RoundedRectangle(cornerRadius: 99)
                            .stroke(viewModel.lectureLineStroke2)
                    }
                    .background(viewModel.lectureLineBackground2)
                    .cornerRadius(99)
                    .buttonWrapper {
                        viewModel.machine.toggle()
                    }
                
                Text("자동차")
                    .bitgouelFont(.text2, color: viewModel.lectureLineText3)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .overlay {
                        RoundedRectangle(cornerRadius: 99)
                            .stroke(viewModel.lectureLineStroke3)
                    }
                    .background(viewModel.lectureLineBackground3)
                    .cornerRadius(99)
                    .buttonWrapper {
                        viewModel.automobile.toggle()
                    }
            }
            
            HStack(spacing: 16) {
                Text("생명화학공학")
                    .bitgouelFont(.text2, color: viewModel.lectureLineText4)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .overlay {
                        RoundedRectangle(cornerRadius: 99)
                            .stroke(viewModel.lectureLineStroke4)
                    }
                    .background(viewModel.lectureLineBackground4)
                    .cornerRadius(99)
                    .buttonWrapper {
                        viewModel.biochemicalEngineering.toggle()
                    }
                
                Text("뷰티")
                    .bitgouelFont(.text2, color: viewModel.lectureLineText5)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .overlay {
                        RoundedRectangle(cornerRadius: 99)
                            .stroke(viewModel.lectureLineStroke5)
                    }
                    .background(viewModel.lectureLineBackground5)
                    .cornerRadius(99)
                    .buttonWrapper {
                        viewModel.beauty.toggle()
                    }
            }
            
            HStack(spacing: 16) {
                Text("의료•헬스")
                    .bitgouelFont(.text2, color: viewModel.lectureLineText6)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .overlay {
                        RoundedRectangle(cornerRadius: 99)
                            .stroke(viewModel.lectureLineStroke6)
                    }
                    .background(viewModel.lectureLineBackground6)
                    .cornerRadius(99)
                    .buttonWrapper {
                        viewModel.medicalHealth.toggle()
                    }
                
                Text("드론")
                    .bitgouelFont(.text2, color: viewModel.lectureLineText7)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .overlay {
                        RoundedRectangle(cornerRadius: 99)
                            .stroke(viewModel.lectureLineStroke7)
                    }
                    .background(viewModel.lectureLineBackground7)
                    .cornerRadius(99)
                    .buttonWrapper {
                        viewModel.drone.toggle()
                    }
            }
        }
    }
}

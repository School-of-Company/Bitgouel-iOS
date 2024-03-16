import SwiftUI

struct LectureLineView: View {
    @StateObject var viewModel: LectureOpeningApplyViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(spacing: 16) {
                Text("자동차 산업")
                    .bitgouelFont(.text2, color: viewModel.lectureTextColor(parameter: viewModel.automobile))
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .overlay {
                        RoundedRectangle(cornerRadius: 99)
                            .stroke(viewModel.lectureStrokeColor(parameter: viewModel.automobile))
                    }
                    .background(viewModel.lectureBackgroundColor(parameter: viewModel.automobile))
                    .cornerRadius(99)
                    .buttonWrapper {
                        viewModel.automobile.toggle()
                    }
                
                Text("에너지 산업")
                    .bitgouelFont(.text2, color: viewModel.lectureTextColor(parameter: viewModel.energy))
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .overlay {
                        RoundedRectangle(cornerRadius: 99)
                            .stroke(viewModel.lectureStrokeColor(parameter: viewModel.energy))
                    }
                    .background(viewModel.lectureBackgroundColor(parameter: viewModel.energy))
                    .cornerRadius(99)
                    .buttonWrapper {
                        viewModel.energy.toggle()
                    }
            }
            
            HStack(spacing: 16) {
                Text("의료•헬스")
                    .bitgouelFont(.text2, color: viewModel.lectureTextColor(parameter: viewModel.medicalHealth))
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .overlay {
                        RoundedRectangle(cornerRadius: 99)
                            .stroke(viewModel.lectureStrokeColor(parameter: viewModel.medicalHealth))
                    }
                    .background(viewModel.lectureBackgroundColor(parameter: viewModel.medicalHealth))
                    .cornerRadius(99)
                    .buttonWrapper {
                        viewModel.medicalHealth.toggle()
                    }
                
                Text("A.I 융•복합")
                    .bitgouelFont(.text2, color: viewModel.lectureTextColor(parameter: viewModel.aiFusionComplex))
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .overlay {
                        RoundedRectangle(cornerRadius: 99)
                            .stroke(viewModel.lectureStrokeColor(parameter: viewModel.aiFusionComplex))
                    }
                    .background(viewModel.lectureBackgroundColor(parameter: viewModel.aiFusionComplex))
                    .cornerRadius(99)
                    .buttonWrapper {
                        viewModel.aiFusionComplex.toggle()
                    }
            }
            
            Text("문화 산업")
                .bitgouelFont(.text2, color: viewModel.lectureTextColor(parameter: viewModel.culture))
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .overlay {
                    RoundedRectangle(cornerRadius: 99)
                        .stroke(viewModel.lectureStrokeColor(parameter: viewModel.culture))
                }
                .background(viewModel.lectureBackgroundColor(parameter: viewModel.culture))
                .cornerRadius(99)
                .buttonWrapper {
                    viewModel.culture.toggle()
                }
        }
    }
}


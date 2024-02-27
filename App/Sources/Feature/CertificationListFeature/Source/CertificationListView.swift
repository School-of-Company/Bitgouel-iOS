import SwiftUI

struct CertificationListView: View {
    @StateObject var viewModel: CertificationListViewModel
    
    private let activityListFactory: any ActivityListFactory
    private let inputCertificationFactory: any InputCertificationFactory
    
    init(
        viewModel: CertificationListViewModel,
        activityListFactory: any ActivityListFactory,
        inputCertificationFactory: any InputCertificationFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.activityListFactory = activityListFactory
        self.inputCertificationFactory = inputCertificationFactory
    }
    
    var body: some View {
        VStack(spacing: 24) {
            if let studentInfo = viewModel.studentInfo {
                VStack(alignment: .leading, spacing: 4) {
                    BitgouelText(
                        text: studentInfo.name,
                        font: .title2
                    )
                    
                    HStack {
                        BitgouelText(
                            text: "총 학점",
                            font: .text3
                        )
                        
                        Spacer()
                        
                        BitgouelText(
                            text: "\(studentInfo.credit)",
                            font: .text3
                        )
                    }
                    .foregroundColor(.bitgouel(.primary(.p5)))
                    
                    HStack {
                        BitgouelText(
                            text: "이메일",
                            font: .caption
                        )
                        
                        Spacer()
                        
                        BitgouelText(
                            text: studentInfo.email,
                            font: .text2
                        )
                    }
                    .foregroundColor(.bitgouel(.greyscale(.g4)))
                    
                    HStack {
                        BitgouelText(
                            text: "전화번호",
                            font: .caption
                        )
                        
                        Spacer()
                        
                        BitgouelText(
                            text: studentInfo.phoneNumber,
                            font: .caption
                        )
                    }
                }
                .padding(.top, 24)
            }
            
            Divider()
            
            HStack {
                BitgouelText(
                    text: "자격증",
                    font: .title3
                )
                
                Spacer()
                
                Button {
                    viewModel.updateIsPresentedInputCertificationView(isPresented: true)
                } label: {
                    BitgouelAsset.Icons.add.swiftUIImage
                }
            }
            
            ScrollView(showsIndicators: false) {
                LazyVStack(spacing: 0) {
                    ForEach(viewModel.certificationList, id: \.certificationID) { certification in
                        CertificationListRow(
                            id: certification.certificationID,
                            title: certification.name,
                            acquisitionDate: certification.acquisitionDate
                        ) {
                            print("edit")
                        }
                        
                        Divider()
                    }
                }
            }
            .padding(.horizontal, 28)
            .navigate(
                to: activityListFactory.makeView(studentID: viewModel.studentID).eraseToAnyView(),
                when: Binding(
                    get: { viewModel.isPresentedActivityListView },
                    set: { state in viewModel.updateIsPresentedActivityListView(isPresented: state) }
                )
            )
            .fullScreenCover(
                isPresented: Binding(
                    get: { viewModel.isPresentedInputCertificationView },
                    set: { state in
                        viewModel.updateEpic(epic: "등록")
                        viewModel.updateIsPresentedInputCertificationView(isPresented: state)
                    }
                )
            ) {
                DeferView {
                    inputCertificationFactory.makeView(
                        epic: viewModel.selectedEpic,
                        certificationID: viewModel.certificationID
                    ).eraseToAnyView()
                }
            }
            .navigationTitle("학생 정보")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        viewModel.updateIsPresentedActivityListView(isPresented: true)
                    } label: {
                        BitgouelAsset.Icons.person.swiftUIImage
                    }
                }
            }
        }
    }
}

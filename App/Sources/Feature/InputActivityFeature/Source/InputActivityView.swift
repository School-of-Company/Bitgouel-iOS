import SwiftUI

struct InputActivityView: View {
    @StateObject var viewModel: InputActivityViewModel
    
    private let activityDetailSettingFactory: any ActivityDetailSettingFactory
    
    init(
        viewModel: InputActivityViewModel,
        activityDetailSettingFactory: any ActivityDetailSettingFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.activityDetailSettingFactory = activityDetailSettingFactory
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                VStack {
                    TextEditor(text: Binding(
                        get: { viewModel.title },
                        set: { newValue in
                            guard newValue.count <= 100 else { return }
                            viewModel.title = newValue
                        }
                    ))
                    .bitgouelFont(.title3)
                    .overlay(alignment: .topLeading) {
                        if viewModel.title.isEmpty {
                            BitgouelText(
                                text: "활동 제목 (100자 이내)",
                                font: .title3
                            )
                            .padding(.top, 8)
                            .padding(.leading, 4)
                            .foregroundColor(.bitgouel(.greyscale(.g7)))
                        }
                    }
                }
                .padding(.top, -40)
                .frame(minHeight: 40, maxHeight: 120)
                
                Divider()
                
                VStack {
                    TextEditor(text: Binding(
                        get: { viewModel.activityText },
                        set: { newValue in
                            guard newValue.count <= 1000 else { return }
                            viewModel.activityText = newValue
                        }
                    ))
                    .bitgouelFont(.text3)
                    .overlay(alignment: .topLeading) {
                        if viewModel.activityText.isEmpty {
                            BitgouelText(
                                text: "본문 입력 (1000자 이내)",
                                font: .text3
                            )
                            .padding(.top, 8)
                            .padding(.leading, 4)
                            .foregroundColor(.bitgouel(.greyscale(.g7)))
                        }
                    }
                }
                .padding(.top, 16)
                .frame(height: 460)
                
                Divider()
                
                VStack(spacing: 8) {
                    Button {
                        viewModel.isPresentedDetailSettingAppend = true
                    } label: {
                        Spacer()
                        
                        BitgouelAsset.Icons.setting.swiftUIImage
                        
                        Text("활동 세부 설정")
                            .bitgouelFont(.text3, color: .primary(.p5))
                        
                        Spacer()
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal, 32)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .strokeBorder(Color.bitgouel(.primary(.p5)))
                    }
                    
                    CTAButton(
                        text: "활동 추가",
                        style: .default
                    ) {
                        viewModel.addActivity()
                    }
                }
                .padding(.top, 24)
                .padding(.bottom, 12)
            }
            .fullScreenCover(
                isPresented: Binding(
                    get: { viewModel.isPresentedDetailSettingAppend },
                    set: { _ in viewModel.detailSettingAppendDismissed() }
                )
            ) {
                DeferView {
                    activityDetailSettingFactory.makeView(
                        activityDate: viewModel.activityDate,
                        activityCredit: viewModel.activityCredit
                    ) {
                        activityDate, activityCredit in
                        viewModel.updateActivityDetail(date: activityDate, credit: activityCredit)
                    }.eraseToAnyView()
                }
            }
        }
        .padding(.horizontal, 28)
        .onTapGesture {
            hideKeyboard()
        }
    }
}

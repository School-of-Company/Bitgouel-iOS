import SwiftUI

struct InputActivityView: View {
    @State var title: String = ""
    @State var activityText: String = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                VStack {
                    TextEditor(text: $title)
                        .bitgouelFont(.title3)
                        .onChange(of: title, perform: { value in
                            if title.count > 100 {
                                title.removeLast()
                            }
                        })
                        .overlay(alignment: .topLeading) {
                            if title.isEmpty {
                                BitgouelText(
                                    text: "활동 제목 (100자 이내)",
                                    font: .title3)
                                .foregroundColor(.bitgouel(.greyscale(.g7)))
                            }
                        }
                    Spacer()
                }
                .frame(maxHeight: 130)
                
                Divider()
                
                ScrollView {
                    VStack {
                        TextEditor(text: $activityText)
                            .bitgouelFont(.text3)
                            .overlay(alignment: .topLeading) {
                                if activityText.isEmpty {
                                    BitgouelText(text: "본문 입력 (1000자 이내)", font: .text3)
                                        .foregroundColor(.bitgouel(.greyscale(.g7)))
                                }
                            }
                            .onChange(of: activityText, perform: { value  in
                                if activityText.count > 1000 {
                                    activityText.removeLast()
                                }
                            })
                    }
                }
                .padding(.top, 16)
                
                Spacer()
            }
            .padding(.horizontal, 28)
            .padding(.top, 24)
        }
    }
}

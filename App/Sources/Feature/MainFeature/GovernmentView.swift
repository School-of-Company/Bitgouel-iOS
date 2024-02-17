import SwiftUI

struct GovernmentView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                VStack {
                    ZStack {
                        Circle()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.bitgouel(.primary(.p5)))
                        
                        VStack {
                            Text("미래형")
                                .bitgouelFont(.text1, color: .primary(.p9))
                            
                            Text("운송기기")
                                .bitgouelFont(.text1, color: .primary(.p9))
                        }
                    }
                    .padding(.bottom, 23)
                    
                    Image("GIGA")
                        .padding(.bottom, 15)
                    
                    Text("(재)광주그린카지능원")
                }
                
                VStack {
                    ZStack {
                        Circle()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.bitgouel(.primary(.p4)))
                        
                        VStack {
                            Text("에너지")
                                .bitgouelFont(.text1, color: .primary(.p9))
                            
                            Text("산업")
                                .bitgouelFont(.text1, color: .primary(.p9))
                        }
                    }
                    .padding(.bottom, 18)
                    
                    Image("EVEDI")
                        .padding(.bottom, 10)
                    
                    Text("에너지밸리기업개발원")
                }
                
                VStack {
                    ZStack {
                        Circle()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.bitgouel(.primary(.p3)))
                        
                        VStack {
                            Text("의료")
                                .bitgouelFont(.text1, color: .primary(.p9))
                            
                            Text("헬스케어")
                                .bitgouelFont(.text1, color: .primary(.p9))
                        }
                    }
                    .padding(.bottom, 16)
                    
                    Image("klda")
                        .padding(.bottom, 8)
                    
                    Text("(사)한국평생교육연합회")
                }
                
                VStack {
                    ZStack {
                        Circle()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.bitgouel(.primary(.p2)))
                        
                        VStack {
                            Text("AI")
                                .bitgouelFont(.text1, color: .primary(.p9))
                            
                            Text("융복합")
                                .bitgouelFont(.text1, color: .primary(.p9))
                        }
                    }
                    .padding(.bottom, 18)
                    
                    Image("smhrd")
                        .padding(.bottom, 10)
                    
                    Text("(사)스마트인재개발원")
                }
                
                VStack {
                    ZStack {
                        Circle()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.bitgouel(.primary(.p1)))
                        
                        VStack {
                            Text("문화")
                                .bitgouelFont(.text1, color: .primary(.p9))
                            
                            Text("산업")
                                .bitgouelFont(.text1, color: .primary(.p9))
                        }
                    }
                    .padding(.bottom, 4)

                    Text("시청자미디어재단")
                        .padding(.bottom, 2)

                    Text("(재)광주정보문화산업진흥원")
                        .padding(.bottom, 2)

                    Text("광주광역시청소년삶디자인센터")
                }
            }
        }
    }
}

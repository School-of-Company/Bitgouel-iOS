import SwiftUI

struct GovernmentView: View {
    var body: some View {
        VStack {
            IntroduceView(
                introduceTitle: "유관 기관 소개",
                introduceText: "#혁신지구와_함께하는"
            )
            .padding(.horizontal, 28)

            Group {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        VStack {
                            govermentCircle(
                                governmentFirstText: "미래형",
                                governmentSecondText: "운송기기"
                            )
                            .padding(.bottom, 23)

                            Image("GIGA")
                                .padding(.bottom, 15)

                            Text("(재)광주그린카지능원")
                        }

                        VStack {
                            govermentCircle(
                                governmentFirstText: "에너지",
                                governmentSecondText: "산업"
                            )
                            .padding(.bottom, 18)

                            Image("EVEDI")
                                .padding(.bottom, 10)

                            Text("에너지밸리기업개발원")
                        }

                        VStack {
                            govermentCircle(
                                governmentFirstText: "의료",
                                governmentSecondText: "헬스케어"
                            )
                            .padding(.bottom, 16)

                            Image("klda")
                                .padding(.bottom, 8)

                            Text("(사)한국평생교육연합회")
                        }

                        VStack {
                            govermentCircle(
                                governmentFirstText: "AI",
                                governmentSecondText: "융복합"
                            )
                            .padding(.bottom, 18)

                            Image("smhrd")
                                .padding(.bottom, 10)

                            Text("(사)스마트인재개발원")
                        }

                        VStack {
                            govermentCircle(
                                governmentFirstText: "문화",
                                governmentSecondText: "산업"
                            )
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
    }

    @ViewBuilder
    func govermentCircle(
        governmentFirstText: String,
        governmentSecondText: String
    ) -> some View {
        VStack {
            ZStack {
                Circle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.bitgouel(.primary(.p5)))

                VStack {
                    Text(governmentFirstText)
                        .bitgouelFont(.text1, color: .primary(.p9))

                    Text(governmentSecondText)
                        .bitgouelFont(.text1, color: .primary(.p9))
                }
            }
        }
    }
}

import SwiftUI

struct MyPageView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        HStack(spacing: 4) {
                            BitgouelText(
                                text: "이름",
                                font: .title2
                            )

                            BitgouelText(
                                text: "유저 역할",
                                font: .text1
                            )
                            .foregroundColor(.bitgouel(.greyscale(.g7)))
                        }

                        HStack(spacing: 4) {
                            BitgouelText(
                                text: "유저 소속",
                                font: .text1
                            )

                            BitgouelText(
                                text: "소속",
                                font: .text1
                            )
                            .foregroundColor(.bitgouel(.greyscale(.g7)))
                        }

                        BitgouelText(
                            text: "학년 반 번호",
                            font: .text3
                        )
                        .foregroundColor(.bitgouel(.greyscale(.g4)))

                        BitgouelText(
                            text: "동아리",
                            font: .text3
                        )
                        .foregroundColor(.bitgouel(.greyscale(.g4)))
                    }

                    Spacer()
                }
                .padding(.top, 32)

                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        BitgouelText(
                            text: "계정 정보",
                            font: .text1
                        )

                        BitgouelText(
                            text: "유저 이메일",
                            font: .text3
                        )
                        .foregroundColor(.bitgouel(.greyscale(.g7)))

                        BitgouelText(
                            text: "전화번호",
                            font: .text3
                        )
                        .foregroundColor(.bitgouel(.greyscale(.g7)))
                    }

                    Spacer()
                }
                .padding(.top, 40)

                HStack {
                    VStack(alignment: .leading, spacing: 21) {
                        BitgouelText(
                            text: "계정 설정",
                            font: .text1
                        )

                        Button {} label: {
                            BitgouelText(
                                text: "비밀번호 변경",
                                font: .text3
                            )
                        }
                        .padding(.top, 19)

                        Divider()

                        Button {} label: {
                            BitgouelText(
                                text: "로그아웃",
                                font: .text3
                            )
                        }

                        Divider()

                        Button {} label: {
                            BitgouelText(
                                text: "회원 탈퇴",
                                font: .text3
                            )
                            .foregroundColor(.bitgouel(.error(.e5)))
                        }
                    }

                    Spacer()
                }
                .padding(.top, 60)

                Spacer()
            }
            .navigationTitle("내 정보")
            .padding(.horizontal, 28)
            Spacer()
        }
    }
}

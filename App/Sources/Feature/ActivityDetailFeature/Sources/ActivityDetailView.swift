import SwiftUI

struct ActivityDetailView: View {
    @StateObject var viewModel: ActivityDetailViewModel

    init(viewModel: ActivityDetailViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                VStack {
                    HStack {
                        BitgouelText(
                            text: "활동 날짜",
                            font: .text1
                        )

                        Spacer()
                    }

                    DatePicker(
                        "활동 날짜 선택",
                        selection: $viewModel.activityDate,
                        in: Date()...,
                        displayedComponents: [.date]
                    )
                    .datePickerStyle(.compact)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 20)
                    .background(Color.bitgouel(.greyscale(.g9)))
                    .cornerRadius(8, corners: .allCorners)

                    Spacer()
                }
                .padding(.top, 28)

                Spacer()

                VStack {
                    HStack {
                        BitgouelText(
                            text: "수여 학점",
                            font: .text1
                        )
                        Spacer()
                    }

                    Button {
                        viewModel.isPresentedCreditSheet = true
                    } label: {
                        HStack {
                            BitgouelText(
                                text: "수여 학점 선택",
                                font: .text3
                            )
                            .foregroundColor(.bitgouel(.greyscale(.g2)))
                            .padding(.vertical, 16)
                            .padding(.leading, 20)

                            Spacer()

                            Image("chevron_down")
                                .padding(.trailing, 20)
                        }
                        .background(Color.bitgouel(.greyscale(.g9)))
                        .cornerRadius(8, corners: .allCorners)
                    }

                    Spacer()
                }
                .padding(.top, -60)

                Spacer()

                CTAButton(
                    text: "적용하기",
                    style: .default
                )
                .padding(.bottom, 14)

                .bitgouelBottomSheet(
                    isShowing: $viewModel.isPresentedCreditSheet
                ) {
                    setCreditBottomSheet()
                }
            }
            .padding(.horizontal, 28)
            .navigationTitle("활동 세부 설정")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {}, label: {
                        Image("cancel")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                            .foregroundColor(.bitgouel(.greyscale(.g8)))
                    })
                }
            }
        }
    }

    @ViewBuilder
    func setCreditBottomSheet() -> some View {
        ForEach(viewModel.creditValue, id: \.self) { credit in
            HStack {
                BitgouelText(
                    text: "\(credit)점",
                    font: .text2
                )

                Spacer()

                BitgouelRadioButton(
                    isSelected: Binding(
                        get: { viewModel.selectedCredit == credit },
                        set: { isSelected in
                            if isSelected {
                                viewModel.isPresentedCreditSheet = false
                                viewModel.selectedCredit = credit
                            }
                        }
                    )
                )
                .background(.clear)
            }
            .padding(.horizontal, 28)
            .padding(.vertical, 24)
        }
    }
}

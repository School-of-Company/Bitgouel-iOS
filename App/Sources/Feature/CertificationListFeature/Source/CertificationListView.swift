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
        NavigationView {
            VStack(spacing: 24) {
                VStack(alignment: .leading, spacing: 4) {
                    BitgouelText(
                        text: "유저 이름",
                        font: .title2
                    )

                    HStack {
                        BitgouelText(
                            text: "총 학점",
                            font: .text3
                        )

                        Spacer()

                        BitgouelText(
                            text: "300",
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
                            text: "adjdjdj@.com",
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
                            text: "00",
                            font: .caption
                        )
                    }
                }
                .padding(.top, 24)

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

                ScrollView {
                    LazyVStack(spacing: 0) {
                        ForEach(0..<4, id: \.self) { index in
                            ListRow(
                                id: "",
                                title: "",
                                modifiedAt: Date(),
                                isPresented: Binding(
                                    get: { viewModel.isPresentedAlterBottomSheet },
                                    set: { state in viewModel.updateIsPresentedAlterBottomSheet(isPresented: state) }
                                )
                            )
                        }
                    }
                }
            }
            .padding(.horizontal, 28)
            .alterBottomSheet(
                isShowing: Binding(
                    get: { viewModel.isPresentedAlterBottomSheet },
                    set: { state in viewModel.updateIsPresentedAlterBottomSheet(isPresented: state) }
                ),
                deleteAction: {},
                editAction: {}
            )
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
                    set: { state in viewModel.updateIsPresentedInputCertificationView(isPresented: state) }
                )
            ) {
                DeferView {
                    inputCertificationFactory.makeView(
                        certificationName: viewModel.certificationName,
                        acquisitionDate: viewModel.acquisitionDate
                    ) { name, date in
                        viewModel.updateCertificationInfo(
                            name: name,
                            date: date
                        )
                    }.eraseToAnyView()
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
            .navigationBarBackButtonHidden(true)
        }
    }
}

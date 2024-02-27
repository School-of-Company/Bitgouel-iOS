import SwiftUI

struct CertificationListView: View {
    @StateObject var viewModel: CertificationListViewModel

    private let activityListFactory: any ActivityListFactory

    init(
        viewModel: CertificationListViewModel,
        activityListFactory: any ActivityListFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.activityListFactory = activityListFactory
    }

    var body: some View {
        NavigationView {
            if let studentInfo = viewModel.studentInfo {
                VStack(spacing: 24) {
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

                    Divider()

                    HStack {
                        BitgouelText(
                            text: "자격증",
                            font: .title3
                        )

                        Spacer()

                        Button {} label: {
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
                                        set: { state in viewModel.isPresentedAlterBottomSheet(state: state) }
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
                        set: { state in viewModel.isPresentedAlterBottomSheet(state: state) }
                    ),
                    deleteAction: {},
                    editAction: {}
                )
                .navigate(
                    to: activityListFactory.makeView(studentID: viewModel.studentID).eraseToAnyView(),
                    when: Binding(
                        get: { viewModel.isPresentedActivityListView },
                        set: { state in viewModel.isPresentedActivityListView(state: state) }
                    )
                )
                .navigationTitle("학생 정보")
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button {
                            viewModel.isPresentedActivityListView(state: true)
                        } label: {
                            BitgouelAsset.Icons.person.swiftUIImage
                        }
                    }
                }
                .navigationBarBackButtonHidden(true)
            }
        }
    }
}

import SwiftUI

struct StudentInfoView: View {
    @StateObject var viewModel: StudentInfoViewModel

    private let activityListFactory: any ActivityListFactory
    private let inputCertificationFactory: any InputCertificationFactory

    init(
        viewModel: StudentInfoViewModel,
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
                            text: studentInfo.phoneNumber.withHypen,
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
                            viewModel.updateEpic(epic: "수정")
                            viewModel.selectedCertification(
                                certificationID: certification.certificationID,
                                certificationName: certification.name,
                                acquisitionDate: certification.acquisitionDate
                            )
                            viewModel.updateIsPresentedInputCertificationView(isPresented: true)
                        }

                        Divider()
                    }
                }

                switch viewModel.authority {
                case .admin,
                     .teacher,
                     .student:
                    appliedLectureList()
                        .padding(.top, 24)

                default:
                    EmptyView()
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
                    certificationID: viewModel.selectedCertificationID,
                    certificationName: viewModel.selectedCertificationName,
                    acquisitionDate: viewModel.selectedAcquisitionDate
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
        .onAppear {
            viewModel.onAppear()
        }
    }

    @ViewBuilder
    func appliedLectureList() -> some View {
        VStack(alignment: .leading, spacing: 24) {
            BitgouelText(
                text: "신청한 강의 목록",
                font: .title3
            )

            LazyVStack(alignment: .leading, spacing: 24) {
                ForEach(viewModel.appliedLectureList, id: \.lectureID) { lecture in
                    AppliedLectureListRow(
                        name: lecture.name,
                        lectureType: lecture.lectureType,
                        currentCompletedDate: lecture.currentCompletedDate,
                        instructor: lecture.instructor,
                        isComplete: lecture.isComplete
                    )

                    Divider()
                }
            }
        }
    }
}

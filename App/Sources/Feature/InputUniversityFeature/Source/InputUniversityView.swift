import SwiftUI

struct InputUniversityView: View {
    @StateObject var viewModel: InputUniversityViewModel

    init(viewModel: InputUniversityViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            BitgouelTextField(
                "대학 이름 입력",
                text: $viewModel.universityName
            )
            .padding(.top, 36)

            Spacer()

            if viewModel.state == "수정" {
                departmentFormView()
            }
        }
        .overlay(alignment: .bottom) {
            renderFormButtons()
        }
        .padding(.horizontal, 28)
        .navigationTitle("대학 \(viewModel.state)")
        .bitgouelAlert(
            title: "대학을 삭제하시겠습니까?",
            description: "",
            isShowing: $viewModel.isShowingDeleteAlert,
            alertActions: [
                .init(
                    text: "취소",
                    style: .cancel,
                    action: {
                        viewModel.updateIsShowingDeleteAlert(isShowing: false)
                    }
                ),
                .init(
                    text: "삭제",
                    style: .error,
                    action: {
                        viewModel.deleteUniversity()
                    }
                )
            ]
        )
    }

    @ViewBuilder
    func departmentFormView() -> some View {
        VStack(alignment: .leading, spacing: 16) {
            BitgouelText(text: "학과 목록", font: .title3)

            ScrollView {
                LazyVStack(alignment: .leading, spacing: 16) {
                    ForEach(viewModel.departmentList.indices, id: \.self) { index in
                        let department = viewModel.departmentList[safe: index]

                        HStack {
                            HStack {
                                BitgouelText(
                                    text: department ?? "",
                                    font: .text3
                                )
                                .padding(.horizontal, 20)
                                .padding(.vertical, 16)

                                Spacer()
                            }
                            .overlay {
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.bitgouel(.greyscale(.g7)))
                            }

                            Spacer()

                            Button {
                                viewModel.deleteDepartment(department: department ?? "")
                            } label: {
                                BitgouelAsset.Icons.minusFill.swiftUIImage
                                    .resizable()
                                    .renderingMode(.template)
                                    .foregroundColor(Color.bitgouel(.error(.e5)))
                                    .frame(width: 24, height: 24)
                            }
                        }
                    }

                    Button {
                        viewModel.updateIsPresentedInputDepartment(isPresented: true)
                    } label: {
                        HStack {
                            Text("학과 추가")

                            Spacer()

                            BitgouelAsset.Icons.add.swiftUIImage
                                .renderingMode(.template)
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 16)
                        .foregroundColor(.bitgouel(.greyscale(.g10)))
                        .background(Color.bitgouel(.primary(.p5)))
                        .cornerRadius(8, corners: .allCorners)
                    }
                }
            }
        }
    }

    @ViewBuilder
    func renderFormButtons() -> some View {
        if viewModel.state == "수정" {
            HStack {
                DeactivateButton(
                    text: "대학 삭제",
                    buttonType: .minus
                ) {
                    viewModel.updateIsShowingDeleteAlert(isShowing: true)
                }

                Spacer()

                ActivateButton(
                    text: "수정 완료",
                    buttonType: .check
                ) {
                    viewModel.editUniversity()
                }
            }
        } else {
            ActivateButton(
                text: "대학 등록",
                buttonType: .add
            ) {
                viewModel.createdUniversity()
            }
        }
    }
}

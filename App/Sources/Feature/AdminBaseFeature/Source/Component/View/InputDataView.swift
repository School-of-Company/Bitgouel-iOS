import Service
import SwiftUI

public struct InputDataView: View {
    let epic: String
    let state: String
    @Binding var selectedField: FieldType?
    @Binding var name: String
    @State var isShowingFieldBottomSheet: Bool = false
    let finalButtonAction: () -> Void
    let deleteButtonAction: () -> Void
    let editButtonAction: () -> Void

    public init(
        epic: String,
        state: String,
        selectedField: Binding<FieldType?>,
        name: Binding<String>,
        isShowingFieldBottomSheet: Bool = false,
        finalButtonAction: @escaping () -> Void,
        deleteButtonAction: @escaping () -> Void = {},
        editButtonAction: @escaping () -> Void = {}
    ) {
        self.epic = epic
        self.state = state
        _selectedField = selectedField
        _name = name
        self.isShowingFieldBottomSheet = isShowingFieldBottomSheet
        self.finalButtonAction = finalButtonAction
        self.deleteButtonAction = deleteButtonAction
        self.editButtonAction = editButtonAction
    }

    public var body: some View {
        VStack(alignment: .leading) {
            VStack(spacing: 0) {
                BitgouelTextField(
                    "\(epic) 이름 입력",
                    text: $name
                )

                PickerTextField(
                    "분야 선택",
                    text: selectedField?.display() ?? ""
                ) {
                    isShowingFieldBottomSheet = true
                }
            }
            .padding(.top, 32)

            Spacer()
        }
        .navigationTitle("\(epic) \(state)")
        .overlay(alignment: .bottom) {
            finalButton()
        }
        .padding(.horizontal, 28)
        .bitgouelBottomSheet(isShowing: $isShowingFieldBottomSheet) {
            FieldBottomSheet(
                selectedField: selectedField
            ) { field in
                selectedField = field
                isShowingFieldBottomSheet = false
            }
        }
    }

    @ViewBuilder
    func finalButton() -> some View {
        if state == "수정" {
            HStack(spacing: 8) {
                DeactivateButton(
                    text: "\(epic) 삭제",
                    buttonType: .minus
                ) {
                    deleteButtonAction()
                }

                ActivateButton(
                    text: "수정 완료",
                    buttonType: .check
                ) {
                    editButtonAction()
                }
            }
        } else {
            ActivateButton(
                text: "\(epic) 등록",
                buttonType: .add
            ) {
                finalButtonAction()
            }
        }
    }
}

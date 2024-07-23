import SwiftUI
import Service

public struct InputDataView: View {
    let epic: String
    let state: String
    @Binding var selectedField: FieldType
    @Binding var name: String
    @State var isShowingFieldBottomSheet: Bool = false
    let finalButtonAction: () -> Void

    public init(
        epic: String,
        state: String,
        selectedField: Binding<FieldType>,
        name: Binding<String>,
        isShowingFieldBottomSheet: Bool = false,
        finalButtonAction: @escaping () -> Void
    ) {
        self.epic = epic
        self.state = state
        _selectedField = selectedField
        _name = name
        self.isShowingFieldBottomSheet = isShowingFieldBottomSheet
        self.finalButtonAction = finalButtonAction
    }

    public var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                VStack(spacing: 16) {
                    BitgouelTextField(
                        "\(epic) 이름 입력",
                        text: $name
                    )

                    PickerTextField(
                        "분야 선택",
                        text: selectedField.display()
                    ) {
                        isShowingFieldBottomSheet = true
                    }
                }

                Spacer()
            }
            .overlay(alignment: .bottom) {
                finalButton()
            }
            .padding(.horizontal, 28)
            .navigationTitle("\(epic) \(state)")
            .bitgouelBottomSheet(isShowing: $isShowingFieldBottomSheet) {
                FieldBottomSheet(
                    selectedField: selectedField
                ) { field in
                    selectedField = field
                }
            }
        }
    }

    @ViewBuilder
    func finalButton() -> some View {
        if state == "수정" {
            ActivateButton(
                text: "수정 완료",
                buttonType: .check
            ) {
                finalButtonAction()
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

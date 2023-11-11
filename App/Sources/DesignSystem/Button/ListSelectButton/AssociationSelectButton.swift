import SwiftUI

public struct AssociationSelectButton: View {
    var text: String
    var style: SelectButtonStyleType
    var action: () -> Void

    public init(
        text: String,
        style: SelectButtonStyleType = .select,
        action: @escaping () -> Void = {}

    ) {
        self.text = text
        self.style = .select
        self.action = action
    }

    public var body: some View {
        HStack {
            Text(text)
                .padding(.horizontal, 20)
                .padding(.vertical, 18)

            Spacer()
        }
        .buttonWrapper(action)
        .buttonStyle(AssociationSelectButtonStyle(style: style))
    }
}

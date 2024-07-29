import NukeUI
import Service
import SwiftUI

public struct SchoolDetailBottomSheet: View {
    let schoolInfo: SchoolDetailInfoModel
    let editAction: () -> Void
    let cancel: (Bool) -> Void

    public var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                BitgouelText(
                    text: "학교 상세",
                    font: .title3
                )

                Spacer()

                Button {
                    cancel(false)
                } label: {
                    BitgouelAsset.Icons.cancel.swiftUIImage
                }
            }

            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    LazyImage(source: schoolInfo.logoImageURL,resizingMode: .aspectFit)
                        .frame(width: 80, height: 80)

                    VStack(alignment: .leading, spacing: 4) {
                        BitgouelText(
                            text: schoolInfo.name,
                            font: .text1
                        )

                        Text(schoolInfo.line.display())
                            .bitgouelFont(.text3, color: .greyscale(.g4))
                    }

                    BitgouelText(
                        text: "학과 목록",
                        font: .text1
                    )

                    LazyVStack(alignment: .leading, spacing: 16) {
                        ForEach(schoolInfo.departmentList, id: \.self) { department in
                            Text(department)
                                .bitgouelFont(.text3, color: .greyscale(.g4))
                        }
                    }

                    BitgouelText(
                        text: "동아리 목록",
                        font: .text1
                    )

                    LazyVStack(alignment: .leading, spacing: 18) {
                        ForEach(schoolInfo.clubList, id: \.clubID) { club in
                            clubListRow(
                                clubName: club.name,
                                field: club.field.display()
                            )
                        }
                    }
                }
            }
        }
        .overlay(alignment: .bottom) {
            ActivateButton(
                text: "정보 수정",
                buttonType: .pen,
                action: editAction
            )
        }
        .padding(.horizontal, 28)
        .frame(height: 600)
    }

    @ViewBuilder
    func clubListRow(
        clubName: String,
        field: String
    ) -> some View {
        HStack(spacing: 4) {
            BitgouelText(
                text: clubName,
                font: .text3
            )

            BitgouelText(
                text: field,
                font: .caption
            )
        }
        .foregroundColor(Color.bitgouel(.greyscale(.g4)))
    }
}

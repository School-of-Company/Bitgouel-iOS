import SwiftUI

struct LectureDatesModel: Equatable {
    let completeDate: Date
    let startTime: Date
    let endTime: Date
}

struct SelectedLectureDatesView: View {
    var lectureDatesList: [LectureDatesModel]
    let onSelectCompleteDate: (Date, Int) -> Void
    let onSelectStartTime: (Date, Int) -> Void
    let onSelectEndTime: (Date, Int) -> Void
    let addLectureDates: () -> Void
    let deleteLectureDates: (Int) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            BitgouelText(
                text: "강의 수강일",
                font: .text1
            )
            VStack(spacing: 12) {
                ForEach(lectureDatesList.indices, id: \.self) { index in
                    HStack {
                        DatePicker(
                            "수강 날짜",
                            selection: Binding(
                                get: { lectureDatesList[index].completeDate },
                                set: { onSelectCompleteDate($0, index) }
                            ),
                            displayedComponents: .date
                        )
                        .datePickerStyle(.compact)
                        .padding(.horizontal, 14)
                        .padding(.vertical, 8)
                        .background(Color.bitgouel(.greyscale(.g9)))
                        .cornerRadius(8)

                        BitgouelAsset.Icons.redcancelFill.swiftUIImage
                            .buttonWrapper {
                                deleteLectureDates(index)
                            }
                    }

                    HStack {
                        DatePicker(
                            "시작",
                            selection: Binding(
                                get: { lectureDatesList[index].startTime },
                                set: { onSelectStartTime($0, index) }
                            ),
                            displayedComponents: .hourAndMinute
                        )
                        .datePickerStyle(.compact)
                        .padding(.horizontal, 14)
                        .padding(.vertical, 8)
                        .background(Color.bitgouel(.greyscale(.g9)))
                        .cornerRadius(8)

                        DatePicker(
                            "종료",
                            selection: Binding(
                                get: { lectureDatesList[index].endTime },
                                set: { onSelectEndTime($0, index) }
                            ),
                            displayedComponents: .hourAndMinute
                        )
                        .datePickerStyle(.compact)
                        .padding(.horizontal, 14)
                        .padding(.vertical, 8)
                        .background(Color.bitgouel(.greyscale(.g9)))
                        .cornerRadius(8)
                    }
                }

                HStack {
                    BitgouelAsset.Icons.add.swiftUIImage

                    Button {
                        addLectureDates()
                    } label: {
                        Text("날짜 추가하기")
                            .foregroundColor(Color.bitgouel(.greyscale(.g6)))
                    }

                    Spacer()
                }
            }
        }
    }
}

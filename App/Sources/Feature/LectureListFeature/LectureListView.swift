import SwiftUI
import Service

struct LectureListView: View {
    @StateObject var model: LectureListModel
    @StateObject var viewModel: LectureListViewModel
    @State var isShowingFilter = false

    private let lectureListDetailFactory: any LectureListDetailFactory

    init(
        lectureListDetailFactory: any LectureListDetailFactory,
        model: LectureListModel,
        viewModel: LectureListViewModel
    ) {
        self.lectureListDetailFactory = lectureListDetailFactory
        _model = StateObject(wrappedValue: model)
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    LazyVStack {
                        ForEach(model.lectureList, id: \.id) { item in
                            LectureListRowView(
                                name: item.name,
                                content: item.content,
                                startDate: item.startDate,
                                endDate: item.endDate,
                                completeDate: item.completeDate,
                                lectureType: item.lectureType,
                                lectureStatus: item.lectureStatus,
                                approveStatus: item.approveStatus,
                                headCount: item.headCount,
                                maxRegisteredUser: item.maxRegisteredUser,
                                lecturer: item.lecturer,
                                authority: model.authority
                            )
                            .buttonWrapper {
                                withAnimation {
                                    viewModel.lectureDidSelect(userID: item.id)
                                    model.isPresentedLectureDetailPage = true
                                }
                            }

                            Divider()
                        }
                        .padding(.horizontal, 28)
                    }
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Text("강의 목록")
                                .bitgouelFont(.title2)
                                .padding(.leading, 15)
                        }
                    }
                    .toolbar {
                        ToolbarItemGroup(placement: .navigationBarTrailing) {
                            BitgouelAsset.Icons.filterStroke.swiftUIImage

                            Text("필터")
                                .bitgouelFont(.text3, color: .greyscale(.g7))
                                .onTapGesture {
                                    isShowingFilter.toggle()
                                }
                        }
                    }
                }
            }
            .navigate(
                to: lectureListDetailFactory.makeView(userID: model.selectedUserID ?? "").eraseToAnyView(),
                when: Binding(
                    get: { model.isPresentedLectureDetailPage },
                    set: { _ in viewModel.lectureDetailPageDismissed() }
                )
            )
        }
        .bitgouelBottomSheet(isShowing: $isShowingFilter) {
            filterView()
        }
        .onAppear{
            viewModel.onAppear()
        }
    }

    @ViewBuilder
    func LectureListRowView(
        name: String,
        content: String,
        startDate: String,
        endDate: String,
        completeDate: String,
        lectureType: LectureType,
        lectureStatus: LectureStatusType,
        approveStatus: ApproveStatusType,
        headCount: Int,
        maxRegisteredUser: Int,
        lecturer: String,
        authority: UserAuthorityType
    ) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 8) {
                Text(lecturer)
                    .bitgouelFont(.text3, color: .greyscale(.g0))

                Text(completeDate)
                    .bitgouelFont(.text3, color: .greyscale(.g7))
            }

            Text(name)
                .bitgouelFont(.text1, color: .greyscale(.g0))

            Text(content)
            .bitgouelFont(.text3, color: .greyscale(.g4))
            .lineLimit(2)

            HStack(spacing: 8) {
                Text("\(startDate) ~ \(endDate)")

                Text("•")

                Text("\(headCount)/\(maxRegisteredUser)명")
            }
            .bitgouelFont(.caption, color: .greyscale(.g7))

            HStack(spacing: 8) {
                Text(lectureType.display())
                    .bitgouelFont(.caption, color: .greyscale(.g4))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(
                        Color.bitgouel(.greyscale(.g9))
                    )
                    .cornerRadius(18)

                if authority == .admin {
                    Text(approveStatus.display())
                        .bitgouelFont(.caption, color: .greyscale(.g10))
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background {
                            if approveStatus == .approve {
                                Color.bitgouel(.primary(.p5))
                            } else {
                                Color.bitgouel(.error(.e5))
                            }
                            
                        }
                        .cornerRadius(18)
                }
            }
        }
        .padding(.vertical, 20)
    }

    @ViewBuilder
    func filterView() -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 16) {
                Text("필터")
                    .bitgouelFont(.title3, color: .greyscale(.g0))
                    .padding(.top, 8)

                Group {
                    Text("강의 유형")
                        .bitgouelFont(.text1, color: .greyscale(.g0))

                    lectureTypeList()
                        .padding(.top, 3)
                }

                if model.authority == .admin {
                    Group {
                        Text("강의 상태")
                            .bitgouelFont(.text1, color: .greyscale(.g0))
                            .padding(.top, 11)

                        approveStatusTypeList()
                            .padding(.top, 3)
                    }
                }

                BitgouelButton(
                    text: "적용하기"
                )
                .cornerRadius(8)
                .padding(.top, 8)
            }
            .padding(.horizontal, 28)

            Spacer()
        }
    }

    @ViewBuilder
    func lectureTypeList() -> some View {
        ForEach(viewModel.lectureType, id: \.self) { lectureType in
            HStack {
                CheckButton(
                    isSelected: Binding(
                        get: { viewModel.selectedLectureType == lectureType.display() },
                        set: { lecture in
                            if lecture {
                                viewModel.selectedLectureType = lectureType.display()
                            }
                        }
                    )
                )

                Text(lectureType.display())
            }
        }
    }

    @ViewBuilder
    func approveStatusTypeList() -> some View {
        ForEach(viewModel.approveStatusType, id: \.self) { approveStatusType in
            HStack {
                CheckButton(
                    isSelected: Binding(
                        get: { viewModel.selectedapproveStatusType == approveStatusType.display() },
                        set: { status in
                            if status {
                                viewModel.selectedapproveStatusType = approveStatusType.display()
                            }
                        }
                    )
                )

                Text(approveStatusType.display())
            }
        }
    }
}

import Service
import SwiftUI

struct LectureListView: View {
    @Environment(\.tabbarHidden) var tabbarHidden
    @StateObject var viewModel: LectureListViewModel
    @State var isShowingFilter = false

    private let lectureListDetailFactory: any LectureListDetailFactory

    init(
        lectureListDetailFactory: any LectureListDetailFactory,
        viewModel: LectureListViewModel
    ) {
        self.lectureListDetailFactory = lectureListDetailFactory
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    if let lectureList = viewModel.lectureList {
                        LazyVStack(alignment: .leading) {
                            ForEach(lectureList.content, id: \.lectureID) { item in
                                LectureListRow(
                                    name: item.name,
                                    content: item.content,
                                    semester: item.semester,
                                    division: item.division,
                                    department: item.department,
                                    line: item.line,
                                    startDate: item.startDate.toStringCustomFormat(format: "yyyy.M.d"),
                                    endDate: item.endDate.toStringCustomFormat(format: "yyyy.M.d"),
                                    lectureType: item.lectureType,
                                    lectureStatus: item.lectureStatus,
                                    headCount: item.headCount,
                                    maxRegisteredUser: item.maxRegisteredUser,
                                    lecturer: item.lecturer
                                )
                                .buttonWrapper {
                                    withAnimation {
                                        viewModel.updateSelectedLectureID(lectureID: item.lectureID)
                                        viewModel.updateIsPresentedLectureDetailView(isPresented: true)
                                    }
                                }

                                Divider()
                            }
                            .padding(.horizontal, 28)
                        }
                    }
                }
                .navigationTitle("강의 목록")
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        HStack(spacing: 24) {
                            if viewModel.authority == .admin {
                                Button {
                                    #warning("어드민 강의 개설 페이지 이동")
                                } label: {
                                    BitgouelAsset.Icons.add.swiftUIImage
                                }
                            }

                            Button {
                                isShowingFilter.toggle()
                            } label: {
                                HStack(spacing: 8) {
                                    BitgouelAsset.Icons.filterStroke.swiftUIImage
                                }
                            }
                        }
                    }
                }
            }
            .navigate(
                to: lectureListDetailFactory.makeView(lectureID: viewModel.selectedLectureID ?? "").eraseToAnyView(),
                when: Binding(
                    get: { viewModel.isPresentedLectureDetailView },
                    set: { isPresented in viewModel.updateIsPresentedLectureDetailView(isPresented: isPresented) }
                )
            )
            .onChange(of: viewModel.isPresentedLectureDetailView) { newValue in
                tabbarHidden.wrappedValue = newValue
            }
            .bitgouelBottomSheet(isShowing: $isShowingFilter) {
                filterView()
            }
            .onChange(of: isShowingFilter) { newValue in
                tabbarHidden.wrappedValue = newValue
            }
        }
        .onAppear {
            viewModel.onAppear()
        }
        .onChange(of: viewModel.selectedLectureType) { newValue in
            viewModel.updateType(lectureType: newValue)
        }
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

                BitgouelButton(
                    text: "적용하기"
                ) {
                    isShowingFilter = false
                    viewModel.onAppear()
                }
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
}

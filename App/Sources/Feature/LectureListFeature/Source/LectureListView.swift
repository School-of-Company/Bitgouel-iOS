import Service
import SwiftUI

struct LectureListView: View {
    @Environment(\.tabbarHidden) var tabbarHidden
    @StateObject var viewModel: LectureListViewModel
    @State var isShowingFilter = false
    @Binding var selection: TabFlow

    private let lectureListDetailFactory: any LectureListDetailFactory
    private let openLectureApplyFactory: any OpenLectureApplyFactory

    init(
        lectureListDetailFactory: any LectureListDetailFactory,
        openLectureApplyFactory: any OpenLectureApplyFactory,
        viewModel: LectureListViewModel,
        selection: Binding<TabFlow>
    ) {
        self.lectureListDetailFactory = lectureListDetailFactory
        self.openLectureApplyFactory = openLectureApplyFactory
        _viewModel = StateObject(wrappedValue: viewModel)
        _selection = selection
    }

    var body: some View {
        NavigationView {
            ZStack {
                if !viewModel.isLoading {
                    if let lectureList = viewModel.lectureList {
                        if lectureList.content.isEmpty {
                            NoInfoView(text: "강의가 없어요")
                        } else {
                            ScrollView {
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
                                            instructor: item.instructor
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
                    }
                } else {
                    ProgressView()
                        .progressViewStyle(.circular)
                }
            }
            .navigationTitle("강의 목록")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    HStack(spacing: 24) {
                        switch viewModel.authority {
                        case .admin,
                             .professor,
                             .companyInstructor,
                             .government:
                            addLectureButton()

                        default:
                            EmptyView()
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
            .navigate(
                to: openLectureApplyFactory.makeView().eraseToAnyView(),
                when: Binding(
                    get: { viewModel.isPresentedOpenLectureView },
                    set: { isPresented in
                        viewModel.updateIsPresentedOpenLectureView(isPresented: isPresented)
                    }
                )
            )
            .onChange(of: viewModel.isPresentedOpenLectureView) { newValue in
                tabbarHidden.wrappedValue = newValue
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
            .loginAlert(
                isShowing: Binding(
                    get: { viewModel.isShowingLoginAlert },
                    set: { isShowing in
                        viewModel.updateIsShowingLoginAlert(isShowing: isShowing)
                    }
                )
            ) {
                $selection.wrappedValue = .home
            }
        }
        .onAppear {
            viewModel.onAppear()
        }
        .onChange(of: viewModel.selectedLectureType) { newValue in
            viewModel.updateType(lectureType: newValue)
        }
        .refreshable {
            viewModel.onAppear()
        }
    }

    @ViewBuilder
    func addLectureButton() -> some View {
        Button {
            viewModel.updateIsPresentedOpenLectureView(isPresented: true)
        } label: {
            BitgouelAsset.Icons.add.swiftUIImage
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
                        get: { viewModel.selectedLectureType == lectureType.rawValue },
                        set: { lecture in
                            if lecture {
                                viewModel.selectedLectureType = lectureType.rawValue
                            }
                        }
                    )
                )

                Text(lectureType.rawValue)
            }
        }
    }
}

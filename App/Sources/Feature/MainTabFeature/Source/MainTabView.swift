import SwiftUI

struct MainTabView: View {
    @State var selection: TabFlow = .home
    @State var tabbarHidden = false

    private let mainFactory: any MainFactory
    private let lectureListFactory: any LectureListFactory
    private let postListFactory: any PostListFactory
    private let clubListFactory: any ClubListFactory
    private let myPageFactory: any MyPageFactory

    init(
        mainFactory: any MainFactory,
        lectureListFactory: any LectureListFactory,
        postListFactory: any PostListFactory,
        clubListFactory: any ClubListFactory,
        myPageFactory: any MyPageFactory
    ) {
        self.mainFactory = mainFactory
        self.lectureListFactory = lectureListFactory
        self.postListFactory = postListFactory
        self.clubListFactory = clubListFactory
        self.myPageFactory = myPageFactory
        UITabBar.appearance().scrollEdgeAppearance = .init()
    }

    var body: some View {
        TabView(selection: $selection) {
            mainFactory.makeView()
                .eraseToAnyView()
                .tag(TabFlow.home)
                .tabItem {
                    BitgouelAsset.Icons.home.swiftUIImage
                        .renderingMode(.template)

                    Text("홈")
                }

            lectureListFactory.makeView()
                .eraseToAnyView()
                .tag(TabFlow.lecture)
                .tabItem {
                    BitgouelAsset.Icons.laptop.swiftUIImage
                        .renderingMode(.template)

                    Text("강의")
                }

            postListFactory.makeView()
                .eraseToAnyView()
                .tag(TabFlow.post)
                .tabItem {
                    BitgouelAsset.Icons.messageFill.swiftUIImage .renderingMode(.template)

                    Text("게시글")
                }

            clubListFactory.makeView()
                .eraseToAnyView()
                .tag(TabFlow.club)
                .tabItem {
                    BitgouelAsset.Icons.person3Fill.swiftUIImage .renderingMode(.template)

                    Text("동아리")
                }

            myPageFactory.makeView()
                .eraseToAnyView()
                .tag(TabFlow.userInfo)
                .tabItem {
                    BitgouelAsset.Icons.person.swiftUIImage
                        .renderingMode(.template)

                    Text("내 정보")
                }
        }
        .environment(\.tabbarHidden, $tabbarHidden)
        .onChange(of: tabbarHidden) { newValue in
            isHiddenTabbar(newValue)
        }
    }
}

import SwiftUI

struct LectureLocationView: View {
    @State var draw: Bool = false
    @Binding var lectureLocation: Location?

    var body: some View {
        KakaoMapView(
            draw: $draw,
            location: $lectureLocation
        ).onAppear {
            self.draw = true
        }.onDisappear {
            self.draw = false
        }
        .frame(width: 296, height: 252)
    }
}

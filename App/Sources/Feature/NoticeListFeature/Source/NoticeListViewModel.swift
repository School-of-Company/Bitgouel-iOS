import Foundation
import Service

final class NoticeListViewModel: BaseViewModel {
    @Published var isPresentedInquiryListView: Bool = false
    
    func updateIsPresentedInquiryListView(isPresented: Bool) {
        isPresentedInquiryListView = isPresented
    }
    
    func onAppear() {
        #warning("TODO: 공지사항 리스트 조회 추가")
    }
}

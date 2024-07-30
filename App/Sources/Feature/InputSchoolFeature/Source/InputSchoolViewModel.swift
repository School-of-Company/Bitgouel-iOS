import Foundation
import SwiftUI
import UIKit
import Service

final class InputSchoolViewModel: BaseViewModel {
    @Published var isShowingImagePicker: Bool = false
    @Published var isShowingLineBottomSheet: Bool = false
    @Published var isShowingDeleteAlert: Bool = false
    @Published var isPresentedSuccessView: Bool = false
    @Published var isPresentedInputClubView: Bool = false
    @Published var selectedUIImage: UIImage?
    @Published var image: Image?
    @Published var schoolName: String = ""
    @Published var selectedLine: LineType?
    @Published var departmentList: [String] = []
    let state: String
    let schoolInfo: SchoolDetailInfoModel

    init(
        state: String,
        schoolInfo: SchoolDetailInfoModel
    ) {
        self.state = state
        self.schoolInfo = schoolInfo
    }

    func loadImage() {
        guard let selectedImage = selectedUIImage else { return }
        image = Image(uiImage: selectedImage)
    }

    func updateIsShowingImagePicker(isShowing: Bool) {
        isShowingImagePicker = isShowing
    }

    func updateIsShowingLineBottomSheet(isShowing: Bool) {
        isShowingLineBottomSheet = isShowing
    }

    func updateIsShowingDeleteAlert(isShowing: Bool) {
        isShowingDeleteAlert = isShowing
    }

    func updateIsPresentedSuccessView(isPresented: Bool) {
        isPresentedSuccessView = isPresented
    }

    func updateIsPresentedInputClubView(isPresented: Bool) {
        isPresentedInputClubView = isPresented
    }

    func updateSelectedLine(line: LineType) {
        selectedLine = line
    }

    func deleteDepartment(index: Int) {
        departmentList.remove(at: index)
    }

    func appendDepartment() {
        departmentList.append("")
    }

    func onApper() {
        schoolName = schoolInfo.name
        selectedLine = schoolInfo.line
        departmentList = schoolInfo.departmentList
    }

    @MainActor
    func createdSchool(_ success: @escaping () -> Void) {
        #warning("학교 생성 기능 추가")
        success()
    }

    @MainActor
    func deleteSchool(_ success: @escaping () -> Void) {
        #warning("학교 삭제 기능 추가")
        success()
    }

    @MainActor
    func modifySchool(_ success: @escaping () -> Void) {
        #warning("학교 수정 기능 추가")
        success()
    }
}

import SwiftUI
import Combine

public struct CommonSignUpView: View {
    @State var isAssociation: Bool = false
    @State var isSchool: Bool = false
    @State var isExternal: Bool = false
    @StateObject var viewModel: CommonSignUpViewModel
    
    public var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text(viewModel.titleMessage)
                    .bitgouelFont(.title1)
                
                Spacer()
            }
            .padding(.top, 24)
            .padding(.leading, 28)
            
            HStack {
                Text(viewModel.subtitleMessage)
                    .bitgouelFont(.text2)
                    .foregroundColor(.bitgouel(.greyscale(.g4)))
                
                Spacer()
            }
            .padding(.leading, 28)
            .padding(.bottom, 32)
            
            if !viewModel.association.isEmpty {
                VStack {
                    AssociationSelectButton(
                        text: viewModel.jobType
                    ) {
                        if viewModel.association == "학교" {
                            isSchool.toggle()
                        } else if viewModel.association == "외부" {
                            isExternal.toggle()
                        }
                    }
                    .padding(.horizontal, 28)
                    .padding(.bottom, 16)
                }
            }
            
            VStack {
                AssociationSelectButton(
                    text: viewModel.associationType
                ) {
                    isAssociation.toggle()
                }
                .padding(.horizontal, 28)
                .padding(.bottom, 16)
                
                Spacer()
            }
        }
        
        .bitgouelBottomSheet(
            isShowing: $isSchool, cornerRadius: 8
        ) {
            schoolTypeView()
        }
        
        .bitgouelBottomSheet(
            isShowing: $isExternal, cornerRadius: 8
        ) {
            externalTypeView()
        }
        
        .bitgouelBottomSheet(
            isShowing: $isAssociation, cornerRadius: 8
        ) {
            associationTypeView()
        }
    }
    
    @ViewBuilder
    func schoolTypeView() -> some View {
        ScrollView {
            ForEach(viewModel.getSchoolType, id: \.self) { school in
                HStack {
                    Text(school.schoolValue())
                    
                    Spacer()
                    
                    BitgouelRadioButton(
                        isSelected: Binding(
                            get: { viewModel.school == school.schoolValue() },
                            set: { isSelected in
                                if isSelected {
                                    isSchool = false
                                    viewModel.school = school.schoolValue()
                                    viewModel.jobType = school.schoolValue()
                                }
                            }
                        )
                    )
                }
                .padding(.horizontal, 28)
                .padding(.vertical, 24)
            }
        }
    }
    
    @ViewBuilder
    func externalTypeView() -> some View {
        ScrollView {
            ForEach(viewModel.getExternalType, id: \.self) { external in
                HStack {
                    Text(external.externalValue())
                    
                    Spacer()
                    
                    BitgouelRadioButton(
                        isSelected: Binding(
                            get: { viewModel.external == external.externalValue() },
                            set: { isSelected in
                                if isSelected {
                                    isExternal = false
                                    viewModel.external = external.externalValue()
                                    viewModel.jobType = external.externalValue()
                                }
                            }
                        )
                    )
                }
                .padding(.horizontal, 28)
                .padding(.vertical, 24)
            }
        }
    }
    
    @ViewBuilder
    func associationTypeView() -> some View {
        ScrollView {
            ForEach(viewModel.associationValue, id: \.self) { association in
                HStack {
                    Text(association.associationValue())
                    
                    Spacer()
                    
                    BitgouelRadioButton(
                        isSelected: Binding(
                            get: { viewModel.association == association.associationValue() },
                            set: { isSelected in
                                if isSelected {
                                    isAssociation = false
                                    viewModel.association = association.associationValue()
                                    viewModel.associationType = association.associationValue()
                                    if !viewModel.association.isEmpty {
                                        viewModel.resetJobType()
                                    }
                                }
                            }
                        )
                    )
                }
                .padding(.horizontal, 28)
                .padding(.vertical, 24)
            }
        }
    }
}

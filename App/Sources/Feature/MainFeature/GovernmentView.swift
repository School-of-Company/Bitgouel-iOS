import SwiftUI

struct GovernmentView: View {
    var governmentFirstText: String
    var governmentSecondText: String
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.bitgouel(.primary(.p5)))
                
                VStack {
                    Text(governmentFirstText)
                        .bitgouelFont(.text1, color: .primary(.p9))
                    
                    Text(governmentSecondText)
                        .bitgouelFont(.text1, color: .primary(.p9))
                }
            }
        }
    }
}

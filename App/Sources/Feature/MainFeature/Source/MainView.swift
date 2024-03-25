import SwiftUI

struct MainView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            Image("mainpage_image_1")
                .resizable()
                .padding(.bottom, 16)
            
            VStack(spacing: 64) {
                
                VStack(spacing: 64) {
                    BitgouelPromotionView()
                    
                    HighSchoolPromotionView()
                    
                    ClubPromotionView()
                }
                .padding(.horizontal, 28)
                
                TabView{
                    FutureTransportClubView()
                    
                    EnergyIndustryClubView()
                    
                    MedicalHealthClubView()
                    
                    AiFusionAndCompositeClubView()
                    
                    CultureIndustryClubView()
                }
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
                .frame(height: 1200)
                .padding(.bottom, 64)
                
                UniversityView()
                    .padding(.horizontal, 28)
                
                IntroduceView(
                    introduceTitle: "참여 기업 소개",
                    introduceText: ""
                )
                .padding(.horizontal, 28)
                
                TabView{
                    FutureTransportCompanyView()
                    
                    EnergyIndustryCompanyView()
                    
                    MedicalHealthCompanyView()
                    
                    AiFusionAndCompositeCompanyView()
                    
                    CultureIndustryCompanyView()
                }
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
                .frame(height: 720)
                .padding(.bottom, 64)
                
                GovernmentView()
                
                FAQView(faqList: .init())
                    .padding(.horizontal, 28)
                    .padding(.bottom, 40)
            }
        }
    }
}

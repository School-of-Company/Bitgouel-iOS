import SwiftUI

struct MainView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            Image("mainpage_image_1")
                .resizable()
                .padding(.bottom, 16)
            
            VStack {
                IntroduceView(
                    introduceTitle: "빛고을 직업교육 혁신지구",
                    introduceText: "지역발전 사업을 위해 당신이 필요해요"
                )
                
                JobDetailView(
                    jobDetailTitle: "🏫 직업계고",
                    jobDetailText: "  •  교육과정 운영\n  •  진로 지도\n  •  학생 관리"
                )
                
                JobDetailView(
                    jobDetailTitle: "🎓 지역대학",
                    jobDetailText: "  •  기업 연계 교육\n  •  심화 교육\n  •  후학습지원"
                )
                
                JobDetailView(
                    jobDetailTitle: "🏢 지역기업",
                    jobDetailText: "  •  현장 맞춤형 교육\n  •  현장실습\n  •  고졸 채용"
                )
                
                JobDetailView(
                    jobDetailTitle: "💼 유관기관",
                    jobDetailText: "  •  산업 인력 분석\n  •  특화프로그램 운영\n  •  고졸채용네트워크 구축"
                )
                .padding(.bottom, 64)
                
                IntroduceView(
                    introduceTitle: "직업계고 소개",
                    introduceText: "직업계고 계열별 학교현황 및 진로"
                )
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        Group {
                            VStack {
                                Image("gwangjuNaturalScienceHighSchool")
                                    .padding(.top, 5)
                                    .padding(.bottom, 13)
                                
                                Text("광주자연과학고등학교")
                                    .bitgouelFont(.caption, color: .greyscale(.g4))
                                    .padding(.bottom)
                            }
                            .padding(.trailing, 24)
                            
                            VStack {
                                Image("jeonnamTechnicalHighSchool")
                                    .padding(.bottom, 8)
                                
                                Text("전남공업고등학교")
                                    .bitgouelFont(.caption, color: .greyscale(.g4))
                                    .padding(.bottom)
                            }
                            .padding(.trailing, 24)
                            
                            VStack {
                                Image("sunguiScienceTechnologyHighSchool")
                                    .padding(.bottom, 8)
                                
                                Text("숭의과학기술고등학교")
                                    .bitgouelFont(.caption, color: .greyscale(.g4))
                                    .padding(.bottom)
                            }
                            .padding(.trailing, 24)
                            
                            VStack {
                                Image("dongilHighSchoolOfFutureScienceHighSchool")
                                    .padding(.bottom, 8)
                                
                                Text("동일미래과학고등학교")
                                    .bitgouelFont(.caption, color: .greyscale(.g4))
                                    .padding(.bottom)
                            }
                            .padding(.trailing, 24)
                            
                            VStack {
                                Image("jeonnamGirlsCommercialHighSchool")
                                    .padding(.bottom, 8)
                                
                                Text("전남여자상업고등학교")
                                    .bitgouelFont(.caption, color: .greyscale(.g4))
                                    .padding(.bottom)
                            }
                            .padding(.trailing, 24)
                            
                            VStack {
                                Image("seojinGirlsHighSchool")
                                    .padding(.bottom, 8)
                                
                                Text("서진여자고등학교")
                                    .bitgouelFont(.caption, color: .greyscale(.g4))
                                    .padding(.bottom)
                            }
                            .padding(.trailing, 24)
                            
                            VStack {
                                Image("gwangjuTechnicalHighSchool")
                                    .padding(.bottom, 8)
                                
                                Text("광주공업고등학교")
                                    .bitgouelFont(.caption, color: .greyscale(.g4))
                                    .padding(.bottom)
                            }
                            .padding(.trailing, 24)
                            
                            VStack {
                                Image("kumpaTechnicalHighSchool")
                                    .padding(.bottom, 8)
                                
                                Text("금파공업고등학교")
                                    .bitgouelFont(.caption, color: .greyscale(.g4))
                                    .padding(.bottom)
                            }
                            .padding(.trailing, 24)
                            
                            VStack {
                                Image("songwonGirlsCommercialHighSchool")
                                    .padding(.bottom, 8)
                                
                                Text("송원여자상업고등학교")
                                    .bitgouelFont(.caption, color: .greyscale(.g4))
                                    .padding(.bottom)
                            }
                            .padding(.trailing, 24)
                            
                            VStack {
                                Image("gwangjuAutomaticEquipmentTechnicalHighSchool")
                                    .padding(.bottom, 8)
                                
                                Text("광주자동화설비\n 공업고등학교")
                                    .bitgouelFont(.caption, color: .greyscale(.g4))
                            }
                            .padding(.trailing, 24)
                        }
                            
                        VStack {
                            Spacer()
                            
                            Image("gwangjuSoftwareMeisterHighSchool")
                                .padding(.bottom, 8)
                            
                            Spacer()
                            
                            Text(" 광주소프트웨어\n마이스터고등학교")
                                .bitgouelFont(.caption, color: .greyscale(.g4))
                        }
                        .padding(.trailing, 24)
                        
                        VStack {
                            Image("gwangjuElectronicTechnicalHighSchool")
                                .padding(.bottom, 10)
                            
                            Text("광주전자공업고등학교")
                                .bitgouelFont(.caption, color: .greyscale(.g4))
                                .padding(.bottom)
                        }
                        .padding(.trailing, 24)
                        
                        VStack {
                            Image("gwangjuGirlsCommercialHighSchool")
                                .padding(.bottom, 9)
                            
                            Text("광주여자상업고등학교")
                                .bitgouelFont(.caption, color: .greyscale(.g4))
                                .padding(.bottom)
                        }
                    }
                }
                .padding(.bottom, 64)
                
                IntroduceView(
                    introduceTitle: "취업동아리 소개",
                    introduceText: "Sample Text"
                )
                
                ClubRoleView(
                    clubRole: "취동샘",
                    clubRoleDetail: "취업동아리 담당교사\n동아리 운영",
                    clubRoleText: "  •  취업동아리 지도교사 멘토\n  •  동아리 학생 선발, 학생관리, 프로그램, 학생지원\n  •  전공기초 방과후 운영\n  •  컨설턴트 멘토 매칭 및 상담지"
                )
                
                ClubRoleView(
                    clubRole: "취동선후배",
                    clubRoleDetail: "취업동아리 선•후배\n협력 지지 활동",
                    clubRoleText: "  •  학교에서 끌어주고, 밀어주는 또래 멘토\n  •  졸업 후에는 현장 실무 및 비전 지원\n  •  재직 기업 채용 시 동아리 후배 추천"
                )
                
                ClubRoleView(
                    clubRole: "대학교수",
                    clubRoleDetail: "현장 실무형 교육 및 멘토",
                    clubRoleText: "  •  일학습병행 경로 선이수 학점 운영\n  •  대학 학과체험 프로그램, 채용 연계 지원\n  •  전공 심화 맞춤 교육\n  •  진로 지원 취업 동아리 1:1 멘토"
                )
                
                ClubRoleView(
                    clubRole: "기업 현장 교사",
                    clubRoleDetail: "기업 맞춤형 교육 및 멘토",
                    clubRoleText: "  •  현장중심직무체험, 직무교육운영\n  •  취업경로 학생 취업 연계 지원\n  •  현장 실무 중심 맞춤 지원 및 동아리 1:1 멘토"
                )
                
                ClubRoleView(
                    clubRole: "유관기관 강사",
                    clubRoleDetail: "현장 실무형 교육 및 멘토",
                    clubRoleText: "  •  취업경로 현장 실무형 맞춤 교육 운영\n  •  참여가업 채용 연계 지원\n  •  현장 실무 중심 지원 멘토 활동"
                )
            }
            .padding(.horizontal, 28)
            
            TabView{
                ClubView1()
                
                ClubView2()
                
                ClubView3()
                
                ClubView4()
                
                ClubView5()
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
            .frame(height: 1200)
            .padding(.bottom, 64)
            
            VStack {
                IntroduceView(
                    introduceTitle: "연계 대학 소개",
                    introduceText: "Sample Text"
                )
                
                UniversityView(
                    universityName: "송원대학교",
                    universityDepartment: "철도운전관제시스템과, 철도차량전기시스템과,\n미용예술학과, 철도운전경영과, 사회복지학과,\n간호학과, 건축공학과"
                )
                .padding(.top, 8)
                
                UniversityView(
                    universityName: "호남대학교",
                    universityDepartment: "로봇드론공학과, 전기공학과, 정보통신공학과,\n뷰티미용학과, 토목환경공학과, 외식조리학과,\n건축학과, 조경학과, 작업치료학과(수의사),\n경영학과"
                )
                
                UniversityView(
                    universityName: "조선이공대학교",
                    universityDepartment: "기계설기과, 자동화시스템과, 특수전군사학과,\n미래자동차과, 전자과, 하이테크 CAD/CAM과,\n호텔조리파티쉐과"
                )
                
                UniversityView(
                    universityName: "동강대학교",
                    universityDepartment: "AI융합기계과, K뷰티아트과, AI드론과,\n외식조리제빵과"
                )
                
                UniversityView(
                    universityName: "서영대학교",
                    universityDepartment: "자동차과, 전기과, 생명공학과, 뷰티미용과,\n치위생과, E크리에이터과"
                )
                
                UniversityView(
                    universityName: "남부대학교",
                    universityDepartment: "자동차기계공학과, 전기공학과, 항장미용학과,\n호텔조리학과"
                )
                .padding(.bottom, 40)
                
                IntroduceView(
                    introduceTitle: "참여 기업 소개",
                    introduceText: "Sample Text"
                )
            }
            .padding(.horizontal, 28)
            
            TabView{
                CompanyView1()
                
                CompanyView2()
                
                CompanyView3()
                
                CompanyView4()
                
                CompanyView5()
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
            .frame(height: 720)
            .padding(.bottom, 64)
            
            VStack {
                IntroduceView(
                    introduceTitle: "유관 기관 소개",
                    introduceText: "#혁신지구와_함께하는"
                )
            }
            .padding(.horizontal, 28)
            
            GovernmentView()
                .padding(.top, 20)
                .padding(.bottom, 120)
            
            VStack(spacing: 16) {
                HStack {
                    Image("gwangju_logo")
                        .padding(.trailing, 16)
                    
                    Image("gwangju")
                    
                    Spacer()
                }
                
                HStack {
                    Image("gwangju_education_logo")
                        .padding(.trailing, 16)
                    
                    Image("gwangju_education")
                    
                    Spacer()
                }
                
                HStack {
                    Text("©2023 [Copyright Holder] All Rights Reserved.")
                        .bitgouelFont(.caption, color: .greyscale(.g10))
                    
                    Spacer()
                }
            }
            .padding(.horizontal, 28)
            .padding(.vertical, 40)
            .background(Color.bitgouel(.primary(.p2)))
        }
    }
}

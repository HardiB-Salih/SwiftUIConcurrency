//
//  HomeView.swift
//  SwiftUIConcurrency
//
//  Created by HardiB.Salih on 6/30/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var courseViewModel: CourseViewModel
    @EnvironmentObject var modalManager: ModalManager
    var attributedString: AttributedString {
        var subject = AttributedString(courseViewModel.featuredSubject.rawValue)
        var container = AttributeContainer()
        if courseViewModel.featuredCourses.count > 0 {
            let color = Color.init(hex: courseViewModel.featuredCourses[0].colors[0]!)
            container.foregroundColor = color
        } else {
            container.foregroundColor = .purple
        }
        subject.mergeAttributes(container)
        return "Learn " + subject
    }
    
    var body: some View {
        
        
        
        
        ZStack(alignment: .top) {
            ScrollView {
                VStack(spacing: 0) {
                    HStack {
                        DateTitle(title: attributedString)
                            .frame(maxWidth: .infinity ,alignment: .leading)
                            .padding(.top, 16)
                        Spacer()
                        ProfileIcon()
                            .onTapGesture {
                                modalManager.showModal.toggle()
                            }
                    }.padding(.horizontal, 20)
                    
                    FeaturedCourseList(featuredCourses: courseViewModel.featuredCourses)
                        .padding(.top, 10)
                    
                    Text("All courses")
                        .fontWeight(.bold)
                        .padding(.horizontal, 20)
                        .font(.title2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 16)
                        .accessibilityAddTraits([.isHeader])

                    
                    CourseList(courses: courseViewModel.courses)
                        .padding(.top, 10)
                }
                
            }
            
            withAnimation(.easeIn){
                Color(.white).opacity(0.8)
                    .ignoresSafeArea()
                    .frame(height: 0)
            }
            
        }.navigationBarBackButtonHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(CourseViewModel())
            .environmentObject(ModalManager())
    }
}

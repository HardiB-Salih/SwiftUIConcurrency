//
//  ContentView.swift
//  SwiftUIConcurrency
//
//  Created by HardiB.Salih on 6/30/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var courseViewModel: CourseViewModel
    @EnvironmentObject var sectionViewModel : SectionViewModel
    @StateObject var modalManager = ModalManager()

    
    @State private var text = ""
    
    var body: some View {
        ZStack {
            TabView {
                NavigationView {
                    HomeView()
                        .environmentObject(modalManager)
                }
                .tabItem {
                    Image(systemName: "house")
                    Text("Learn now")
                }
                NavigationView {
                    SectionsView()
                }
                .tabItem {
                    Image(systemName: "square.stack.3d.down.right.fill")
                    Text("Sections")
                }
                
                AccountView()
                            .tabItem {
                                    Image(systemName: "person")
                                    Text("Account")
                            }
            }.task {
                await courseViewModel.fetch()
        }
            if modalManager.showModal {
                ModalManagerView()
                    .environmentObject(modalManager)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(CourseViewModel())
            .environmentObject(SectionViewModel())
    }
}

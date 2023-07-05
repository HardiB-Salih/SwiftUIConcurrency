//
//  SwiftUIConcurrencyApp.swift
//  SwiftUIConcurrency
//
//  Created by HardiB.Salih on 6/30/23.
//

import SwiftUI

@main
struct SwiftUIConcurrencyApp: App {
    @StateObject var courseViewModel = CourseViewModel()
    @StateObject var sectionViewModel = SectionViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(courseViewModel)
                .environmentObject(sectionViewModel)

        }
    }
}

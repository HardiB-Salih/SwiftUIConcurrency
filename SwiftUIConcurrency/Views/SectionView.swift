//
//  SectionView.swift
//  SwiftUIConcurrency
//
//  Created by HardiB.Salih on 7/5/23.
//

import SwiftUI

struct SectionView: View {
    @Environment(\.presentationMode) var presentationMode
    var course: Course
    var section: SectionsCollection.Section
    @State private var attributedString: AttributedString = ""
    
    var body: some View {
        ZStack(alignment: .top) {
            content
            
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    CloseButton()
                        .accessibilityLabel("Back")
                        .accessibilityHint("Go back")
                        .accessibilityAddTraits([.isButton])
                }
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.top, 16)
            .frame(maxWidth: .infinity)
            .frame(height: 44)
        }
        .navigationBarHidden(true)
    }
    
    var content: some View {
        ScrollView {
            SectionViewCover(course: course, section: section)
            
            Text(attributedString)
                .padding(16)
                .padding(.bottom, 30)
                .onAppear {
                    do {
                        attributedString = try AttributedString(
                            markdown: section.content)
                    } catch {
                        print("Couldn't parse: \(error)")
                    }
                }
            
        }
        .ignoresSafeArea()
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView(course: coursePreviewData, section: (coursePreviewData.sectionCollection?.sections[0])!)
    }
}

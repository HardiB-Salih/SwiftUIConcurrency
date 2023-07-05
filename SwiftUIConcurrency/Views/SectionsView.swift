//
//  SectionsView.swift
//  SwiftUIConcurrency
//
//  Created by HardiB.Salih on 7/5/23.
//

import SwiftUI

struct SectionsView: View {
    @EnvironmentObject var sectionViewModel: SectionViewModel
    @State private var searchText = ""

    var body: some View {
        VStack {
            SearchBar(text: $searchText) // Custom SearchBar component
                .padding(.horizontal)
            
            if searchText.isEmpty {
                SectionList()
            } else {
                let filteredSections = sectionViewModel.sections.filter { section in
                    section.title.localizedCaseInsensitiveContains(searchText)
                }
                List(filteredSections) { section in
                    Text(section.title)
                }
            }
        }
        .navigationTitle(Text("All Sections"))
        
    }
}


struct SectionsView_Previews: PreviewProvider {
    static var previews: some View {
        SectionsView()
            .environmentObject(SectionViewModel())
    }
}

struct SearchBar: View {
    @Binding var text: String

    var body: some View {
        HStack {
            TextField("Search", text: $text)
                .padding(.horizontal)
                .padding(.vertical, 8)
                .background(Color(.systemGray5))
                .cornerRadius(8)
            Button(action: {
                text = ""
            }) {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.gray)
                    .padding(.trailing, 8)
            }
        }
    }
}

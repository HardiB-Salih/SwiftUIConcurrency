//
//  SectionViewModel.swift
//  SwiftUIConcurrency
//
//  Created by HardiB.Salih on 7/5/23.
//

import Foundation
import Apollo
import ConcurrencyAPI
import SwiftUI

class SectionViewModel: ObservableObject {
    @Published public var sections: [SectionsDataCollection.SectionModel] = []
    @Published public private(set) var filteredSections: [SectionsDataCollection.SectionModel] = []

    private func querySections() async throws -> GraphQLResult<SectionQuery.Data>? {
        return await withCheckedContinuation { continuation in
            Network.shared.apollo.fetch(query: SectionQuery()) { result in
                switch result {
                case .success(let graphQLResult):
                    continuation.resume(returning: graphQLResult)
                case .failure(let error):
                    if let error = error as? Never {
                        continuation.resume(throwing: error)
                    }
                }
            }
        }
    }
    
    
    func fetch()  async {
        do {
            let result = try await querySections()
            if let sectionCollection = result?.data?.sectionCollection {
                // Unwrapping the optional result we get from Apollo
                // Processing the data into the model, and assigning it to the courses variable
                DispatchQueue.main.async { [self] in
                    self.sections = self.process(data: sectionCollection)
                }
            }
        } catch {
            DispatchQueue.main.async {
                print("Error \(error)")
            }
        }
    }
    
    
    private func process(data: SectionsCollectionData) -> [SectionsDataCollection.SectionModel] {
        let content = SectionsDataCollection.init(data)
        return content.sections
    }
    
    // Use this for Pull to Refresh
    func randomizeSections() async {
            sections.shuffle()
    }
    
    //This to update a add the Pined to the top
    func orderSectionsByPinned() {
            sections.sort { $0.isPinned && !$1.isPinned }
    }
    
//    // To filter the data
//    func filterSections(for text: String) {
//            filteredSections = []
//        let searchText = text.lowercased()
//
//        sections.forEach { section in
//            let searchContent = section.title
//            if searchContent.lowercased().range(of: searchText, options: .regularExpression) != nil {
//                filteredSections.append(section)
//            }
//        }
//    }
    
    func filterSections(for text: String) {
        filteredSections = []
        let searchText = text.lowercased()

        sections.forEach { section in
            let searchContent = section.title.lowercased()
            if searchContent.contains(searchText) {
                filteredSections.append(section)
            }
        }
    }


}

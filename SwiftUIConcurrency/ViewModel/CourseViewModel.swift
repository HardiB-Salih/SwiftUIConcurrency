//
//  CourseViewModel.swift
//  SwiftUIConcurrency
//
//  Created by HardiB.Salih on 7/4/23.
//

import Foundation
import ConcurrencyAPI
import Apollo


enum FeaturedSubject: String, CaseIterable {
    case SwiftUI = "SwiftUI"
    case Design = "Design"
}



class CourseViewModel: ObservableObject {
    @Published public private(set) var courses: [Course] = []
    var featuredSubject: FeaturedSubject = FeaturedSubject.allCases.randomElement() ?? .SwiftUI
    @Published public private(set) var featuredCourses: [Course] = []
    
    
    
    private func queryCourses() async throws -> GraphQLResult<CourseQuery.Data>? {
        return await withCheckedContinuation { continuation in
//            let preferredLanguage = Locale.preferredLanguages[0]
//            let locale = preferredLanguage.contains("fr") ? "fr-CA" : "en-US"
//            Network.shared.apollo.fetch(query: CourseQuery(locale: locale)) { result in
//                    // More code...
//            } // We Change it To this if we add Local to our project
            Network.shared.apollo.fetch(query: CourseQuery()) { result in
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
            let result = try await queryCourses()
            if let courseCollection = result?.data?.courseCollection {
                // Unwrapping the optional result we get from Apollo
                // Processing the data into the model, and assigning it to the courses variable
                DispatchQueue.main.async { [self] in
                    self.courses = self.process(data: courseCollection)
                    // Finding the featured courses, depending on the featuredSubject value
                    findFeaturedCourses()
                }
            }
        } catch {
            DispatchQueue.main.async {
                print("Error \(error)")
            }
        }
    }
    
    
    private func process(data: CoursesData) -> [Course] {
        let content = CoursesCollection.init(data)
        
        return content.courses
    }
    
    private func findFeaturedCourses() {
        guard courses.count > 0 else { return }
        
        featuredCourses = courses.filter { course in
            course.subject == featuredSubject.rawValue
        }
    }
    
}

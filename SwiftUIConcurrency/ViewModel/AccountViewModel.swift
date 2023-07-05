//
//  AccountViewModel.swift
//  SwiftUIConcurrency
//
//  Created by HardiB.Salih on 7/5/23.
//

import Foundation
class AccountViewModel: ObservableObject {
    func getUser() async throws -> User {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users/1") else {
            throw NetworkError.invalidURL
        }
        let urlRequest = URLRequest(url: url)
        
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        let decodedUser = try JSONDecoder().decode(User.self, from: data)
        return decodedUser
    }
    
    // Example of custom error type
    enum NetworkError: Error {
        case invalidURL
        case requestFailed
        // Add more error cases as needed
    }
    
    
    
    
    
    
    
//    func getUser() {
//        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users/1") else { fatalError("Missing URL") }
//
//        let urlRequest = URLRequest(url: url)
//
//        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
//            if let error = error {
//                print("Request error: ", error)
//                return
//            }
//
//            guard let response = response as? HTTPURLResponse else { return }
//
//            if response.statusCode == 200 {
//                guard let data = data else { return }
//                DispatchQueue.main.async {
//                    do {
//                        let decodedUser = try JSONDecoder().decode(User.self, from: data)
//                        print("decodedUser", decodedUser)
//                    } catch let error {
//                        print("Error decoding: ", error)
//                    }
//                }
//            }
//        }
//
//        dataTask.resume()
//    }
}

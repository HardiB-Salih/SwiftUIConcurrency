//
//  Network.swift
//  SwiftUIConcurrency
//
//  Created by HardiB.Salih on 7/4/23.
//

import Foundation
import Apollo

class Network {
    static let shared = Network()

    let url = "https://graphql.contentful.com/content/v1/spaces/<YOUR_SPACE_ID>?access_token=<YOUR_ACCESS_TOKEN>"
    
    private(set) lazy var apollo = ApolloClient(url: URL(string: url)!)

}

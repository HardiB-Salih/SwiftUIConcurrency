//
//  AccountView.swift
//  SwiftUIConcurrency
//
//  Created by HardiB.Salih on 7/5/23.
//

import SwiftUI

struct AccountView: View {
    @StateObject var accountViewModel = AccountViewModel()
    @State private var user: User?

    
    var body: some View {
        VStack {
            if let user = user {
                ProfileCard(user: user)
                    .padding(.horizontal, 8)
            }else {
                Text("No user")
            }
            
        }.task {
            do {
                user = try await accountViewModel.getUser()
            } catch {
                print("Error while fetching user: ", error.localizedDescription)
            }
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
            .environmentObject(AccountViewModel())
    }
}

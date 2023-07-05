//
//  ModalManagerView.swift
//  SwiftUIConcurrency
//
//  Created by HardiB.Salih on 7/5/23.
//

import SwiftUI

struct ModalManagerView: View {
    @EnvironmentObject var modalManager: ModalManager

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.black.opacity(0.5))
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    modalManager.showModal.toggle()
                    modalManager.activeModal = .signIn
                }
            
            switch modalManager.activeModal {
            case .signIn:
                SignInView()
            case .signUp:
                SignUpView()
            case .resetPassword:
                ResetPasswordView()
            }
            
        }
    }
}

struct ModalManagerView_Previews: PreviewProvider {
    static var previews: some View {
        ModalManagerView()
            .environmentObject(ModalManager())
    }
}

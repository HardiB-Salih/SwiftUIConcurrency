//
//  ModalManager.swift
//  SwiftUIConcurrency
//
//  Created by HardiB.Salih on 7/5/23.
//

import Foundation


class ModalManager: ObservableObject {
    enum ActiveModals {
            case signIn
            case signUp
            case resetPassword
    }
    
    @Published public var showModal: Bool = false
    @Published public var activeModal: ActiveModals = .signIn
}

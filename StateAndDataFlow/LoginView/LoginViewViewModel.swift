//
//  LoginViewViewModel.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 22.04.2024.
//

import Foundation

final class LoginViewViewModel: ObservableObject {
    @Published var name = ""
    @Published var isLoggedIn = false
    
    private var isNameValid: Bool {
        return name.count >= 3
    }
    
    func login() {
        if isNameValid {
            isLoggedIn.toggle()
        }
    }
    
    func resetName() {
        name = ""
    }
}

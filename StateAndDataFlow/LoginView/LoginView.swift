//
//  LoginView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 22.04.2024.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var loginViewVM: LoginViewViewModel
    @State private var characterCount = 0
    
    private var isNameValid: Bool {
        characterCount >= 3
    }
    
    var body: some View {
        VStack {
            HStack{
                TextField("Enter your name", text: $loginViewVM.name)
                    .multilineTextAlignment(.center)
                    .onChange(of: loginViewVM.name) {_, newValue in
                        characterCount = newValue.count
                    }
                Text("\(characterCount)")
                    .foregroundColor(characterCount >= 3 ? .green : .red)
            }
            Button(action: loginViewVM.login) {
                Label("OK", systemImage: "checkmark.circle")
            }
            .disabled(!isNameValid)
            .foregroundColor(isNameValid ? .blue : .gray)
        }
        .padding()
    }
}

#Preview {
    LoginView()
        .environmentObject(LoginViewViewModel())
}

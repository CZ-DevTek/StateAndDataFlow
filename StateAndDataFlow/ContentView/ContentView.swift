//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 22.04.2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var contentViewVM: ContentViewViewModel
    @EnvironmentObject private var loginViewVM: LoginViewViewModel
    @State private var navigateToLogin = false
    
    var body: some View {
        VStack {
            Text("Hi, \(loginViewVM.name)")
                .font(.title)
                .padding(.top, 100)
            
            Text(contentViewVM.counter.formatted())
                .font(.largeTitle)
                .padding(.top, 100)
                
            Spacer()
            
            ButtonView(contentViewVM: contentViewVM)
            
            Spacer()
            
            ButtonLogout(contentViewVM: contentViewVM)
        }
        .padding()
        .onChange(of: contentViewVM.navigateToLogin) { _, shouldNavigate in
            if shouldNavigate {
                loginViewVM.isLoggedIn = false
            }
        }
    }
}

#Preview {
    ContentView()
        .environment(ContentViewViewModel())
        .environmentObject(LoginViewViewModel())
}

struct ButtonView: View {
    @Bindable var contentViewVM: ContentViewViewModel
    
    var body: some View {
        Button(action: contentViewVM.startTimer) {
            Text(contentViewVM.buttonTitle)
        }
        .modifier(ButtonViewModifier(viewModel: contentViewVM, background: .red))
       
    }
}

struct ButtonLogout: View {
    @Bindable var contentViewVM: ContentViewViewModel
    @EnvironmentObject var loginViewVM: LoginViewViewModel
    var body: some View {
        Button(action: contentViewVM.buttonDidPressed) {
            Text(contentViewVM.buttonName)
            loginViewVM.resetName()
        }
        .modifier(ButtonViewModifier(viewModel: contentViewVM, background: .blue))
    }
}


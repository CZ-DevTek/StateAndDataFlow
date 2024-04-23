//
//  ButtonModifier.swift
//  StateAndDataFlow
//
//  Created by Carlos Garcia Perez on 23/4/24.
//

import SwiftUI

enum BackgroundColor {
    case blue, red
    
    var color: Color {
        switch self {
        case .blue:
            return .blue
        case .red:
            return .red
        }
    }
}

struct ButtonViewModifier: ViewModifier {
    @Bindable var viewModel: ContentViewViewModel
    let background: BackgroundColor
    
    func body(content: Content) -> some View {
        content
            .font(.title)
            .fontWeight(.bold)
            .foregroundStyle(.white)
            .frame(width: 200, height: 60)
            .background(background.color)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.black, lineWidth: 4)
            )
    }
}

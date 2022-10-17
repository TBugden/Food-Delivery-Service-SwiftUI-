//
//  Extensions.swift
//  Food Delivery Service (SwiftUI)
//
//  Created by Jesse Chan on 10/10/22.
//

import SwiftUI

extension Color {
    static let softBlack = Color("softBlack")
    static let neonGreen = Color("neonGreen")
    static let darkGray = Color("darkGray")
}

public struct PlaceholderStyle: ViewModifier {
    var showPlaceHolder: Bool
    var placeholder: String
    let color: Color

    public func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            if showPlaceHolder {
                Text(placeholder)
                .padding(.horizontal, 15)
                .foregroundColor(color)
            }
            content
                .foregroundColor(Color.white)
            .padding(5.0)
        }
    }
}

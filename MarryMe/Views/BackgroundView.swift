//
//  BackgroundView.swift
//  MarryMe
//
//  Created by Doni on 12/13/22.
//

import SwiftUI

struct BackgroundView: View {
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]), startPoint: .topTrailing, endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(topColor: Color("Pink"), bottomColor: .white)
    }
}

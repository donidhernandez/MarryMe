//
//  CircleGroupView.swift
//  MarryMe
//
//  Created by Doni on 12/14/22.
//

import SwiftUI

struct CircleGroupView: View {
    
    @State var ShapeColor: Color
    @State var ShapeOpacity: Double
    @State var isAnimating: Bool = false
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 40)
                .frame(width: 200, height: 200, alignment: .center)
            
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 80)
                .frame(width: 200, height: 200, alignment: .center)
        }
        .scaleEffect(isAnimating ? 1 : 0.8)
        .opacity(isAnimating ? 1 : 0.8)
        .blur(radius: isAnimating ? 0 : 10)
        .animation(Animation
            .easeInOut(duration: 1.5)
            .repeatForever()
        ,value: isAnimating)
        .onAppear{
            isAnimating = true
        }
    }
}

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        CircleGroupView(ShapeColor: Color("Purple"), ShapeOpacity: 0.7)
            .preferredColorScheme(.dark)
    }
}

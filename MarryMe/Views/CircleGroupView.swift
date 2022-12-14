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
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 40)
                .frame(width: 200, height: 200, alignment: .center)
            
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 80)
                .frame(width: 200, height: 200, alignment: .center)
        }
        
    }
}

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        CircleGroupView(ShapeColor: Color("Purple"), ShapeOpacity: 0.7)
            .preferredColorScheme(.dark)
    }
}

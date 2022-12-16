//
//  HomeView.swift
//  MarryMe
//
//  Created by Doni on 12/14/22.
//

import SwiftUI

struct HomeView: View {
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            VStack {
                Spacer()
                
                ZStack {
                    
                    CircleGroupView(ShapeColor: Color("Purple"), ShapeOpacity: 0.7)
                    
                    Image("Gift")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                }
                Text("I give my heart to you!")
                    .font(Font.custom("Hello Sweets", size: 60))
                    .foregroundColor(Color("Purple"))
                    .multilineTextAlignment(.center)
                
                Text("I'm eternally yours")
                    .font(Font.custom("Hello Sweets", size: 35))
                    .fontWeight(.black)
                    .padding(1)
                
                Spacer()
                
                Button {
                    isOnboardingViewActive = true
                } label: {
                    Image(systemName: "heart.fill")
                    Text("Yes I do")
                }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                .controlSize(.large)

            }
            .padding()
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

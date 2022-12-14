//
//  OnboardingView.swift
//  MarryMe
//
//  Created by Doni on 12/13/22.
//

import SwiftUI

struct OnboardingView: View {
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    
    @State private var isAnimating: Bool = false
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = .zero
    
    var body: some View {
        ZStack {
            
            Color("Purple")
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                VStack(spacing: 0) {
                    Text("Would You Be My Wife?")
                }
                .font(Font.custom("Hello Sweets", size: 65))
                .foregroundColor(.white.opacity(0.9))
                .multilineTextAlignment(.center)
                
                Text("""
                    Thank you for being part of my life.
                    I love you so much!!
                    """)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.horizontal, 10)
                .multilineTextAlignment(.center)
                
                
                ZStack {
                    
                    CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.4)
                    
                    Image("Ring")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 240, height: 240)
                }
                .padding()
                
                Spacer()
                
                
                ZStack {
                    Capsule()
                        .fill(.white.opacity(0.7))
                    
                    Capsule()
                        .fill(.white.opacity(0.7))
                        .padding(8)
                    
                    Text("Answer")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(Color("Purple"))
                        .offset(x: 20)
                    
                    HStack {
                        Capsule()
                            .fill(Color("Pink"))
                            .frame(width: buttonOffset + 80)
                        Spacer()
                    }
                    
                    HStack {
                        ZStack {
                            Circle()
                                .foregroundColor(.accentColor.opacity(0.2))
                            
                            Circle()
                                .foregroundColor(.black.opacity(0.15))
                                .padding(8)
                            
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .heavy))
                        }
                        .offset(x: buttonOffset)
                        .frame(width: 80, height: 80, alignment: .center)
                        .foregroundColor(.white)
                        .onTapGesture {
                            isOnboardingViewActive = false
                        }
                        
                        Spacer()
                    }
                }
                .frame(width: buttonWidth, height: 80, alignment: .center)
                .padding()
                
                
            }
            .padding()
        }
        .onAppear {
            isAnimating = true
        }
        
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

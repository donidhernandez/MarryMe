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
    @State private var imageOffset: CGSize = .zero
    @State private var indicatorOpacity: Double = 0
    @State private var titleText = "Would You Be My Wife?"
    
    var body: some View {
        ZStack {
            
            Color("Purple")
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                VStack(spacing: 0) {
                    Text(titleText)
                }
                .id(titleText)
                .font(Font.custom("Hello Sweets", size: 65))
                .foregroundColor(.white.opacity(0.9))
                .multilineTextAlignment(.center)
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : -40)
                .animation(.easeOut(duration: 2), value: isAnimating)
                
                Text("""
                    Thank you for being part of my life.
                    I love you so much!!
                    """)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.horizontal, 10)
                .multilineTextAlignment(.center)
                .offset(y: isAnimating ? 0 : 30)
                .opacity(isAnimating ? 1 : 0)
                .animation(.easeOut(duration: 2), value: isAnimating)
                
                
                ZStack {
                    
                    CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.4)
                        .offset(x: imageOffset.width * -1)
                        .blur(radius: abs(imageOffset.width / 5))
                        .animation(.easeOut(duration: 1), value: imageOffset)
                    
                    Image("Ring")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 240, height: 240)
                        .offset(x: imageOffset.width * 1.3, y: isAnimating ? -10 : 10)
                        .animation(Animation.easeInOut(duration: 1.5).repeatForever().delay(2), value: isAnimating)
                        .rotationEffect(.degrees(Double(imageOffset.width / 20)))
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    if abs(imageOffset.width) <= 150 {
                                        imageOffset = gesture.translation
                                        titleText = "I promise to make you happy!"
                                    }
                                }
                                .onEnded { _ in
                                    withAnimation(.easeInOut(duration: 1)) {
                                        imageOffset = .zero
                                        titleText = "Would You Be My Wife?"
                                    }
                                }
                        )
                }
                .padding()
                
                Spacer()
                
                
                ZStack {
                    Capsule()
                        .fill(.white.opacity(0.7))
                    
                    Capsule()
                        .fill(.white.opacity(0.7))
                        .padding(8)
                    
                    Text("Say Yes!")
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
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80 {
                                        buttonOffset = gesture.translation.width
                                    }
                                }.onEnded { _ in
                                    withAnimation(.easeInOut(duration: 2)) {
                                        if buttonOffset > buttonWidth / 2 {
                                            buttonOffset = buttonWidth - 80
                                            isOnboardingViewActive = false
                                        } else {
                                            buttonOffset = 0
                                        }
                                    }
                                }
                        )
                        
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

//
//  SplashScreen.swift
//  MarryMe
//
//  Created by Doni on 12/12/22.
//

import SwiftUI

struct SplashScreenView: View {

    @State var animationFinished: Bool = false
    @State var scale = 0.4
    @State var opacity = 0.4
 
    var body: some View {
        if animationFinished {
            ContentView()
        } else {
            ZStack {
                Color("BG")
                    .ignoresSafeArea()
                
                VStack {
                    VStack {
                        Image("Hearts")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 280, height: 280)
                        
                        Text("Marry Me")
                            .font(.custom("Hello Sweets", size: 80))
                            .foregroundColor(.white)
                    }
                    .scaleEffect(scale)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 2)) {
                            self.scale = 1.2
                            self.opacity = 1.00
                        }
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                        withAnimation {
                            animationFinished = true
                        }
                    }
                }
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}

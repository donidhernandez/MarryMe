//
//  ContentView.swift
//  MarryMe
//
//  Created by Doni on 12/11/22.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    
     var body: some View {
         if isOnboardingViewActive {
             OnboardingView()
         } else {
             HomeView()
         }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

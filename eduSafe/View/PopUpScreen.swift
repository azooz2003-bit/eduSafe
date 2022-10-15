//
//  PopUpScreen.swift
//  eduSafe
//
//  Created by Abdulaziz Albahar on 10/14/22.
//

import SwiftUI

struct PopUpScreen: View {
    @State var loginPressed = false

    var body: some View {
        NavigationStack {
            VStack {
                
                NavigationLink(destination: LoginScreen().navigationBarBackButtonHidden(true), isActive: $loginPressed) {
                    EmptyView()
                }
                
                Button(action: {
                    
                }) {
                    
                }
                
                Button(action: {
                    
                }) {
                    //label
                }
                
                
                
            }
        }
    }
}

struct PopUpScreen_Previews: PreviewProvider {
    static var previews: some View {
        PopUpScreen()
    }
}

//
//  PopUpScreen.swift
//  eduSafe
//
//  Created by Abdulaziz Albahar on 10/14/22.
//

import SwiftUI

struct PopUpScreen: View {
    @State var loginPressed = false
    @State var showAlert = false
    @EnvironmentObject var userVM: UserViewModel

    var body: some View {
        NavigationStack {
            VStack {
                
                
                
                Button(action: {
                    loginPressed = true
                }) {
                    
                }.padding(.init(top: 50, leading: 0, bottom: 0, trailing: 0))
                
                Button(action: {
                    
                }) {
                    //label
                }.padding(EdgeInsets.init(top: 100, leading: 0, bottom: 100, trailing: 0)).frame(width: 600, height: 100, alignment: .center).shadow(radius: 4).alert("Invalid field or error 404.", isPresented: $showAlert) {
                    Button("OK", role: .cancel) { showAlert = false }
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

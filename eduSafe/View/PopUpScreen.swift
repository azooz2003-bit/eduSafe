//
//  PopUpScreen.swift
//  eduSafe
//
//  Created by Abdulaziz Albahar on 10/14/22.
//

import SwiftUI

struct PopUpScreen: View {
    @State var loginPressed = false
    @State var adminSetupPressed = false
    @State var showAlert = false
    @EnvironmentObject var userVM: UserViewModel

    var body: some View {
        NavigationStack {
            VStack {
                
                NavigationLink(destination: LoginScreen(), isActive: $loginPressed) {
                    EmptyView()
                }
                
                Button(action: {
                    loginPressed = true
                    print("clicked login")
                }) {
                    HStack {
                        Text("School Setup").foregroundColor(.white).fontWeight(Font.Weight.medium).font(.system(size: 30, design: .rounded))
                    }.frame(width: 400, height: 70, alignment: .center).background(Color.black).cornerRadius(8, antialiased: true).shadow(radius: 4)
                    
                }.padding(EdgeInsets.init(top: 100, leading: 20, bottom: 0, trailing: 20)).shadow(radius: 4).alert("Invalid field or error 404.", isPresented: $showAlert) {
                    Button("OK", role: .cancel) { showAlert = false }
                }
                
                Button(action: {
                    loginPressed = true
                    print("clicked login")
                }) {
                    Text("Login").foregroundColor(.white).fontWeight(Font.Weight.medium).font(.system(size: 30, design: .rounded)).frame(width: 400, height: 70, alignment: .center).background(Color.black).cornerRadius(8, antialiased: true).shadow(radius: 4)
                }.padding(EdgeInsets.init(top: 10, leading: 20, bottom: 100, trailing: 20)).shadow(radius: 4).alert("Invalid field or error 404.", isPresented: $showAlert) {
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

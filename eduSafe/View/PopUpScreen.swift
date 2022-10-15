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
                        
                        Label("", systemImage: "arrow.right").foregroundColor(.white).font(.largeTitle).bold()
                    }.frame(minWidth: 200, maxWidth: 400, minHeight: 60, maxHeight: 75, alignment: .center).background(Color.gray).cornerRadius(20, antialiased: true).shadow(radius: 2)
                    
                }.padding(EdgeInsets.init(top: 100, leading: 20, bottom: 0, trailing: 20)).shadow(radius: 4).alert("Invalid field or error 404.", isPresented: $showAlert) {
                    Button("OK", role: .cancel) { showAlert = false }
                }
                
                Button(action: {
                    loginPressed = true
                    print("clicked login")
                }) {
                    HStack {
                        Text("Login").foregroundColor(.white).fontWeight(Font.Weight.medium).font(.system(size: 30, design: .rounded))
                        Label("", systemImage: "arrow.right").foregroundColor(.white).font(.largeTitle).bold()
                    }.frame(minWidth: 200, maxWidth: 400, minHeight: 60, maxHeight: 75, alignment: .center).background(Color.black).cornerRadius(20, antialiased: true).shadow(radius: 2)
                    
                }.padding(EdgeInsets.init(top: 10, leading: 20, bottom: 30, trailing: 20)).shadow(radius: 4).alert("Invalid field or error 404.", isPresented: $showAlert) {
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

//
//  LoginScreen.swift
//  eduSafe
//
//  Created by Abdulaziz Albahar on 10/14/22.
//

import SwiftUI

struct LoginScreen: View {
    @State var email = ""
    @State var password = ""
    @State var showAlert = false
    var fieldsFilled: Bool {
        !email.isEmpty && !password.isEmpty
    }
    
    @EnvironmentObject var userVM: UserViewModel
    
    var body: some View {
        VStack {
            Text("Login").fontWeight(Font.Weight.bold).font(.system(size: 65, design: .rounded)).padding(EdgeInsets(top: 30, leading: 0 , bottom: 200, trailing: 0))
            Text("Email").fontWeight(.bold).foregroundColor(.gray).frame(minWidth: 200, maxWidth: 400, minHeight: 60, maxHeight: 75, alignment: .leading).padding(.leading).font(Font.system(.title2))
            TextField("jsmith99@gmail.com" + "", text: $email).frame(minWidth: 200, maxWidth: 400, alignment: .leading).padding(.leading).font(.system(.title3, design: .rounded)).disableAutocorrection(true).autocapitalization(.none).keyboardType(.emailAddress)
            Divider().padding(.leading).padding(.trailing)
            Text("Password").fontWeight(.bold).foregroundColor(.gray).frame(minWidth: 200, maxWidth: 400, minHeight: 60, maxHeight: 75, alignment: .leading).padding(.leading).font(Font.system(.title2))
            SecureField("must contain 8+ characters", text: $password).frame(minWidth: 200, maxWidth: 400, alignment: .leading).padding(.leading).font(.system(.title3, design: .rounded)).disableAutocorrection(true).autocapitalization(.none)
            Divider().padding(.leading).padding(.trailing)
            
            Button(action: {
                print("proceed clicked")
            }) {
                HStack {
                    Text("Proceed").foregroundColor(.white).fontWeight(Font.Weight.medium).font(.system(size: 30, design: .rounded))
                }.frame(minWidth: 200, maxWidth: 400, minHeight: 60, maxHeight: 75, alignment: .center).background(Color.black).cornerRadius(20, antialiased: true).shadow(radius: 4)
                
            }.padding(EdgeInsets.init(top: 40, leading: 20, bottom: 20, trailing: 20)).shadow(radius: 4).alert("Invalid field or error 404.", isPresented: $showAlert) {
                Button("OK", role: .cancel) { showAlert = false }
            }.disabled(fieldsFilled)
        }
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}

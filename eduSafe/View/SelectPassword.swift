//
//  SelectPassword.swift
//  eduSafe
//
//  Created by Abdulaziz Albahar on 10/15/22.
//

import SwiftUI

struct SelectPassword: View {
    @State var password = ""
    @State var showAlert = false
    @State var passwordValidated = false
    @State var confirmPassword = ""

    
    var buttonColor: Color {
        if (!fieldsEmpty) {
            return Color(.black)
        } else {
            return Color(.gray)
        }
    }
    var fieldsEmpty: Bool {
        password.isEmpty
    }
    
    @EnvironmentObject var userVM: UserViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Set password").fontWeight(Font.Weight.bold).font(.system(size: 50, design: .rounded))
                Text("(Set permanent password)").padding(EdgeInsets(top: 0, leading: 0 , bottom: 200, trailing: 0)).italic().opacity(0.8).font(.title2)
                
                Text("Password").fontWeight(.bold).foregroundColor(.black).frame(minWidth: 200, maxWidth: 400, minHeight: 60, maxHeight: 75, alignment: .leading).padding(.leading).font(Font.system(.title2))
                SecureField("must contain 8+ characters", text: $password).frame(minWidth: 200, maxWidth: 400, alignment: .leading).padding(.leading).font(.system(.title3, design: .rounded)).disableAutocorrection(true).autocapitalization(.none)
                Divider().padding(.leading).padding(.trailing)
                
                Text("Confirm Password").fontWeight(.bold).foregroundColor(.black).frame(minWidth: 200, maxWidth: 400, minHeight: 60, maxHeight: 75, alignment: .leading).padding(.leading).font(Font.system(.title2))
                SecureField("confirm", text: $confirmPassword).frame(minWidth: 200, maxWidth: 400, alignment: .leading).padding(.leading).font(.system(.title3, design: .rounded)).disableAutocorrection(true).autocapitalization(.none)
                Divider().padding(.leading).padding(.trailing)
                
                
                Button(action: {
                    if (password != confirmPassword) {
                        showAlert = true
                    } else {
                        userVM.login(school: userVM.user!.schoolid, email: userVM.user!.email, password: password) { success in
                            if success {
                                passwordValidated = true
                            } else {
                                showAlert = true
                            }
                        }
                    }

                    
                }) {
                    
                    Text("Confirm").foregroundColor(.white).fontWeight(Font.Weight.medium).font(.system(size: 30, design: .rounded)).frame(minWidth: 200, maxWidth: 400, minHeight: 60, maxHeight: 75, alignment: .center).background(buttonColor).cornerRadius(20, antialiased: true).shadow(radius: 4)
                    
                }.disabled(fieldsEmpty).padding(EdgeInsets.init(top: 40, leading: 20, bottom: 20, trailing: 20)).shadow(radius: 4).alert("Invalid field or error 404.", isPresented: $showAlert) {
                    Button("OK", role: .cancel) { showAlert = false }
                }
                
            }
        }
        
        
        
    }
}

struct SelectPassword_Previews: PreviewProvider {
    static var previews: some View {
        SelectPassword()
    }
}

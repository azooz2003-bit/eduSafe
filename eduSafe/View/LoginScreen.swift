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
    @State var isAuthenticatedAndSynced = false
    @State var schoolChoice = ""
    
    var fieldsEmpty: Bool {
        email.isEmpty || password.isEmpty
    }
    var buttonColor: Color {
        if (!fieldsEmpty) {
            return Color(.black)
        } else {
            return Color(.gray)
        }
    }
    var view: LocationRequestView {
        // IF LOCATION APPROVED
        LocationRequestView()
    }
    
    @EnvironmentObject var userVM: UserViewModel
    
    var body: some View {
        NavigationStack {
            // NAV LINKS
            NavigationLink(destination: view, isActive: $isAuthenticatedAndSynced) {
                EmptyView()
            }
                        
            
            VStack {
                Text("Login").fontWeight(Font.Weight.bold).font(.system(size: 65, design: .rounded)).padding(EdgeInsets(top: 30, leading: 0 , bottom: 200, trailing: 0))
                
                Menu {
                    Button("yooo", action: {schoolChoice = "yooo"})
                    
                    //let fetchSchools = userVM.getSchools()
                    let schools = userVM.schools
                    
                    ForEach(schools, id: \.self.hashValue) { school in
                        
                        Button(action: {
                            schoolChoice = school
                        }) {
                            Text(school)
                        }
                    }
                    
                } label: {
                    if schoolChoice.isEmpty {
                        Label("School", systemImage: "graduationcap.circle.fill").font(.title)
                    } else {
                        Label(schoolChoice + " is selected.", systemImage: "graduationcap.circle.fill").font(.title)
                    }
                    
                }
                
                Text("Email").fontWeight(.bold).foregroundColor(.black).frame(minWidth: 200, maxWidth: 400, minHeight: 60, maxHeight: 75, alignment: .leading).padding(.leading).font(Font.system(.title2))
                TextField("jsmith99@gmail.com" + "", text: $email).frame(minWidth: 200, maxWidth: 400, alignment: .leading).padding(.leading).font(.system(.title3, design: .rounded)).disableAutocorrection(true).autocapitalization(.none).keyboardType(.emailAddress)
                Divider().padding(.leading).padding(.trailing)
                Text("Password").fontWeight(.bold).foregroundColor(.black).frame(minWidth: 200, maxWidth: 400, minHeight: 60, maxHeight: 75, alignment: .leading).padding(.leading).font(Font.system(.title2))
                SecureField("must contain 8+ characters", text: $password).frame(minWidth: 200, maxWidth: 400, alignment: .leading).padding(.leading).font(.system(.title3, design: .rounded)).disableAutocorrection(true).autocapitalization(.none)
                Divider().padding(.leading).padding(.trailing)
                
                Button(action: {
                    
                }) {
                    Text("Forgot password?").tint(.blue).padding(.top)
                }
                
                Button(action: {
                    userVM.login(school: schoolChoice, email: email, password: password) { success in
                        if success {
                            isAuthenticatedAndSynced = true
                        } else {
                            showAlert = true
                        }
                    }
                }) {
                    HStack {
                        Text("Proceed").foregroundColor(.white).fontWeight(Font.Weight.medium).font(.system(size: 30, design: .rounded))
                    }.frame(minWidth: 200, maxWidth: 400, minHeight: 60, maxHeight: 75, alignment: .center).background(buttonColor).cornerRadius(20, antialiased: true).shadow(radius: 4)
                    
                }.disabled(fieldsEmpty).padding(EdgeInsets.init(top: 40, leading: 20, bottom: 20, trailing: 20)).shadow(radius: 4).alert("Invalid field or error 404.", isPresented: $showAlert) {
                    Button("OK", role: .cancel) { showAlert = false }
                }
            }
        }
        
    }
    

}


struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen().environmentObject(UserViewModel())
    }
}

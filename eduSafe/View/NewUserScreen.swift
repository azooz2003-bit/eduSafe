//
//  NewUserScreen.swift
//  eduSafe
//
//  Created by Abdulaziz Albahar on 10/15/22.
//

import SwiftUI

struct NewUserScreen: View {
    @State var email = ""
    @State var password = ""
    @State var showAlert = false
    @State var isValidEmail = false
    @State var schoolChoice = ""
    
    var fieldsEmpty: Bool {
        email.isEmpty || schoolChoice.isEmpty
    }
    var buttonColor: Color {
        if (!fieldsEmpty) {
            return Color(.black)
        } else {
            return Color(.gray)
        }
    }
    
    @EnvironmentObject var userVM: UserViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink(destination: SelectPassword().environmentObject(userVM), isActive: $isValidEmail) {
                    EmptyView()
                }
                
                Text("New User").fontWeight(Font.Weight.bold).font(.system(size: 65, design: .rounded))
                Text("(Validate school account)").padding(EdgeInsets(top: 0, leading: 0 , bottom: 200, trailing: 0)).italic().opacity(0.8).font(.title2)
                Menu {
                    
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
                
                Button(action: {
                    
                    userVM.checkNewUser(school: schoolChoice, email: email) { success in
                        
                        if success {
                            isValidEmail = true
                            userVM.user! = User(email: email, uuid: "", name: "none", schoolid: schoolChoice)
                        } else {
                            print("ERROR ON NEW USER")
                            showAlert = true
                        }
                    }
                }) {
                    if (userVM.isAuthenticating) {
                        ProgressView().foregroundColor(.white).fontWeight(Font.Weight.medium).font(.system(size: 30, design: .rounded)).frame(minWidth: 200, maxWidth: 400, minHeight: 60, maxHeight: 75, alignment: .center).background(buttonColor).cornerRadius(20, antialiased: true).shadow(radius: 4)
                        
                    } else {
                        Text("Proceed").foregroundColor(.white).fontWeight(Font.Weight.medium).font(.system(size: 30, design: .rounded)).frame(minWidth: 200, maxWidth: 400, minHeight: 60, maxHeight: 75, alignment: .center).background(buttonColor).cornerRadius(20, antialiased: true).shadow(radius: 4)
                    }
                    
                    
                }.disabled(fieldsEmpty).padding(EdgeInsets.init(top: 40, leading: 20, bottom: 20, trailing: 20)).shadow(radius: 4).alert("Invalid field or error 404.", isPresented: $showAlert) {
                    Button("OK", role: .cancel) { showAlert = false }
                }
            }
        }
        
    }
}

struct NewUserScreen_Previews: PreviewProvider {
    static var previews: some View {
        NewUserScreen().environmentObject(UserViewModel())
    }
}

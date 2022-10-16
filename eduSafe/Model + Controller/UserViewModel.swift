//
//  UserViewModel.swift
//  eduSafe
//
//  Created by Abdulaziz Albahar on 10/14/22.
//

import Foundation
import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseAuth

class UserViewModel: ObservableObject {
    @Published var user: User?
    
    @Published var isAuthenticating: Bool = false
    private let auth = Auth.auth()
    private let db = Firestore.firestore()
        
    var schools: [String] = []
    var uuid: String? {
        auth.currentUser?.uid
    }
    var userIsAuthenticated: Bool {
        auth.currentUser != nil
    }
    var userIsAuthenticatedAndSynced: Bool {
        user != nil && userIsAuthenticated
    }
    
    func login(school: String, email: String, password: String, completion: @escaping (Bool) -> (Void)) {
        isAuthenticating = true
        
        auth.signIn(withEmail: email, password: password) { [weak self] result, error in
            
            
            if result == nil || error != nil {
                self?.isAuthenticating = false
                completion(false)
                return
            } else {
                print((self?.uuid)!)
                self?.checkNewUser(school: school, email: email) { success in
                    if success {
                        completion(true)
                    } else {
                        completion(false)
                        return
                    }
                }
                // check if self?.hasPassword, if not, then exit and go to the user setup page with send email
                self?.sync() { result in
                    print("Sync done:")
                    print(self?.user)
                    self?.isAuthenticating = false
                    completion(result)
                }
            }
        }
        
    }
    
    func sync(completion: @escaping (Bool) -> Void) {
        if !userIsAuthenticated {
            print("pre-sync abort")
            completion(false)
            return
        }
        db.collection("users").document(self.uuid!).getDocument { (document, error) in
            print(document!)
            if (document == nil || error != nil) {
                print("Error pre-sync")
                completion(false)
                return
            }
            
            do {
                try self.user = document!.data(as: User.self)
                print(try document!.data(as: User.self))
                completion(true)
            } catch {
                print("SYNC ERROR: \(error)")
                completion(false)
            }
        }
    }
    
    // WHEN SETTING NEW USER, TAKING SCHOOL FROM DROPDOWN AND EMAIL INPUT
    func checkNewUser(school: String, email: String, completion: @escaping (Bool) -> Void) {
        isAuthenticating = true
        db.collection("schools").document(school).getDocument { (document, error) in
            if (document == nil || error != nil) {
                print("Error pre-sync")
                completion(false)
                return
            }
            
            do {
                let usersDict = document!.data()!["validUsers"] as? Dictionary ?? ["": false]
                let users = (document!.data()!["validUsers"] as? Dictionary ?? ["":false]).keys
                if !users.contains(email) {
                    completion(false)
                    self.isAuthenticating = false
                } else {
                    completion(true)
                    self.user? = User(email: email, uuid: "", name: "none", schoolid: school)
                    self.isAuthenticating = false
                }
                print(try document!.data(as: User.self))
            } catch {
                print("SYNC ERROR: \(error)")
                completion(false)
                self.isAuthenticating = false
            }
        }
    }
    
    func createUserAuth(password: String, completion: @escaping (Bool) -> Void) {
        isAuthenticating = true
        auth.createUser(withEmail: user!.email, password: password) { [weak self] result, error in
            
            if error != nil {
                self!.isAuthenticating = false
                completion(false)
                return
            } else {
                
                self?.addData() { success in
                    completion(success)
                }
                self?.isAuthenticating = false
            }
              
            
        }
    }
    
    func addData(completion: @escaping (Bool) -> Void) {
        if !userIsAuthenticated {
            completion(false)
        }
        do {
            try db.collection("users").document(user!.uuid).setData(from: user)
            completion(true)
        } catch {
            completion(false)
        }
    }
    
    func fetchAllSchools() async {
        var school: [String] = []
        print(db.collection("schools").document("SOCH").documentID)
        do {
            let snap = try await db.collection("schools").getDocuments()
            snap.documents.forEach { docSnapshot in
                school.append(docSnapshot.documentID)
            }
            schools = school
            print(schools)
        } catch {
            print("error")
        }
        
    }
    
    func getSchools() {
       
        Task {
            await fetchAllSchools()
        }
        
        
    }
    
    
    
}
    


// authentication functions needed:
// sendPasswordEmail
// sendResetPasswordEmail
// updateUser (password and maybe name)
// logout
// createNewUser
//


// other functions:
// createAlert: after a user presses the alert button, make new alert object in user and in school




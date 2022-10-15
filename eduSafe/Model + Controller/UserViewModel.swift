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
    
    var uuid: String? {
        auth.currentUser?.uid
    }
    var userIsAuthenticated: Bool {
        auth.currentUser != nil
    }
    var userIsAuthenticatedAndSynced: Bool {
        user != nil && userIsAuthenticated
    }
    
    func login(email: String, password: String, completion: @escaping (Bool) -> (Void)) {
        isAuthenticating = true
        
        auth.signIn(withEmail: email, password: password) { [weak self] result, error in
            
            
            if result == nil || error != nil {
                self?.isAuthenticating = false
                completion(false)
                return
            } else {
                print((self?.uuid)!)
                
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
}

// authentication functions needed:
// sendPasswordEmail
// sendResetPasswordEmail
// updateUser (password and maybe name)
// logout


// other functions:
// createAlert: after a user presses the alert button, make new alert object in user and in school




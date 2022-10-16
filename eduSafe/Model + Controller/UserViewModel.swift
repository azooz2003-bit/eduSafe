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
    @Published var user: User? = User(email: "", uuid: "", name: "", schoolid: "")
    
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
                print(error)
                self?.isAuthenticating = false
                completion(false)
                return
            } else {
                print((self?.uuid)!)
                self?.checkNewUser(school: school, email: email) { success in
                    if success {
                        completion(true)
                        print("check success")
                    } else {
                        completion(false)
                        return
                        print("check failure")
                    }
                }
                // check if self?.hasPassword, if not, then exit and go to the user setup page with send email
                self?.sync() { result in
                    print("Sync " + result.description)
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
                    print("NOT FOUND")
                    completion(false)
                    self.isAuthenticating = false
                } else {
                    print("FOUND")
                    print("email is" + email)
                    
                    self.isAuthenticating = false
                    completion(true)
                }
                //print(try document!.data(as: User.self))
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
                print("create error: " + error!.localizedDescription)
                self!.isAuthenticating = false
                completion(false)
                return
            } else {
                self?.user?.uuid = self?.uuid ?? "no id"
                self?.addData() { success in
                    print("pre add was " + success.description)
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
            try db.collection("users").document((self.uuid)!).setData(from: user)
            completion(true)
        } catch {
            completion(false)
            print("adding data error")
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
    
    func displayAlerts() {
        var school: String = self.user!.schoolid
        var schoolDoc = db.collection("schools")
        
        // school = db.collection("users").document(uid).school
        // get alerts array in school:
        // alerts[] = db.collections("schools").document(school).alerts
        // for each alert in alerts:
        //      if alert.time < 2 hours
        //          printAlert(alert, school)
        
    }
    
    func printAlert(c:Coordinate, e:mapEdges) {
        let width: Float = e.top - e.bottom
        let height: Float = e.right - e.left
        if (c.lat < e.top && c.lat > e.bottom && c.lon < e.right && c.lon > e.left){
            let latPercent: Float = (e.top - c.lat) / height
            let lonPercent: Float = (e.right - c.lon) / width
            printAlertToMap(latPercent: Float, lonPercent: Float)
        }
    }
    
// dummy value: 42.383, -71.125
    
//    func displayAlerts() {
//        let school = auth.currentUser
//        let school = db.collection("users")
//    }
//
//
    // displayAlerts()
    // get schoolID from user:
    // let uid = auth.currentUser?.uid      (throw error if no user)
    // school = db.collection("users").document(uid).school
    // get alerts array in school:
    // alerts[] = db.collections("schools").document(school).alerts
    // for each alert in alerts:
    //      if alert.time < 2 hours
    //          printAlert(alert, school)

    // printAlert(c:coordinate, map:mapEdges)
    // width: Float = map.top-map.bottom
    // height: Float = map.right-map.left
    // if lat < map.top && lat > map.bottom && lon < map.right && lon > map.left:
    //      latPercent: Float = (map.top - lat) / height
    //      lonPercent: Float = (map.right - lon) / width
    //      printAlertToMap(latPercent: Float, lonPercent: Float):
        // make a red circle, along with a larger semi-transparent circle around it (length = radius)
        // transparencyMultiplier = (2hours - (0.75 * time))
        // visualAlert.opacity *= transparencyMultiplier
        // put the dot on the map at the location

    
    
    
}
    


//func getImage() {
//    let storage = Storage.storage()
//    let gsReference = storage.reference(forURL: "gs://edusafe-ffcb0.appspot.com/YaleProfile.jpeg")
//    //
//    gsReference.getData(maxSize: 1 * 1024 * 1024) { data, error in
//      if let error = error {
//          print(error)
//      } else {
//        return UIImage(data: data!)
//      }
//    }
//}


//
//islandRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
//  if let error = error {
//    // Uh-oh, an error occurred!
//  } else {
//    // Data for "images/island.jpg" is returned
//    let image = UIImage(data: data!)
//  }
//}


//
//  MapView.swift
//  eduSafe
//
//  Created by Abdulaziz Albahar on 10/15/22.
//

import SwiftUI
import FirebaseStorage

let gsReference = Storage.storage().reference(forURL: "gs://edusafe-ffcb0.appspot.com/YaleProfile.jpeg")


struct MapView: View {
    var body: some View {
        Image("Image")
//        UIImageView(image: <#T##UIImage?#>)
            
        
        // gs://edusafe-ffcb0.appspot.com/fake_school_blueprint.png
    }
}

//func bringImage() {
//    gsReference.getData(maxSize: 1 * 1024 * 1024) { data, error in
//        return UIImage(data: data!)
//    
//    }
//}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}




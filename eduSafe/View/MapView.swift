//
//  MapView.swift
//  eduSafe
//
//  Created by Abdulaziz Albahar on 10/15/22.
//

import SwiftUI
import FirebaseStorage


struct MapView: View {
    var body: some View {
        Image("layout").resizable().scaledToFit()
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

// top left 42.38104686376104, -71.12550950142808
// bottom left 42.38058460226251, -71.1251420974912
// bottom right 42.380763542114735, -71.12471009822218
// top right 42.381231769664275, -71.12509163091603

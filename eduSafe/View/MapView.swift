//
//  MapView.swift
//  eduSafe
//
//  Created by Abdulaziz Albahar on 10/15/22.
//

import SwiftUI
import FirebaseStorage


struct MapView: View {
    @StateObject var locationManager = LocationManager.shared
    
    var body: some View {
        UIImageView(image: <#T##UIImage?#>).
//
            
        
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




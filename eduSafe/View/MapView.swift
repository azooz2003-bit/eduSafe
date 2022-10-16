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

// left 42.381032433383986, -71.12549713996725
// bottom 42.38058862416593, -71.12512162919748
// right 42.38077486551393, -71.12473270978384
// top 42.3812127321162, -71.12511090110623

// dummy value: 42.383, -71.125

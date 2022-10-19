//
//  LocationRequestView.swift
//  eduSafe
//
//  Created by Aidan Palmer on 10/14/22.
//

//screen where we are prompting location services from the user

import SwiftUI

struct LocationRequestView: View {
    @State var locationEnabled = false
    
    @EnvironmentObject var userVM: UserViewModel
    
    var body: some View {
        ZStack {
            NavigationLink(destination: MapView().environmentObject(userVM), isActive: $locationEnabled) {
                EmptyView()
            }
                        
            
            Color(.systemGray).ignoresSafeArea()
            VStack {
                Spacer ()
                Image(systemName: "paperplane.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .padding(.bottom, 40)
                Text("Enable Location Services in order to use EduSafe.")
                    .font(.system(size: 20, weight: .semibold))
                    .multilineTextAlignment(.center)
                    .padding()
                Text("Start sharing your location with us.")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 15, weight: .semibold))
                    .frame(width: 140)
                    .padding()
                
                Spacer()
                
                VStack{
                    Button(action: {
                        LocationManager.shared.requestLocation()
                        if LocationManager.shared.userLocation != nil {
                            locationEnabled = true
                        } 
                    }) {
                        Text("Allow Location")
                            .font(.headline)
                            .foregroundColor(Color(.systemGray)).frame(minWidth: 300, maxWidth: 350, minHeight: 50, maxHeight: 65, alignment: .center)
                    }
                    .background(Color.white).clipShape(Capsule()).padding(.horizontal, 15)
                    
                }
            }
            .foregroundColor(.white)
        }
    }
}

struct LocationRequestView_Previews: PreviewProvider {
    static var previews: some View {
        LocationRequestView().environmentObject(UserViewModel())
    }
}

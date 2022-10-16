//
//  PinComponent.swift
//  eduSafe
//
//  Created by Abdulaziz Albahar on 10/16/22.
//

import SwiftUI

struct PinComponent: View {
    var body: some View {
        ZStack {
            Circle().frame(minWidth: 10, maxWidth: 20, minHeight: 10, maxHeight: 20).foregroundColor(.red)
            Circle().foregroundColor(.red).opacity(0.3).frame(minWidth: 50, maxWidth: 100, minHeight: 50, maxHeight: 100)
        }
        
    }
}

struct PinComponent_Previews: PreviewProvider {
    static var previews: some View {
        PinComponent()
    }
}

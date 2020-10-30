//
//  SwiftUIView.swift
//  Horsely
//
//  Created by Saba Dawit on 9/5/20.
//  Copyright © 2020 Saba Dawit. All rights reserved.
//

import SwiftUI

struct SwiftUIView: View {
    @State var showingDetail = false
    var body: some View {
        Image("bojack")
            .resizable()
            .frame(width: 100.0, height: 100.0)
            .clipShape(Circle())
            .overlay(
                Circle().stroke(ColorManager.darkgreen, lineWidth: 4))
            .shadow(radius: 10)
        
       
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}

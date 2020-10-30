//
//  FirstView.swift
//  Horsely
//
//  Created by Saba Dawit on 9/5/20.
//  Copyright © 2020 Saba Dawit. All rights reserved.
//

import SwiftUI

struct FirstView: View {
    var body: some View {
        VStack {
            HStack{
            
            Image(systemName: "slowmo")
                .font(.title)
                .padding(.leading, 350)
            }
            SwiftUIView().padding(.bottom, 10)
            VStack {
                Text("BoJack's Account").font(.largeTitle)       .fontWeight(.semibold)               .foregroundColor(ColorManager.darkgreen)
                Text("Account Settings")
                    .font(.subheadline)
                    .padding(.bottom, 40)
            }
            HStack{
                Button(action: {
                    print("Delete tapped!")
                    }) {
                        HStack {
                            Text("Triggers")
                                .fontWeight(.semibold)
                                .font(.title)
                        }
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(height: 125)
                        .padding()
                        .foregroundColor(.white)
                        .background(LinearGradient(gradient: Gradient(colors: [ColorManager.darkgreen, ColorManager.mintgreen]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(40)
                }
                .padding(.bottom, 10)
                    .padding(.top, 10)
                .padding(.trailing, 10)
                .padding(.leading, 10)
            Button(action: {
                print("Delete tapped!")
                }) {
                    HStack {
                        Text("Meds")
                            .fontWeight(.semibold)
                            .font(.title)
                    }
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 125)
                    .padding()
                    .foregroundColor(.white)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(40)
            }
            .padding(.bottom, 10)
                .padding(.top, 10)
                .padding(.trailing, 10)
                .padding(.leading, 10)
            }
            HStack{
                Button(action: {
                    print("Delete tapped!")
                    }) {
                        HStack {
                            Text("Action Plan")
                                .fontWeight(.semibold)
                                .font(.title)
                        }
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 125)
                        .padding()
                        .foregroundColor(.white)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.green, Color.yellow]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(40)
                }
                .padding(.bottom, 10)
                    .padding(.top, 10)
                .padding(.trailing, 10)
                .padding(.leading, 10)
            Button(action: {
                print("Delete tapped!")
                }) {
                    HStack {
                        Text("Reminders")
                            .fontWeight(.semibold)
                            .font(.title)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 125)
                    .padding()
                    .foregroundColor(.white)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.pink, Color.orange]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(40)
            }
                .padding(.bottom, 10)
            .padding(.top, 10)
            .padding(.trailing, 10)
                .padding(.leading, 10)
            }
            
           Button(action: {
               print("Delete tapped!")
           }) {
               HStack {
                   Text("Asthma Education")
                       .fontWeight(.semibold)
                       .font(.title)
               }
               .frame(minWidth: 0, maxWidth: .infinity)
           .padding()
               .foregroundColor(Color.white)
               .background(LinearGradient(gradient: Gradient(colors: [ColorManager.mintgreen, ColorManager.lightgray]), startPoint: .leading, endPoint: .trailing))
               .cornerRadius(40)
           }
            .padding(.top, 40)
            .padding(.trailing, 10)
            .padding(.leading, 10)
            Spacer()
        }
        .padding(.top, -100)
        
    }
    
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}

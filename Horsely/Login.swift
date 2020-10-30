//
//  Login.swift
//  Horsely
//
//  Created by Saba Dawit on 10/27/20.
//  Copyright © 2020 Saba Dawit. All rights reserved.
//

import SwiftUI
import Combine

let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
let storedUsername = "Myusername"
let storedPassword = "Mypassword"

struct Login: View {
    @State var username: String = ""
    @State var password: String = ""
    @State var authenticationDidFail: Bool = false
    @State var authenticationDidSucceed: Bool = false
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        ZStack{
            VStack {
                WelcomeText()
                UserImage()
                UsernameTextField(username: $username)
                PasswordSecureField(password: $password)
                if authenticationDidFail {
                    Text("Information not correct. Try again.")
                        .offset(y: -10)
                        .foregroundColor(.red)
                }
                
                Button(action:{
                    if self.username == storedUsername && self.password == storedPassword {
                        self.authenticationDidSucceed = true
                        self.authenticationDidFail = false
                        self.viewRouter.currentPage = "page2"
                    } else {
                        self.authenticationDidFail = true
                    }
                }) {
                    
                        
                        LoginButtonContent()
                        
                    
                }
                .padding(.bottom, 20)
                Button(action: {
                    print("Pressed")
                    self.viewRouter.currentPage = "page3"}) {
                    CreateButtonContent()
                }
            }
            .padding()
            
            if authenticationDidSucceed {
                Text("Login succeeded!")
                .font(.headline)
                .frame(width: 250, height: 80)
                .background(Color.green)
                .cornerRadius(20.0)
                .foregroundColor(.white)
                .animation(Animation.default)
            }
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        MotherView().environmentObject(ViewRouter())
    }
}

struct WelcomeText: View {
    var body: some View {
        Text("Welcome Back!")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
    }
}

struct UserImage: View {
    var body: some View {
        Image("bojack")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 150)
            .clipped()
            .cornerRadius(150)
            .padding(.bottom, 75)
    }
}

struct LoginButtonContent: View {
    var body: some View {
        Text("LOGIN")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 60)
            .background(Color.blue)
            .cornerRadius(15.0)
    }
}

struct CreateButtonContent: View {
    var body: some View {
        Text("CREATE")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 150, height: 40)
            .background(Color.green)
            .cornerRadius(15.0)
    }
}

struct UsernameTextField: View {
    @Binding var username: String
    var body: some View {
        TextField("Username", text: $username)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
}

struct PasswordSecureField: View {
    @Binding var password: String
    var body: some View {
        SecureField("Password", text: $password)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
}

struct MotherView : View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack {
            if viewRouter.currentPage == "page1" {
                Login()
            } else if viewRouter.currentPage == "page2" {
                Home()
            }
            else if viewRouter.currentPage == "page3" {
                CreateAccount()
            }
        }
    }
}

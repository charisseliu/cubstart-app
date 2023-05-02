//
//  LogInPage.swift
//  Cublendar
//
//  Created by Charisse Liu on 5/1/23.
//

import SwiftUI
import Firebase

struct LogInPage: View {
    @State private var password = ""
    @State private var username = ""
    @State private var successfulLogIn = false
    
    init() {
        FirebaseApp.configure()
    }
    
    func login() {
        Auth.auth().signIn(withEmail: username, password: password) { (result, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
            } else {
                successfulLogIn = true
                print("success")
            }
        }
    }
    
    var body: some View {
        ZStack {
            Image("blue").resizable().opacity(0.5).ignoresSafeArea(.all)
            
            NavigationView {
                VStack {
                    
                    Text("Start Planning Your Events TODAY!!").font(.largeTitle).bold()
                    
                    Image("oski").resizable().scaledToFit()
                    
                    TextField("Username", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(15)
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(15)
                    
                    NavigationLink(destination: CalendarPage().navigationBarBackButtonHidden(true), isActive: $successfulLogIn) {
                        Image("log_in_button").resizable()
                            .cornerRadius(15)
                            .aspectRatio(contentMode: .fit)
                        
                    }.navigationBarBackButtonHidden()
                }
            }
        }
    }
    
    func authenticate(username: String, password: String) {
        if (username.lowercased() == "cindy") {
            if (password.lowercased() == "password") {
                successfulLogIn = true
            }
        }
    }
}

struct LogIn_Previews: PreviewProvider {
    static var previews: some View {
        LogInPage()
    }
}

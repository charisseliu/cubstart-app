//
//  ContentView.swift
//  Cublendar
//
//  Created by Yifei Xu on 4/20/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(.white)
                    .ignoresSafeArea()
                VStack {
                    
                    Spacer()
                    
                    Image("cublendar_app_front")
                        .resizable()
                        .cornerRadius(15)
                        .aspectRatio(contentMode: .fit)
                    
                    Spacer()
                    
                    Text("Welcome to Cublendar!")
                        .font(.title)
                    
                    Spacer()
                    NavigationLink {
                        LogInPage()
                    } label: {
                        Image("log_in_button")
                            .resizable()
                            .padding(.all)
                            .cornerRadius(15)
                            .aspectRatio(contentMode: .fit)
                    }
                    .foregroundColor(.blue)
                    
                    Spacer()
                }
            }
            .padding()
        }
    }
}
    
struct LogInPage: View {
    @State private var password = ""
    @State private var username = ""
    @State private var successfulLogIn = false
    var body: some View {
        NavigationView {
            VStack {
                
                Spacer()
                
                TextField("Username", text: $username)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(15)
                
                TextField("Password", text: $password)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(15)
                
                
                NavigationStack {
                           VStack {

                              Button {
                                  authenticate(username: username, password: password)
                                 print(username)
                                  print(password)
                                  
                              } label: {
                                  Text("Go!")
                              }
                              .foregroundColor(.white)
                              .frame(width: 300, height: 50)
                              .background(Color.green)
                              .cornerRadius(10)
                          }
                           .navigationDestination(isPresented: $successfulLogIn) {
                               EmptyView()
                          }
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

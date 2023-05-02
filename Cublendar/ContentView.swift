//
//  ContentView.swift
//  Cublendar
//
//  Created by Yifei Xu on 4/20/23.
//

import SwiftUI
import Firebase
import FirebaseCore

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("blue").resizable().opacity(0.5).ignoresSafeArea(.all)
                VStack {
                    
                    Spacer()
                    
                    Image("cublendar_app_front")
                        .resizable()
                        .cornerRadius(15)
                        .aspectRatio(contentMode: .fit)
                    
                    Spacer()
                    
                    Text("Welcome to Cublendar!")
                        .font(.title).fontDesign(.serif).foregroundColor(.blue)
                    
                    Spacer()
                    NavigationLink {
                        LogInPage().navigationBarBackButtonHidden(true)
                    } label: {
                        Text("Tap To Start").italic(true).font(.title)
                    }
                    .foregroundColor(.blue)
                    
                    Spacer()
                }
            }
            .padding()
        }
    }
}
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

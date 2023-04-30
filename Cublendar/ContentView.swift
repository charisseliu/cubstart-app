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
                
                SecureField("Password", text: $password)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(15)
                
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
                    NavigationLink (destination: CalendarPage(), isActive: $successfulLogIn){
                        EmptyView()
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

struct CalendarPage: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                CalendarView(interval: DateInterval(start: .distantPast, end: .distantFuture))
                    .navigationTitle("Your Calendar")
            }
        }
    }
}

struct CalendarView: UIViewRepresentable {
    let interval: DateInterval
    
    func makeUIView(context: Context) -> some UICalendarView {
        let view = UICalendarView()
        view.calendar = Calendar(identifier: .gregorian)
        view.availableDateRange = interval
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}

struct EventView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                CalendarView (interval: DateInterval(start: .distantPast, end: .distantFuture))
            }
        }
    }
}

@MainActor class Decoration: NSObject {
    // static func image(UIImage?, color: ColorPicker, size: UICalendarView.DecorationSize) -> UICalendarView.Decoration {
        
}
 

//
//  CalendarPage.swift
//  Cublendar
//
//  Created by Charisse Liu on 5/1/23.
//

import SwiftUI
import EventKit

var events = [Event]()

struct CalendarPage: View {
    @State private var date = Date()
    @State private var showingEvent1 = false
    @State private var showingEvent2 = false
    @State private var showingEvent3 = false
    @State private var showingEvent4 = false
    
    var body: some View {
        let events = [
            Event(id: UUID(), name: "Grind Time", description: "I work until I drop dead", start: .now, end: .distantFuture),
            Event(id: UUID(), name: "Bathroom Break", description: "Oh gosh I drank too much coffee", start: .distantPast, end: .distantFuture),
            Event(id: UUID(), name: "Girlfriend's birthday", description: "She's the best thing that's ever happened to me", start: .now, end: .now),
            Event(id: UUID(), name: "Crying", description: "I'm so stressed", start: .distantPast, end: .distantFuture),
        ]
        
        ZStack {
            Image("blue").resizable().opacity(0.5).ignoresSafeArea(.all)
            VStack{
                NavigationStack {
                    ScrollView {
                        DatePicker("Start Date", selection: $date, displayedComponents: [.date]).datePickerStyle(.graphical)
                            .navigationTitle("Your Calendar").toolbar {NavigationLink(destination: JournalPage()) {
                                Text("New Entry").font(.body)
                            }
                            }.padding()
                    }
                    
                    Text("Today's Events").font(.body)
                    Form {
                        Button("Crying- 9:00 AM to 9:10 AM") {
                            showingEvent1.toggle()
                        }.foregroundColor(.pink).sheet(isPresented: $showingEvent1) {
                            Event1()}
                        Button("Grind Time- 9:10 AM to 6:10 PM") {
                            showingEvent2.toggle()
                        }.foregroundColor(.green).sheet(isPresented: $showingEvent2) {
                            Event2()}
                        Button("Bathroom Break- 9:00 AM to 9:10 AM") {
                            showingEvent3.toggle()
                        }.foregroundColor(.blue).sheet(isPresented: $showingEvent3) {
                            Event3()}
                        Button("Sleepytime- 7:00 PM to 7:00 AM") {
                            showingEvent4.toggle()
                        }.foregroundColor(.purple).sheet(isPresented: $showingEvent4) {
                            Event4()}
                    }.scaledToFit()

                    NavigationLink(destination: EventView()) {
                        Text("New Event").font(.title)
                    }
                }
        }
        
        
            
        }
    }
}

struct Event1: View {
    //This code allows us to call the dismiss() function which closes the sheet view
    @Environment(\.dismiss) var dismiss
    @State var journalEntry = ""
    
    var body: some View {
        Text("Crying").font(.title).padding()
        Text("I'm so stressed").font(.title2)
        
        Text("9:00 - 9:10").font(.body)
        TextField("Journal", text: $journalEntry)
            .padding()
            .frame(width: 270, height: 200)
            .background(Color.black.opacity(0.05))
            .cornerRadius(15)
        Button("Save") {
            dismiss()
        }
    }

}

struct Event2: View {
    //This code allows us to call the dismiss() function which closes the sheet view
    @Environment(\.dismiss) var dismiss
    @State var journalEntry = ""
    
    var body: some View {
        Text("Grind Time").font(.title).padding()
        Text("Description: I work until I drop dead").font(.title2)
        
        Text("9:10 - 6:10").font(.body)
        TextField("Journal", text: $journalEntry)
            .padding()
            .frame(width: 270, height: 200)
            .background(Color.black.opacity(0.05))
            .cornerRadius(15)
        Button("Save") {
            dismiss()
        }
    }

}

struct Event3: View {
    //This code allows us to call the dismiss() function which closes the sheet view
    @Environment(\.dismiss) var dismiss
    @State var journalEntry = ""
    
    var body: some View {
        Text("Bathroom Break").font(.title).padding()
        Text("Description: Moffitt 5th floor bathroom").font(.title2)
        
        Text("6:10 - 7:00").font(.body)
        TextField("Journal", text: $journalEntry)
            .padding()
            .frame(width: 270, height: 200)
            .background(Color.black.opacity(0.05))
            .cornerRadius(15)
        Button("Save") {
            dismiss()
        }
    }
}

struct Event4: View {
    //This code allows us to call the dismiss() function which closes the sheet view
    @Environment(\.dismiss) var dismiss
    @State var journalEntry = ""
    
    var body: some View {
        Text("Sleepytime").font(.title).padding()
        Text("Description: Too eepy").font(.title2)
        
        Text("7:00 - 7:00").font(.body)
        TextField("Journal", text: $journalEntry)
            .padding()
            .frame(width: 270, height: 200)
            .background(Color.black.opacity(0.05))
            .cornerRadius(15)
        Button("Save") {
            dismiss()
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarPage()
    }
}

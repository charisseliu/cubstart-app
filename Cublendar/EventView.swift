//
//  EventView.swift
//  Cublendar
//
//  Created by Charisse Liu on 5/1/23.
//

import SwiftUI
import Foundation
import EventKit

//
struct EventView: View {
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State var dateName = String()
    @State var dateDesc = String()
    @State var dateJournal = String()
    
    var body: some View {
        ZStack {
            Image("blue").resizable().opacity(0.5).ignoresSafeArea(.all)
            VStack {
                Text("Create New Event").font(.largeTitle)

            
                DatePicker("Start Date", selection: $startDate, displayedComponents: [.date, .hourAndMinute]).datePickerStyle(.automatic).padding()
                DatePicker("End Date", selection: $endDate, displayedComponents: [.date, .hourAndMinute]).datePickerStyle(.automatic).padding()
            
                HStack{
                    Text("Event Name:")
                    TextField("", text: $dateName)
                    .padding()
                    .frame(width: 270, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(15)
                }
            
                HStack{
                    Text("Event Description:")
                    TextField("", text: $dateDesc)
                    .padding()
                    .frame(width: 250, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(15)
                }
            
                Button("Add Event") {
                    addEvent(title: dateName, description: dateDesc, startDate: startDate, endDate: endDate)
                }
                
            }
        }
    }
    
    func addEvent(title: String, description: String, startDate: Date, endDate: Date) {
        events.append(Event(id: UUID(), name: title, description: description, start: startDate, end: endDate))
        
    }
}

struct Event: Identifiable {
    var id: UUID
    var name: String
    var description: String
    var start: Date
    var end: Date
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView()
    }
}

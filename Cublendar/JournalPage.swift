//
//  JournalPage.swift
//  Cublendar
//
//  Created by Charisse Liu on 5/2/23.
//
import Foundation
import SwiftUI
import EventKit

struct JournalPage: View {
    @State private var date = Date()
    @State var entryName = String()
    @State var dateJournal = String()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Image("blue").resizable().opacity(0.5).ignoresSafeArea(.all)
            VStack {
                Text("New Entry").font(.largeTitle)
                DatePicker("Date", selection: $date, displayedComponents: [.date, .hourAndMinute]).datePickerStyle(.automatic).padding()
                
                TextField("Title", text: $entryName)
                        .padding()
                        .frame(width: 270, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(15)
                
                
                Text("Event Description:")
                TextField("", text: $dateJournal)
                        .padding()
                        .frame(width: 250, height: 100)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(15)
                
                Button("Add Entry") {
                    dismiss()
                }
            }
        }
    }
}

struct JournalView_Previews: PreviewProvider {
    static var previews: some View {
        JournalPage()
    }
}

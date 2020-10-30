//
//  LogSymptoms.swift
//  Horsely
//
//  Created by Saba Dawit on 9/30/20.
//  Copyright © 2020 Saba Dawit. All rights reserved.
//

import SwiftUI
import MobileCoreServices

struct LogSymptoms: View {
    static let DefaultReminderTitle = "An untitled masterpiece"
    @State var mood: String = ""
    @State var triggers: String = ""
    @State var dustExposure: Bool = true
    @State var pollen: Bool = true
    @State var humidity: Bool = true
    @State var temperature: Bool = true
    @State var symptoms: String = ""
    @State var whichMeds: String = ""
    @State var medsTaken: Bool = true
    @State var freqCough: Double = 0
     @State var performance: Double = 0
    @State var mucus: Double = 0
    @State var abnormal: Double = 0
    @State var date = Date()
    @State var notificationsEnabled: Bool = false
    var count = 0
    var moods = ["Amazing", "Good", "Ok", "Not So Great", "Terrible"]
     @State private var selectedMood = 0
    let onComplete: (String, String, String, String, Bool, Date) -> Void
    
       var body: some View {
           NavigationView {
               Form {
                   Section(header: Text("MOOD")) {
                    VStack{
                     Picker(selection: $selectedMood, label: Text("How Does Bojack Feel Today")) {
                                          ForEach(0 ..< moods.count) {
                                             Text(self.moods[$0])
                                          }
                                       }
                        
                    }
                }
                Section(header: Text("Symptoms")){
                    VStack {
                        Text("Frequency of Coughing")
                        Slider(value: $freqCough, in: 1...4, step: 1)
                    }
                    VStack {
                        Text("Mucous nasal discharge after exercise")
                        Slider(value: $mucus, in: 1...2, step: 1)
                    }
                    VStack {
                        Text("Abnormal breathing at rest, during, or after exercise")
                        Slider(value: $abnormal, in: 1...2, step: 1)
                    }
                    VStack {
                        Text("Subjective Performance")
                        Slider(value: $performance, in: 1...4, step: 1)
                    }
                    
                    
                       Toggle(isOn: $medsTaken) {
                           Text("Did you take your meds today?")
                       }
                }
                   Section(header: Text("Additional Symptoms")) {
                TextField("Other Symptoms", text: $symptoms)
                }
                   Section(header: Text("TRIGGERS")) {
                   Toggle(isOn: $dustExposure) {
                       Text("Dust Exposure")
                   }
                   Toggle(isOn: $pollen) {
                       Text("Pollen")
                   }
                   Toggle(isOn: $humidity) {
                       Text("Humidity")
                   }
                   Toggle(isOn: $temperature) {
                       Text("Temperature")
                   }
                   }
                
                   Section {
                       Button(action: {
                        self.addMoveAction()
                       }) {
                           Text("Finish Log")
                       }
                   }
               }
               .navigationBarTitle("Daily Log")
             
           }
       }
    
    private func addMoveAction() {
        mood = moods[selectedMood]
      onComplete(mood, triggers, symptoms, whichMeds, medsTaken, date)
    }
}


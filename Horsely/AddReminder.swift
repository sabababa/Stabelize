//
//  AddReminder.swift
//  Horsely
//
//  Created by Saba Dawit on 9/30/20.
//  Copyright © 2020 Saba Dawit. All rights reserved.
//

import SwiftUI
import UserNotifications

struct AddReminder: View {
  static let DefaultReminderTitle = "An untitled masterpiece"
  static let DefaultReminderMood = "Genre-buster"

  @State var title = ""
  @State var mood = ""
  @State var currentDate = Date()
  let onComplete: (String, String, Date) -> Void

  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("Reminder Title")) {
          TextField("Take Meds at 3pm", text: $title)
        }
        Section(header: Text("Notes")) {
          TextField("Notes", text: $mood)
        }
        Section {
          DatePicker(
            selection: $currentDate,
            displayedComponents: .date) {
              Text("Remind on Date").foregroundColor(Color(.gray))
          }
        }
        Section {
            Button("Allow Notifications") {
             UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                  if success {
                      print("All set!")
                  } else if let error = error {
                      print(error.localizedDescription)
                  }
              }
            }
            Button("Schedule Notifications"){
                let content = UNMutableNotificationContent()
                content.title = "Take Meds at 10:10"
                content.subtitle = "Bojack Needs His Meds"
                content.sound = UNNotificationSound.default

                // show this notification five seconds from now
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

                // choose a random identifier
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

                // add our notification request
                UNUserNotificationCenter.current().add(request)
            }
          Button(action: addMoveAction) {
            Text("Add Reminder")
          }
        }
      }
      .navigationBarTitle(Text("Add Reminder"), displayMode: .inline)
    }
  }

  private func addMoveAction() {
    onComplete(
      title.isEmpty ? AddReminder.DefaultReminderTitle : title,
      mood.isEmpty ? AddReminder.DefaultReminderMood : mood,
      currentDate)
  }
}

import SwiftUI

struct SettingsView: View {
    @State private var notificationsEnabled = true
    @State private var darkModeEnabled = false
    @State private var dailyReminderTime = Date()

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Preferences")) {
                    Toggle(isOn: $notificationsEnabled) {
                        Label("Enable Notifications", systemImage: "bell.fill")
                    }

                    Toggle(isOn: $darkModeEnabled) {
                        Label("Dark Mode", systemImage: "moon.fill")
                    }

                    DatePicker("Daily Reminder", selection: $dailyReminderTime, displayedComponents: .hourAndMinute)
                }

                Section(header: Text("About")) {
                    HStack {
                        Label("App Version", systemImage: "info.circle")
                        Spacer()
                        Text("1.0")
                            .foregroundColor(.gray)
                    }

                    HStack {
                        Label("Developer", systemImage: "person.crop.circle")
                        Spacer()
                        Text("Rushil Chopra")
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
}

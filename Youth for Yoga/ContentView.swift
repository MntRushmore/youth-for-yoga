
import SwiftUI

struct ContentView: View {
    @State private var selectedMood: String? = nil
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Text("🌞 Welcome to Youth for Yoga!")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)

                Text("How are you feeling today?")
                    .font(.headline)
                
                HStack(spacing: 20) {
                    MoodButton(emoji: "😊", mood: "Happy", selectedMood: $selectedMood)
                    MoodButton(emoji: "😔", mood: "Sad", selectedMood: $selectedMood)
                    MoodButton(emoji: "😠", mood: "Angry", selectedMood: $selectedMood)
                    MoodButton(emoji: "😴", mood: "Tired", selectedMood: $selectedMood)
                }

                if let mood = selectedMood {
                    NavigationLink(destination: YogaFlowView(mood: mood)) {
                        Text("Start Yoga for \(mood)")
                            .fontWeight(.semibold)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                }

                Spacer()
            }
            .padding()
        }
    }
}

struct MoodButton: View {
    let emoji: String
    let mood: String
    @Binding var selectedMood: String?
    
    var body: some View {
        Button(action: {
            selectedMood = mood
        }) {
            Text(emoji)
                .font(.system(size: 40))
                .padding()
                .background(Color.yellow.opacity(0.3))
                .clipShape(Circle())
        }
    }
}

struct YogaFlowView: View {
    let mood: String
    
    var body: some View {
        VStack(spacing: 20) {
            Text("🧘 Yoga Flow for \(mood)")
                .font(.largeTitle)
                .multilineTextAlignment(.center)

            Text("Here’s a calming sequence to help you feel your best!")
                .padding()

            Image(systemName: "figure.yoga")
                .resizable()
                .scaledToFit()
                .frame(height: 200)

            Text("1. Breathing\n2. Gentle Stretch\n3. Sun Salutation\n4. Rest Pose")
                .multilineTextAlignment(.center)
                .padding()
        }
        .padding()
    }
}

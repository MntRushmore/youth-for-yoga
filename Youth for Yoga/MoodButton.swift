//
//  MoodButton.swift
//  Youth for Yoga
//
//  Created by Rushil Chopra on 5/6/25.
//

import SwiftUI

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

struct MoodSelectionView: View {
    @State private var selectedMood: String? = nil

    var body: some View {
        VStack(spacing: 30) {
            Text("How are you feeling today?") // Maybe need to change this question, or change it to daily save
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
        .padding() // Does this padding need to be there? Hmmmm
    }
}

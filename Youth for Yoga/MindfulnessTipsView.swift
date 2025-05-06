import SwiftUI

struct MindfulnessTip: Identifiable {
    let id = UUID()
    let title: String
    let description: String
}

struct MindfulnessTipsView: View {
    private let tips: [MindfulnessTip] = [
        MindfulnessTip(
            title: "Breathing Break",
            description: "Take five slow, deep breaths. Inhale through your nose for 4 counts, hold for 2, exhale through your mouth for 6."
        ),
        MindfulnessTip(
            title: "Body Scan",
            description: "Close your eyes and notice how your head, shoulders, arms, and legs feel. Release any tension you find."
        ),
        MindfulnessTip(
            title: "Gratitude Pause",
            description: "Think of three things you're grateful for right now, big or small, and hold them in your mind."
        ),
        MindfulnessTip(
            title: "Mindful Stretch",
            description: "Gently stretch your arms overhead or roll your shoulders, noticing the sensation in your muscles."
        ),
        MindfulnessTip(
            title: "Visualization",
            description: "Picture a calm place, like a beach or forest. Spend a minute exploring it in your mind."
        )
    ]

    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color.green, Color.blue]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()

                ScrollView {
                    VStack(spacing: 20) {
                        ForEach(tips) { tip in
                            VStack(alignment: .leading, spacing: 8) {
                                Text(tip.title)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                Text(tip.description)
                                    .foregroundColor(.white.opacity(0.9))
                            }
                            .padding()
                            .background(Color.black.opacity(0.3))
                            .cornerRadius(12)
                            .padding(.horizontal)
                        }
                    }
                    .padding(.top, 20)
                }
            }
            .navigationTitle("Mindfulness Tips")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct MindfulnessTipsView_Previews: PreviewProvider {
    static var previews: some View {
        MindfulnessTipsView()
    }
}

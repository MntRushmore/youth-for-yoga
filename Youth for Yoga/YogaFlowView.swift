import SwiftUI

struct YogaFlowView: View {
    let mood: String
    private let poses = ["Breathing", "Gentle Stretch", "Sun Salutation", "Rest Pose"]

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.blue, Color.green]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 20) {
                    Text("🧘 Yoga Flow for \(mood)")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, 40)

                    ForEach(poses, id: \.self) { pose in
                        HStack(spacing: 15) {
                            Image(systemName: "figure.yoga")
                                .font(.system(size: 40))
                                .foregroundColor(.white)
                            Text(pose)
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                            Spacer()
                        }
                        .padding()
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(15)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                        .padding(.horizontal)
                    }

                    Spacer()
                }
                .padding(.bottom, 20)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

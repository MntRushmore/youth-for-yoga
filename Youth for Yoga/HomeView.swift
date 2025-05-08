import SwiftUI

struct HomeView: View {

    var body: some View {
        TabView {
            NavigationView {
                ZStack {
                    LinearGradient(
                        gradient: Gradient(colors: [Color(.systemTeal), Color(.systemBlue)]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    .ignoresSafeArea()

                    VStack(spacing: 30) {
                        Text("Youth for Yoga")
                            .font(.system(size: 32, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .padding(.top, 50)

                        NavigationLink(destination: MindfulnessTipsView()) {
                            HStack {
                                Image(systemName: "leaf")
                                    .foregroundColor(.white)
                                Text("Mindfulness Tips")
                                    .foregroundColor(.white)
                                    .font(.headline)
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.black.opacity(0.2))
                            .cornerRadius(16)
                        }

                        NavigationLink(destination: YogaFlowView(mood: "Happy")) {
                            HStack {
                                Image(systemName: "figure.yoga")
                                    .foregroundColor(.white)
                                Text("Yoga Flow")
                                    .foregroundColor(.white)
                                    .font(.headline)
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.black.opacity(0.2))
                            .cornerRadius(16)
                        }

                        Spacer()
                    }
                    .padding()
                }
            }
            .tabItem {
                Label("Home", systemImage: "house.fill")
            }

            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }

            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
        }
    }
}

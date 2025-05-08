import SwiftUI

struct ProfileView: View {
    @State private var name: String = UserDefaults.standard.string(forKey: "name") ?? ""
    @State private var email: String = UserDefaults.standard.string(forKey: "email") ?? ""
    @State private var bio: String = UserDefaults.standard.string(forKey: "bio") ?? ""

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)
                    .padding(.top)

                TextField("Name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .onChange(of: name) { newValue in
                        UserDefaults.standard.set(newValue, forKey: "name")
                    }

                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .onChange(of: email) { newValue in
                        UserDefaults.standard.set(newValue, forKey: "email")
                    }

                TextField("Bio", text: $bio)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .onChange(of: bio) { newValue in
                        UserDefaults.standard.set(newValue, forKey: "bio")
                    }

                Spacer()
            }
            .padding()
            .navigationTitle("Your Profile")
        }
    }
}

#Preview {
    ProfileView()
}

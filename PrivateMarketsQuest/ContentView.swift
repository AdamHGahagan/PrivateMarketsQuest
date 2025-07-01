import SwiftUI

struct ContentView: View {
    @State private var isLoggedIn = false

    var body: some View {
        if isLoggedIn {
            HomeView()
        } else {
            LoginView(isLoggedIn: $isLoggedIn)
        }
    }
}

struct LoginView: View {
    @Binding var isLoggedIn: Bool
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        VStack(spacing: 20) {
            Image("ey_logo")
                .resizable()
                .scaledToFit()
                .frame(height: 80)
                .padding(.top, 60)

            Text("Welcome to Private Markets Quest")
                .font(.title2)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.emailAddress)
                .autocapitalization(.none)

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button(action: {
                if !email.isEmpty && !password.isEmpty {
                    isLoggedIn = true
                }
            }) {
                Text("Log In")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("EYYellow"))
                    .cornerRadius(10)
            }

            Spacer()
        }
        .padding()
    }
}

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Image("ey_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 60)
                    .padding(.top, 10)

                Text("Private Markets Quest")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)

                Image(systemName: "chart.bar.doc.horizontal")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .foregroundColor(Color("EYYellow"))

                NavigationLink(destination: LearningModuleView()) {
                    Text("Start Learning")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("EYYellow"))
                        .cornerRadius(12)
                }

                NavigationLink(destination: FundBuilderView()) {
                    Text("Build a Fund")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("EYGray"))
                        .cornerRadius(12)
                }

                NavigationLink(destination: ResourcesView()) {
                    Text("Explore Resources")
                        .font(.subheadline)
                        .foregroundColor(Color("EYDark"))
                        .padding(.top, 10)
                }

                Spacer()
            }
            .padding()
            .navigationBarHidden(true)
        }
    }
}

struct LearningModuleView: View {
    var body: some View {
        Text("Learning Module Coming Soon")
            .font(.title2)
    }
}

struct FundBuilderView: View {
    var body: some View {
        Text("Fund Builder Coming Soon")
            .font(.title2)
    }
}

struct ResourcesView: View {
    var body: some View {
        Text("Resources Coming Soon")
            .font(.title2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
    }
}

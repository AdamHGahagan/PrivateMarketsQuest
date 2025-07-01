import SwiftUI

@available(iOS 14.0, macOS 10.15, *)
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

@available(iOS 14.0, macOS 10.15, *)
struct LoginView: View {
    @Binding var isLoggedIn: Bool
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        VStack(spacing: 20) {
            if #available(macOS 11.0, *) {
                Text("Welcome to Private Markets Quest")
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            } else {
                Text("Welcome to Private Markets Quest")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }

            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            #if os(iOS)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
            #endif

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
                    .background(Color.yellow)
                    .cornerRadius(10)
            }

            Spacer()
        }
        .padding()
    }
}

@available(iOS 14.0, macOS 10.15, *)
struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Private Markets Quest")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)

                NavigationLink(destination: LearningModuleView()) {
                    Text("Start Learning")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.yellow)
                        .cornerRadius(12)
                }

                NavigationLink(destination: FundBuilderView()) {
                    Text("Build a Fund")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.gray)
                        .cornerRadius(12)
                }

                NavigationLink(destination: ResourcesView()) {
                    Text("Explore Resources")
                        .font(.subheadline)
                        .foregroundColor(Color.black)
                        .padding(.top, 10)
                }

                Spacer()
            }
            .padding()
        }
    }
}

@available(iOS 14.0, macOS 10.15, *)
struct LearningModuleView: View {
    var body: some View {
        if #available(macOS 11.0, *) {
            Text("Learning Module Coming Soon")
                .font(.title2)
        } else {
            Text("Learning Module Coming Soon")
                .font(.title)
        }
    }
}

@available(iOS 14.0, macOS 10.15, *)
struct FundBuilderView: View {
    var body: some View {
        if #available(macOS 11.0, *) {
            Text("Fund Builder Coming Soon")
                .font(.title2)
        } else {
            Text("Fund Builder Coming Soon")
                .font(.title)
        }
    }
}

@available(iOS 14.0, macOS 10.15, *)
struct ResourcesView: View {
    var body: some View {
        if #available(macOS 11.0, *) {
            Text("Resources Coming Soon")
                .font(.title2)
        } else {
            Text("Resources Coming Soon")
                .font(.title)
        }
    }
}

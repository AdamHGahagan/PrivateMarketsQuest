// ✅ IntroVideoView.swift — streams Synthesia-hosted video

import SwiftUI
import AVKit

@available(macOS 11.0, *)
struct IntroVideoView: View {
    private let videoURL = URL(string: "https://cdn.synthesia.io/videos/779d5805-8ffa-4fd0-bf51-428fc6741891.mp4")!

    var body: some View {
        VStack {
            VideoPlayer(player: AVPlayer(url: videoURL))
                .frame(height: 300)
                .cornerRadius(12)
                .padding()

            Text("Welcome to Private Markets Quest")
                .font(.headline)
                .padding()
        }
        .navigationTitle("Introduction")
    }
}

// ✅ ContentView.swift — Home screen with navigation to intro video

import SwiftUI

@available(macOS 11.0, *)
struct ContentView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isLoggedIn = false

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Welcome to Private Markets Quest")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)

                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Button("Log In") {
                    isLoggedIn = true
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)

                NavigationLink(destination: IntroVideoView()) {
                    Text("▶️ Watch Intro Video")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                Spacer()
            }
            .padding()
            .navigationTitle("Home")
        }
    }
}

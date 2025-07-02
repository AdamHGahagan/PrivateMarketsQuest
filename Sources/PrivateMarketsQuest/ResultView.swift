
import SwiftUI

@available(macOS 11.0, *)
struct ResultView: View {
    let assets: String
    let assetTypes: [String]
    let returnTarget: String
    let duration: String
    var onContinue: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("🎯 Recommended Learning Path")
                .font(.title2)
                .fontWeight(.bold)

            if assetTypes.contains("Broad Overview") {
                Text("• Core modules on private market fundamentals")
            } else {
                ForEach(assetTypes, id: \.self) { type in
                    Text("• Intro to \(type)")
                }
            }

            Button("Start Learning") {
                onContinue()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .padding()
    }
}

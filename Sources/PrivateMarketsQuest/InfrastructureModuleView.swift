
import SwiftUI

@available(macOS 11.0, *)
struct InfrastructureModuleView: View {
    var onNext: () -> Void

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("📘 Infrastructure")
                    .font(.title2)
                    .fontWeight(.bold)

                Text("Discover long-term investments in public services and utilities like energy, transport, and water.")

                Button("Next Module") {
                    onNext()
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
            .padding()
        }
    }
}


import SwiftUI

@available(macOS 11.0, *)
struct PrivateCreditModuleView: View {
    var onNext: () -> Void

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("📘 Private Credit")
                    .font(.title2)
                    .fontWeight(.bold)

                Text("Explore lending strategies, direct lending, mezzanine debt, and special situations.")

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

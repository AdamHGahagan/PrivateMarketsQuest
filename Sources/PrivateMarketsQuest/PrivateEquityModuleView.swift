
import SwiftUI

@available(macOS 11.0, *)
struct PrivateEquityModuleView: View {
    var onNext: () -> Void

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("📘 Private Equity")
                    .font(.title2)
                    .fontWeight(.bold)

                Text("Learn about buyouts, growth capital, and venture investing strategies.")

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

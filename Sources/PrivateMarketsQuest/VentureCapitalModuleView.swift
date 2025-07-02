
import SwiftUI

@available(macOS 11.0, *)
struct VentureCapitalModuleView: View {
    var onNext: () -> Void

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("📘 Venture Capital")
                    .font(.title2)
                    .fontWeight(.bold)

                Text("Dive into early-stage startup investing, funding rounds, and portfolio construction.")

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

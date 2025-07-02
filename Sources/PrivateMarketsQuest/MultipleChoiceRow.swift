
import SwiftUI

@available(macOS 11.0, *)
struct MultipleChoiceRow: View {
    let title: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                    .foregroundColor(.primary)
                Spacer()
                if isSelected {
                    if #available(macOS 11.0, *) {
                        Image(systemName: "checkmark")
                            .foregroundColor(.blue)
                    }
                }
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray))
        }
    }
}

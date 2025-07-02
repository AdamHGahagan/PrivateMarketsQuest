// SwiftUI Decision Tree Questionnaire for Learning Path with macOS Compatibility

import SwiftUI

@available(macOS 11.0, *)
struct QuestionnaireView: View {
    @State private var step = 1

    @State private var assets: String = ""
    @State private var assetTypes: [String] = []
    @State private var returnTarget: String = ""
    @State private var duration: String = ""
    @State private var showResult = false

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                if showResult {
                    ResultView(assets: assets, assetTypes: assetTypes, returnTarget: returnTarget, duration: duration)
                } else {
                    if step == 1 {
                        Text("1. What is your amount of investable assets?")
                            .font(.headline)

                        Picker("Assets", selection: $assets) {
                            Text("< $250K").tag("Emerging")
                            Text("$250K–$1M").tag("Accredited")
                            Text("$1M–$5M").tag("HNW")
                            Text("$5M–$25M").tag("HNW+")
                            Text(">$25M").tag("Institutional")
                        }
                        .pickerStyle(.inline)
                    }

                    if step == 2 {
                        Text("2. Which asset types are you interested in?")
                            .font(.headline)

                        ForEach(["Private Equity", "Private Credit", "Real Estate", "Infrastructure", "Venture Capital", "Broad Overview"], id: \ .self) { type in
                            MultipleChoiceRow(title: type, isSelected: assetTypes.contains(type)) {
                                if assetTypes.contains(type) {
                                    assetTypes.removeAll { $0 == type }
                                } else {
                                    assetTypes.append(type)
                                }
                            }
                        }
                    }

                    if step == 3 {
                        Text("3. What is your target annual return?")
                            .font(.headline)

                        Picker("Return Target", selection: $returnTarget) {
                            Text("5–8%").tag("Conservative")
                            Text("8–12%").tag("Moderate")
                            Text("12–20%").tag("Aggressive")
                            Text("20%+").tag("Speculative")
                            Text("Not Sure").tag("Unknown")
                        }
                        .pickerStyle(.inline)
                    }

                    if step == 4 {
                        Text("4. How long are you comfortable locking in capital?")
                            .font(.headline)

                        Picker("Duration", selection: $duration) {
                            Text("< 1 year").tag("Short")
                            Text("1–3 years").tag("Low-Medium")
                            Text("3–7 years").tag("Medium")
                            Text("7–10 years").tag("Long")
                            Text("10+ years").tag("Very Long")
                        }
                        .pickerStyle(.inline)
                    }

                    Spacer()

                    Button(action: {
                        if step < 4 {
                            step += 1
                        } else {
                            showResult = true
                        }
                    }) {
                        Text(step < 4 ? "Next" : "Finish")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
            }
            .padding()
            .navigationTitle("Investor Path Survey")
        }
    }
}

@available(macOS 11.0, *)
struct ResultView: View {
    let assets: String
    let assetTypes: [String]
    let returnTarget: String
    let duration: String

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("🎯 Recommended Learning Path")
                .font(.title2)
                .fontWeight(.bold)

            Text("🧾 Investor Profile: \(assets)")
            Text("📂 Interests: \(assetTypes.joined(separator: ", "))")
            Text("📈 Return Target: \(returnTarget)")
            Text("⏳ Horizon: \(duration)")

            Divider()

            Text("We recommend starting with:")
                .font(.headline)

            if assetTypes.contains("Broad Overview") || assetTypes.isEmpty {
                Text("• Core modules on private market fundamentals")
            } else {
                ForEach(assetTypes, id: \ .self) { type in
                    Text("• Intro to \(type)")
                }
            }

            if returnTarget == "Aggressive" || returnTarget == "Speculative" {
                Text("• Advanced strategies and risk/reward trade-offs")
            } else {
                Text("• Income and diversification principles")
            }

            Spacer()
        }
        .padding()
    }
}

struct MultipleChoiceRow: View {
    let title: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                Spacer()
                if isSelected {
                    if #available(macOS 11.0, *) {
                        Image(systemName: "checkmark")
                            .foregroundColor(.blue)
                    } else {
                        Text("✓")
                            .foregroundColor(.blue)
                    }
                }
            }
            .padding(.vertical, 4)
        }
    }
}

@available(macOS 11.0, *)
struct QuestionnaireView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionnaireView()
    }
}

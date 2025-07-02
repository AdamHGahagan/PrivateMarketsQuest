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
    @State private var showModule = false
    @State private var moduleStep = 1

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                if showModule {
                    if moduleStep == 1 {
                        FirstModuleView(onNext: { moduleStep += 1 })
                    } else if moduleStep == 2 {
                        PrivateEquityModuleView(onNext: { moduleStep += 1 })
                    } else if moduleStep == 3 {
                        RealEstateModuleView(onNext: { moduleStep += 1 })
                    } else if moduleStep == 4 {
                        PrivateCreditModuleView(onNext: { moduleStep += 1 })
                    } else if moduleStep == 5 {
                        InfrastructureModuleView(onNext: { moduleStep += 1 })
                    } else if moduleStep == 6 {
                        VentureCapitalModuleView(onNext: {})
                    }
                } else if showResult {
                    ResultView(assets: assets, assetTypes: assetTypes, returnTarget: returnTarget, duration: duration, onContinue: {
                        showModule = true
                    })
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
struct PrivateCreditModuleView: View {
    var onNext: () -> Void

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("💳 Module 4: Private Credit")
                    .font(.title2)
                    .fontWeight(.bold)

                Text("Private credit refers to non-bank lending where investors provide loans directly to companies. It is typically used by small to mid-sized businesses that need capital but do not want to issue equity.")

                Text("🔑 Key Topics")
                    .font(.headline)
                Text("• Direct lending vs. mezzanine\n• Collateral and risk management\n• Yield generation\n• Typical terms and covenants")

                Button(action: onNext) {
                    Text("Next Module")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding()
        }
    }
}

@available(macOS 11.0, *)
struct InfrastructureModuleView: View {
    var onNext: () -> Void

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("🛣️ Module 5: Infrastructure")
                    .font(.title2)
                    .fontWeight(.bold)

                Text("Infrastructure investments include transportation, utilities, energy, and communications assets. They are often regulated, capital-intensive, and provide long-term cash flows.")

                Text("🔍 Key Ideas")
                    .font(.headline)
                Text("• Essential services\n• Public-private partnerships\n• Inflation-linked income\n• Regulatory frameworks")

                Button(action: onNext) {
                    Text("Next Module")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding()
        }
    }
}

@available(macOS 11.0, *)
struct VentureCapitalModuleView: View {
    var onNext: () -> Void

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("🚀 Module 6: Venture Capital")
                    .font(.title2)
                    .fontWeight(.bold)

                Text("Venture capital involves investing in early-stage startups with high growth potential. VC is inherently risky but can provide significant returns if the startup succeeds.")

                Text("🌱 What to Know")
                    .font(.headline)
                Text("• Seed, Series A/B/C rounds\n• Exit via IPO or acquisition\n• High failure rates\n• Long holding periods")

                Button(action: onNext) {
                    Text("Finish")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.teal)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding()
        }
    }
}

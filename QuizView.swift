//
//  QuizView.swift
//
import SwiftUI

struct QuizView: View {
    @State private var currentQuestionIndex = 0
    @State private var selectedAnswers: [String] = []
    @State private var showResult = false

    let questions: [Question] = [
        Question(text: "Balanced or Heavy?", answers: ["Balanced", "Heavy"]),
        Question(text: "Fast or Floaty movement?", answers: ["Fast", "Floaty"]),
        Question(text: "Sword or Projectile?", answers: ["Sword", "Projectile"]),
        Question(text: "Tricky or Magic?", answers: ["Tricky", "Magic"]),
        Question(text: "Close combat or Distance control?", answers: ["Close Combat", "Distance Control"]),
        Question(text: "Risk or Safety?", answers: ["Risk", "Safety"]),
        Question(text: "Fast kills or Consistent pressure?", answers: ["Fast Kills", "Consistent Pressure"]),
        Question(text: "Combos or Power?", answers: ["Combo-heavy", "Powerful Hits"])
    ]

    let characterTraits: [String: [String]] = [
        "Balanced": ["Mario"],
        "Heavy": ["Bowser"],
        "Fast": ["Fox"],
        "Floaty": ["Kirby"],
        "Sword": ["Link"],
        "Projectile": ["Samus"],
        "Tricky": ["Mr. Game & Watch"],
        "Magic": ["Zelda"],
        "Close Combat": ["Little Mac"],
        "Distance Control": ["Simon"],
        "Risk": ["Roy"],
        "Safety": ["Peach"],
        "Fast Kills": ["Pikachu"],
        "Consistent Pressure": ["Lucas"],
        "Combo-heavy": ["Falco"],
        "Powerful Hits": ["Ridley"]
    ]

    var body: some View {
        VStack(spacing: 20) {
            if showResult {
                let result = calculateResult()
                ResultView(characterName: result)
            } else {
                Text(questions[currentQuestionIndex].text)
                    .font(.title2)
                    .padding()

                ForEach(questions[currentQuestionIndex].answers, id: \.self) { answer in
                    Button(action: {
                        selectedAnswers.append(answer)
                        if currentQuestionIndex + 1 < questions.count {
                            currentQuestionIndex += 1
                        } else {
                            showResult = true
                        }
                    }) {
                        Text(answer)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue.opacity(0.2))
                            .cornerRadius(10)
                    }
                }

                Spacer()

                VStack {
                    Button("Retake Quiz") {
                        currentQuestionIndex = 0
                        selectedAnswers = []
                        showResult = false
                    }
                    .padding()

                    NavigationLink("Go Home", destination: HomeView())
                        .padding()
                }
            }
        }
        .padding()
    }

    func calculateResult() -> String {
        var characterScores: [String: Int] = [:]
        for answer in selectedAnswers {
            if let characters = characterTraits[answer] {
                for character in characters {
                    characterScores[character, default: 0] += 1
                }
            }
        }
        return characterScores.max(by: { $0.value < $1.value })?.key ?? "Mario"
    }
}

//
//  ResultView.swift
//
import SwiftUI

struct ResultView: View {
    let characterName: String

    var body: some View {
        VStack(spacing: 20) {
            Text("You should try: \(characterName)")
                .font(.largeTitle)
                .padding()

            Image("smashball")
                .resizable()
                .frame(width: 100, height: 100)

            Button("Learn More") {
                // Navigate to detail view if implemented
            }

            Button("Retake Quiz") {
                // Handled in QuizView
            }

            NavigationLink("Go Home", destination: HomeView())
        }
        .padding()
    }
}

//
//  HomeView.swift
//
import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Image("smashball")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .padding()

                Text("Smash Main")
                    .font(.largeTitle)
                    .bold()

                NavigationLink("Take the Quiz", destination: QuizView())
                    .buttonStyle(.borderedProminent)

                NavigationLink("View All Characters", destination: CharacterListView())
                    .buttonStyle(.bordered)

                Spacer()
            }
            .padding()
        }
    }
}

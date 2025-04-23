//
//  CharacterListView.swift
//
import SwiftUI

struct CharacterListView: View {
    @StateObject var viewModel = CharacterViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.characters) { character in
                NavigationLink(destination: CharacterDetailView(character: character)) {
                    CharacterCard(character: character)
                }
            }
            .navigationTitle("All Characters")
            .onAppear {
                viewModel.fetchCharacters()
            }
        }
    }
}

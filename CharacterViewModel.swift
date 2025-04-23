//
//  CharacterViewModel.swift
//
import Foundation

class CharacterViewModel: ObservableObject {
    @Published var characters: [SmashCharacter] = []

    func fetchCharacters() {
        APIService.shared.fetchCharacters { characters in
            DispatchQueue.main.async {
                self.characters = characters
            }
        }
    }
}

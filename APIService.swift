//
//  APIService.swift
//
import Foundation

class APIService {
    static let shared = APIService()

    func fetchCharacters(completion: @escaping ([SmashCharacter]) -> Void) {
        // This mock API URL will not work — replace with a real one or mock JSON
        guard let url = URL(string: "https://example.com/api/smash-characters") else {
            completion([])
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data {
                let characters = (try? JSONDecoder().decode([SmashCharacter].self, from: data)) ?? []
                completion(characters)
            } else {
                completion([])
            }
        }.resume()
    }
}

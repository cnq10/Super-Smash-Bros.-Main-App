//
//  CharacterCard.swift
//
import SwiftUI

struct CharacterCard: View {
    let character: SmashCharacter

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: character.imageUrl)) { image in
                image.resizable()
            } placeholder: {
                Image("smashball")
                    .resizable()
            }
            .frame(width: 100, height: 100)
            .clipShape(Circle())

            Text(character.name)
                .font(.headline)
            Text(character.series)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 4)
    }
}

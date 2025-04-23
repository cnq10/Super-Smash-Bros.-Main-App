//
//  CharacterDetailView.swift
//
import SwiftUI

struct CharacterDetailView: View {
    let character: SmashCharacter

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                AsyncImage(url: URL(string: character.imageUrl)) { image in
                    image.resizable()
                } placeholder: {
                    Image("smashball")
                        .resizable()
                }
                .frame(width: 200, height: 200)
                .clipShape(Circle())

                Text(character.name)
                    .font(.largeTitle)
                    .bold()

                Text(character.series)
                    .font(.title3)
                    .foregroundColor(.secondary)

                if let description = character.description {
                    Text(description)
                        .padding()
                }
            }
            .padding()
        }
    }
}

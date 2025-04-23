//
//  Character.swift
//  Super Smash Bros. Main
//
import Foundation

struct SmashCharacter: Identifiable, Codable, Equatable {
    let id = UUID()
    let name: String
    let series: String
    let imageUrl: String
    let description: String?
}

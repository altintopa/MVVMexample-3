//
//  Models.swift
//  MVVMexample-3 RickAndMorty
//
//  Created by Ahmet WOW on 19/05/2022.
//

import Foundation


struct RickAndMortyModel: Codable {
    
    let name: String
    let status: Status
    let species: Species
    let type: String
    let gender: Gender
    let origin, location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

enum Gender: String, Codable {
    case female = "Female"   
    case male = "Male"
    case unknown = "unknown"
}

enum Species: String, Codable {
    case alien = "Alien"
    case human = "Human"
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}

// MARK: - Location
struct Location: Codable {
    let name: String
    let url: String
}

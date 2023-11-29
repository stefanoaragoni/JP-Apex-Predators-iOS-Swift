//
//  ApexPredator.swift
//  JP-Apex-Predators-iOS-Swift
//
//  Created by Stefano Aragoni on 28/11/23.
//

import Foundation
import SwiftUI

// Codable in order to make every dinasaur in JSON an ApexPredator type
struct ApexPredator: Codable, Identifiable{
    
    let id: Int
    let name: String
    let type: String
    let movies: [String]
    let movieScenes: [MovieScene]
    let link: String
    
    
    func typeOverlay() -> Color {
        switch type {
            case "land":
                return .brown
            case "air":
                return .teal
            case "sea":
                return .blue
            default:
                return .brown
        }
    }
}

// Codable in order to make every dinasaur in JSON an ApexPredator type
struct MovieScene: Codable {
    
    let id: Int
    let movie: String
    let sceneDescription: String
    
}

//
//  PredatorController.swift
//  JP-Apex-Predators-iOS-Swift
//
//  Created by Stefano Aragoni on 28/11/23.
//

import Foundation

class PredatorController {
    
    private var allApexPredators: [ApexPredator] = []
    var apexPredators: [ApexPredator] = []
    let typeFilters = ["All", "Land", "Air", "Sea"]
    
    init() {
        self.decodeApexPredatorData()
    }
    
    func decodeApexPredatorData(){
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json") {
            
            do {
                
                let data = try Data(contentsOf: url)                       // Store all JSON data into data var
                let decoder = JSONDecoder()                               // Decodes de JSON data
                decoder.keyDecodingStrategy = .convertFromSnakeCase         // Can convert from snake_case to camelCase
                
                allApexPredators = try decoder.decode([ApexPredator].self, from: data)     // Stores the info in apexPredators
                apexPredators = allApexPredators
                
            } catch {
                
                print("Error decoding JSON data: \(error)")
                
            }
            
        }
    }
    
    func typeIcon(for type: String) -> String {
        switch type {
        case "All":
            return "square.stack.3d.up.fill"
        case "Land":
            return "leaf.fill"
        case "Air":
            return "wind"
        case "Sea":
            return "drop.fill"
        default:
            return "questionmark"
        }
    }
    
    func filterBy(type: String) {
        switch type {
        case "Land", "Air", "Sea":
            apexPredators = allApexPredators.filter {
                $0.type == type.lowercased()
            }
        default:
            apexPredators = allApexPredators
        }
    }
    
    func sortByAlphabetical(){
        apexPredators.sort(by: { $0.name < $1.name })       // sorts alphabetical
    }
    
    func sortByMovieAppearance(){
        apexPredators.sort(by: { $0.id < $1.id })
    }
    
    
}

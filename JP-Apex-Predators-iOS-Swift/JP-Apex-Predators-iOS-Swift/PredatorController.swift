//
//  PredatorController.swift
//  JP-Apex-Predators-iOS-Swift
//
//  Created by Stefano Aragoni on 28/11/23.
//

import Foundation

class PredatorController {
    
    var apexPredators: [ApexPredator] = []
    
    init() {
        self.decodeApexPredatorData()
    }
    
    func decodeApexPredatorData(){
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json") {
            
            do {
                
                let data = try Data(contentsOf: url)                       // Store all JSON data into data var
                let decoder = JSONDecoder()                               // Decodes de JSON data
                decoder.keyDecodingStrategy = .convertFromSnakeCase         // Can convert from snake_case to camelCase
                
                apexPredators = try decoder.decode([ApexPredator].self, from: data)     // Stores the info in apexPredators
                
            } catch {
                
                print("Error decoding JSON data: \(error)")
                
            }
            
        }
    }
    
    
}

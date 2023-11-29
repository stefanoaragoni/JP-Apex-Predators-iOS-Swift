//
//  ContentView.swift
//  JP-Apex-Predators-iOS-Swift
//
//  Created by Stefano Aragoni on 28/11/23.
//

import SwiftUI

struct ContentView: View {
    
    let apController = PredatorController()
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(apController.apexPredators) { predator in
                    
                    NavigationLink(destination: Text("Dino details go here")) {
                        PredatorRow(predator: predator)
                    }
                    
                }
                .navigationTitle("Apex Predators")
            }
        }
        
    }
}

#Preview {
    ContentView()
}

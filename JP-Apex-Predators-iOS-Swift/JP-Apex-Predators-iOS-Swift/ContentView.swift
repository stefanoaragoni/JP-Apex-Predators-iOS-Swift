//
//  ContentView.swift
//  JP-Apex-Predators-iOS-Swift
//
//  Created by Stefano Aragoni on 28/11/23.
//

import SwiftUI

struct ContentView: View {
    
    let apController = PredatorController()
    @State var sortAlphanetical = false           // if var changes View when changed, use @State
    
    var body: some View {
        
        if sortAlphanetical{
            apController.sortByAlphabetical()
        } else {
            apController.sortByMovieAppearance()
        }
        
        return NavigationStack {               // MUST use return since we're sorting before the View
            List {
                ForEach(apController.apexPredators) { predator in
                    
                    NavigationLink(destination: PredatorDetail(predator: predator)) {
                        PredatorRow(predator: predator)
                    }
                    
                }
            }
            .navigationTitle("Apex Predators")
            .toolbar {
                
                ToolbarItem(placement: .topBarLeading) {
                    
                    Button {
                        sortAlphanetical.toggle()
                    } label: {
                        if sortAlphanetical {
                            Image(systemName: "film")
                        } else {
                            Image(systemName: "textformat")
                        }
                    }
                    
                }
                
            }
            
        }
        
    }
}

#Preview {
    ContentView()
}

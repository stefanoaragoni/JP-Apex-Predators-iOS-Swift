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
    @State var currentFilter = "All"
    
    var body: some View {
        
        apController.filterBy(type: currentFilter)
        
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
                        withAnimation {
                            sortAlphanetical.toggle()
                        }
                    } label: {
                        if sortAlphanetical {
                            Image(systemName: "film")
                        } else {
                            Image(systemName: "textformat")
                        }
                    }
                    
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                
                    Menu {
                        Picker("Filter", selection: $currentFilter.animation()) {
                            ForEach(apController.typeFilters, id: \.self){ type in
                                HStack{
                                    Text(type)
                                    
                                    Spacer()
                                    
                                    Image(systemName: apController.typeIcon(for: type))
                                }
                            }
                        }
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                    }
                    
                }
                
            }
            
        }
        
    }
}

#Preview {
    ContentView()
}

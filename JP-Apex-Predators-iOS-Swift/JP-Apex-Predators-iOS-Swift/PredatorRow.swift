//
//  PredatorRow.swift
//  JP-Apex-Predators-iOS-Swift
//
//  Created by Stefano Aragoni on 28/11/23.
//

import SwiftUI

struct PredatorRow: View {
    
    let predator: ApexPredator
    
    var body: some View {
        
        HStack{
            
            // Dinosaur image
            Image("indoraptor")
                .resizable()
                .scaledToFit()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                .shadow(color: .white, radius: 1, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
            
            VStack (alignment: .leading){
                
                // Name
                Text("Indoraptor")
                    .fontWeight(.bold)
                
                // Type
                Text("Land")
                    .font(.subheadline)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 5)
                    .overlay( RoundedRectangle(cornerRadius: 20).fill(.brown.opacity(0.33)))
                
            }
        }
        
    }
}

struct PredatorRow_Previews: PreviewProvider {
    
    static var previews: some View {
        let movieScene = MovieScene(id: 3, movie: "Jurasic Park III", sceneDescription: "A young adult Tyrannosaurus appears in Jurassic Park 3. According to the official size charts, it is 37 feet long and 14.5 feet tall. When Alan Grant and the other survivors escape the Spinosaurus, they encounter the creature who is just feeding on another dinosaur. The group runs back towards the Spinosaurus and a huge battle occurs between the Tyrannosaurus and the Spinosaurus. The Spinosaurus kills the T-Rex by snapping its neck in its powerful jaws.")
        
        let predator = ApexPredator(id: 3,
                                    name: "Tyrannosaurus Rex",
                                    type: "land",
                                    movies: ["Jurassic Park",
                                             "The Lost World: Jurassic Park",
                                             "Jurassic Park III",
                                             "Jurassic World",
                                             "Jurassic World: Fallen Kingdom"],
                                    movieScenes: [movieScene],
                                    link: "https://jurassicpark.fandom.com/wiki/Tyrannosaurus_rex")
        
        PredatorRow(predator: predator)
    }
}

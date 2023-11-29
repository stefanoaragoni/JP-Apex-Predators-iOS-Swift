//
//  PredatorDetail.swift
//  JP-Apex-Predators-iOS-Swift
//
//  Created by Stefano Aragoni on 28/11/23.
//

import SwiftUI

struct PredatorDetail: View {
    
    let predator: ApexPredator
    
    var body: some View {
        ScrollView{
            
            // Can use Zstack to overlay images, or can use
            VStack(alignment: .trailing){
                Image(predator.type)
                    .resizable()
                    .scaledToFit()
                
                Image(predator.name.lowercased().filter { $0 != " "}) // $0 checks every char, and removes " "
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width/1.5,
                           height: UIScreen.main.bounds.height/4)
                    .shadow(color: .black, radius: 6, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                    .offset(y: -210)
                    .rotation3DEffect(
                        .degrees(180), axis: (x: 0.0, y: 1.0, z: 0.0)
                    )
                
                    
            }
            
        }
        .ignoresSafeArea(edges: .top)
    }
}



struct PredatorDetail_Previews: PreviewProvider {
    
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
                                    movieScenes: [movieScene, movieScene],
                                    link: "https://jurassicpark.fandom.com/wiki/Tyrannosaurus_rex")
        
        PredatorDetail(predator: predator)
    }
}

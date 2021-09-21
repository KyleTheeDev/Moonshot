//
//  ContentView.swift
//  Moonshot
//
//  Created by Kyle Miller on 5/17/21.
//
/*
 **The bundle extension is used below to load one specific type of app data from json data
 
 Complex generics used to decode json. See Bundle-Decodable.swift
 
Note: NavigationView lets us push a new custom view, or a basic type such as Text.
 
** See Mission.swift for lesson
 */

import SwiftUI

struct ContentView: View {
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    
    var body: some View {
        NavigationView {
            List(missions) { mission in
                // changed destination below to other SwiftUI View
                NavigationLink(destination: MissionView(mission: mission, astronauts: self.astronauts)) {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit() // can be used vs aspectRatio to stay in container
                        //.aspectRatio(contentMode: .fit)
                        .frame(width: 44, height: 44)
                    
                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                        Text(mission.formattedLaunchDate)
                    }
                }
            }
            .navigationBarTitle("Moonshot")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}








/*
 Working with hierarchical Codable data
 
 struct ContentView: View {
        
     var body: some View {
         Button("Decode JSON") {
             let input = """
             {
                 "name": "Taylor Swift",
                 "address": {
                     "street": "555, Taylor Swift Avenue",
                     "city": "Nashville"
                 }
             }
             """

             struct User: Codable {
                 var name: String
                 var address: Address
             }

             struct Address: Codable {
                 var street: String
                 var city: String
             }
             
             let data = Data(input.utf8)
             let decoder = JSONDecoder()
             if let user = try? decoder.decode(User.self, from: data) {
                 print(user.address.street)
             }

         }
     }
 }
 */


/*
 Creating navigation views out of Lists
 
 struct ContentView: View {
        
     var body: some View {
         NavigationView {
             /*VStack */ List(0..<100) { row in
                 NavigationLink(destination: Text("Detail \(row)")) {
                         Text("Row \(row)")
                 }
             }
             .navigationBarTitle("SwiftUI")
         }
     }
 }
 
 */


/*
 Creating full screen Scroll Views
 
 struct ContentView: View {
        
     var body: some View {
         ScrollView(.vertical) {
             VStack(spacing: 10) {
                 ForEach(0..<50) {
                     Text("Item \($0)")
                         .font(.title)
                 }
             }
             .frame(maxWidth: .infinity)
         }
     }
 }
 
 */


/*
 Auto Width Scaling for Images
 
 struct ContentView: View {
     var body: some View {
         VStack {
             GeometryReader { geo in
                 Image("UltimateCare")
                     .resizable()
                     .aspectRatio(contentMode: .fit)
                     .frame(width: geo.size.width) // GeometryReader basically an auto width framing for any screen
             }
         }
     }
 }
 */


/*
 Basic image resizing
 
 struct ContentView: View {
     var body: some View {
         VStack {
             Image("UltimateCare")
                 .resizable() // scales the uploaded image to fit on the screen
                 .aspectRatio(contentMode: .fit) // .fill = fill your frame w/ overflow || .fit = keeps orginial image ratio but inside frame
                                 //both give different options of image resizing
                 .frame(width: 300, height: 300) // gives image a frame size to be in
               //  .clipped() // Clips down the image without proper resizing
         }
     }
 }
 
 */

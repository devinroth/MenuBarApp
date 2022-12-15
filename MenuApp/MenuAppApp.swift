//
//  MenuAppApp.swift
//  MenuApp
//
//  Created by Devin Roth on 2022-12-12.
//

import SwiftUI

@main
struct MenuAppApp: App {
    
    var theBeatles = TheBeatles()
    
    var body: some Scene {
        MenuBarExtra("MenuBarExtra") {
            ContentView().environmentObject(theBeatles)
        }.menuBarExtraStyle(.window)
        
        Window("Window", id: "Window") {
            ContentView().environmentObject(theBeatles)
        }
    }
}

struct ContentView: View {
    
    @EnvironmentObject var theBeatles: TheBeatles
    
    var body: some View {
        VStack {
            Toggle("I love The Beatles", isOn: $theBeatles.iLoveTheBeatles)
            
            Divider()
            
            Text("Favorite Beatle")
            Menu(theBeatles.favoriteBeatle) {
                ForEach(theBeatles.beatles, id: \.self) { beatle in
                    Button(beatle) {
                        theBeatles.favoriteBeatle = beatle
                    }
                }
            }
            
            Divider()
            
            Text("The Beatles")
            List {
                ForEach(theBeatles.beatles, id: \.self) { beatle in
                    Text(beatle)
                }.onMove {
                    theBeatles.beatles.move(fromOffsets: $0, toOffset: $1)
                }
            }

        }.padding()
    }
}

class TheBeatles: ObservableObject {
    
    @Published public var iLoveTheBeatles: Bool = true {
        didSet {
            print(iLoveTheBeatles)
        }
    }
    
    @Published public var favoriteBeatle = "George" {
        didSet {
            print(favoriteBeatle)
        }
    }
    
    @Published public var beatles: [String] = ["John", "Paul", "George", "Ringo"] {
        didSet {
            print(beatles)
        }
    }
    
}

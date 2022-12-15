//
//  MenuAppApp.swift
//  MenuApp
//
//  Created by Devin Roth on 2022-12-12.
//

import SwiftUI

@main
struct MenuAppApp: App {
    
    @StateObject var test = Test()
    
    var body: some Scene {
        MenuBarExtra("MenuBarExtra") {
            VStack {
                Text("MenuBarExtra")
                getView()
            }
        }.menuBarExtraStyle(.window)
        
//        WindowGroup {
//            VStack {
//                Text("WindowGroup")
//                getView()
//            }
//        }
    }
    
    func getView()->some View {
        VStack {
            Toggle("Toggle", isOn: $test.toggle)
            
            Menu(test.favoriteBeatle) {
                ForEach(test.beatles, id: \.self) { beatle in
                    Button(beatle) {
                        test.favoriteBeatle = beatle
                    }
                }
            }

            List {
                ForEach(test.beatles, id: \.self) { beatle in
                    Text(beatle)
                }.onMove {
                    test.beatles.move(fromOffsets: $0, toOffset: $1)
                }
            }
        }
    }
}

class Test: ObservableObject {
    
    @Published public var toggle: Bool = true {
        didSet {
            print(toggle)
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

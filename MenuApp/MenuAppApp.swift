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
        MenuBarExtra("Title") {
            VStack {
                Toggle("Toggle", isOn: $test.toggle)

                List {
                    ForEach(test.beatles, id: \.self) { beatle in
                        Text(beatle)
                    }.onMove {
                        test.beatles.move(fromOffsets: $0, toOffset: $1)
                    }
                }
            }
        }.menuBarExtraStyle(.window)
        
//        WindowGroup {
//            VStack {
//                Toggle("Toggle", isOn: $test.toggle)
//
//                List {
//                    ForEach(test.beatles, id: \.self) { beatle in
//                        Text(beatle)
//                    }.onMove {
//                        test.beatles.move(fromOffsets: $0, toOffset: $1)
//                    }
//                }
//            }
//        }
    }
}

class Test: ObservableObject {
    
    @Published public var toggle: Bool = true {
        didSet {
            print(toggle)
        }
    }
    @Published public var beatles: [String] = ["John", "Paul", "George", "Ringo"] {
        didSet {
            print(beatles)
        }
    }
    
}

//  floatingTabViewApp.swift
//  Created by Sebastian Whitfield on 11/11/2022.
import SwiftUI

@main
struct floatingTabViewApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


struct ContentView: View {
    var body: some View {
        FloatingTabView()
    }
}

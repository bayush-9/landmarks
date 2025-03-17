//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Ayush Bharsakle on 09/03/25.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @State private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView().environment(modelData)
        }
    }
}

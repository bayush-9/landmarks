//
//  ContentView.swift
//  Landmarks
//
//  Created by Ayush Bharsakle on 09/03/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

#Preview {
    ContentView().environment(ModelData())
}

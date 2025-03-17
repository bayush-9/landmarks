//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Ayush Bharsakle on 10/03/25.
//

import SwiftUI

struct LandmarkList: View {
    @Environment(ModelData.self) var modelData
    @State private var showFavorites = false;
    
    var filteredLandmarks : [Landmark] { modelData.landmarks.filter {landmark in
            (!showFavorites || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List{
                Toggle(isOn: $showFavorites){
                    Text("Show Favs Only")
                }
                ForEach(filteredLandmarks){
                    landmark in
                    NavigationLink{
                        LandMarkDetail(landmark : landmark)
                    }label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }  .animation(.default, value: filteredLandmarks)
            .navigationTitle("Landmarks List")
        } detail: {
            Text("Select A landmark")
        }
    }
}

#Preview {
    LandmarkList()
}

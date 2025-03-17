//
//  LandMarkDetail.swift
//  Landmarks
//
//  Created by Ayush Bharsakle on 16/03/25.
//

import SwiftUI
import MapKit

struct LandMarkDetail: View {
    @Environment(ModelData.self) var modelData
    var landmark : Landmark
    
    var landmarkIndex: Int {
            modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
        }
    
    var body: some View {
        @Bindable var modelData = modelData
        ScrollView {
            MapView(coordinates: CLLocationCoordinate2D(latitude: landmark.locationCoordinates.latitude, longitude: landmark.locationCoordinates.longitude)).frame(height: 300)
            CircleImage(image: landmark.image)
                .offset(y:-130)
                .padding(.bottom, -130)
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name).font(.title)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                } .font(.subheadline)
                    .foregroundStyle(.secondary)
                Divider()
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }.padding()
        }.navigationTitle(landmark.name)
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let modelData = ModelData();
    return LandMarkDetail(landmark: modelData.landmarks[0]).environment(modelData)
}

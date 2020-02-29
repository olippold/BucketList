//
//  CustomMapView.swift
//  BucketList
//
//  Created by Oliver Lippold on 29/02/2020.
//  Copyright © 2020 Oliver Lippold. All rights reserved.
//

import SwiftUI
import MapKit

struct CustomMapView: View {
    @Binding var centerCoordinate: CLLocationCoordinate2D
    @Binding var selectedPlace: MKPointAnnotation?
    @Binding var showingPlaceDetails: Bool
    @Binding var locations: [CodableMKPointAnnotation]
    @Binding var showingEditScreen: Bool
    
    var body: some View {
        ZStack {
            MapView(centerCoordinate: $centerCoordinate, selectedPlace: $selectedPlace, showingPlaceDetails: $showingPlaceDetails, annotations: locations)
                .edgesIgnoringSafeArea(.all)
            
            Circle()
                .fill(Color.blue)
                .opacity(0.3)
                .frame(width: 32, height: 32)
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        let newLocation = CodableMKPointAnnotation()
                        newLocation.title = "Example Location"
                        newLocation.coordinate = self.centerCoordinate
                        self.locations.append(newLocation)
                        self.selectedPlace = newLocation
                        self.showingEditScreen = true
                    }) {
                        Image(systemName: "plus")
                            .padding()
                            .background(Color.black.opacity(0.75))
                            .foregroundColor(.white)
                            .font(.title)
                            .clipShape(Circle())
                            .padding(.trailing)
                    }
                    
                }
            }
        }
    }
}

/*struct CustomMapView_Previews: PreviewProvider {
    static var previews: some View {
        CustomMapView(centerCoordinate: .constant(<#T##value: CLLocationCoordinate2D##CLLocationCoordinate2D#>), selectedPlace: $selectedPlace, showingPlaceDetails: .constant(false), locations: $locations, showingEditScreen: .constant(false))
    }
} */

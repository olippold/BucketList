//
//  ContentView.swift
//  BucketList
//
//  Created by Oliver Lippold on 16/02/2020.
//  Copyright © 2020 Oliver Lippold. All rights reserved.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var centerCoordinate = CLLocationCoordinate2D()
    @State private var locations = [MKPointAnnotation]()
    @State private var selectedPlace: MKPointAnnotation?
    @State private var showingPlaceDetails = false
    
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
                        let newLocation = MKPointAnnotation()
                        newLocation.title = "Example Location"
                        newLocation.coordinate = self.centerCoordinate
                        self.locations.append(newLocation)
                    }) {
                        Image(systemName: "plus")
                    }
                .padding()
                    .background(Color.black.opacity(0.75))
                    .foregroundColor(.white)
                    .font(.title)
                .clipShape(Circle())
                    .padding(.trailing)
                }
            }
            
        }
        .alert(isPresented: $showingPlaceDetails) {
            Alert(title: Text(selectedPlace?.title ?? "Unknown"), message: Text(selectedPlace?.subtitle ?? "Missing place information."), primaryButton: .default(Text("OK")), secondaryButton: .default(Text("Edit")) {
                // edit this place
                })
        }
    }
    
    /*func getDocumentsDirectory() -> URL {
     // find all possible document directories for this user
     let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
     
     // just send back the first one, which ought to be the only one
     return paths[0]
     }
     
     func authenticate() {
     let context = LAContext()
     var error: NSError?
     
     // check whether biometric authentication is possible
     if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
     // it's possible so go ahead and use it
     let reason = "We need to unlock your data"
     
     context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {success, authenticationError in
     // Authentication has now completed
     DispatchQueue.main.async {
     if success {
     self.isUnlocked = true
     } else {
     // there was a problem
     }
     }
     }
     } else {
     // no biometrics
     }
     } */
}

/* struct User: Identifiable, Comparable {
 let id = UUID()
 let firstName: String
 let lastName: String
 
 static func < (lhs: User, rhs: User) -> Bool {
 lhs.lastName < rhs.lastName
 }
 
 
 } */

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

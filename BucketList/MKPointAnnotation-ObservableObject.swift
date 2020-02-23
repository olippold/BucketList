//
//  MKPointAnnotation-ObservableObject.swift
//  BucketList
//
//  Created by Oliver Lippold on 23/02/2020.
//  Copyright © 2020 Oliver Lippold. All rights reserved.
//

import MapKit

extension MKPointAnnotation: ObservableObject {
    public var wrappedTitle: String {
        get {
            self.title ?? "Unknown value"
        }
        
        set {
            title = newValue
        }
    }
    
    public var wrappedSubtitle: String {
        get {
                   self.subtitle ?? "Unknown value"
               }
               
               set {
                   subtitle = newValue
               }
    }
}

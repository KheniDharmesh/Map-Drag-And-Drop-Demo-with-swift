//
//  pinAnnotation.swift
//  applemap
//
//  Created by Dharmesh on 06/07/17.
//  Copyright © 2017 Dharmesh. All rights reserved.
//

import Foundation
import MapKit

class pinAnnotation:NSObject,MKAnnotation
{
    var title:String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    init(title:String,subtitle:String,coordinate:CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
}

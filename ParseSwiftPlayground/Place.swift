//
//  Place.swift
//  ParseSwiftPlayground
//
//  Created by Geoffrey Dudgeon on 10/4/15.
//  Copyright © 2015 Geoff Dudgeon. All rights reserved.
//

import UIKit
import Parse

struct Place {
    var name: String = ""
    var location: String = ""
    var objectId: String = ""
    
    static var list: [Place] {
        
        var tempPlaces = [Place]()
        let query = PFQuery(className:"Place")

        query.findObjectsInBackgroundWithBlock {
            (places: [PFObject]?, error: NSError?) -> Void in
            
            if error == nil {
                
                print("Successfully retrieved \(places!.count) places.")
                
                if let places = places {
                    
                    for place in places {
                        
                        var currentPlace = Place()
                        
                        currentPlace.objectId = place.objectId! as String
                        currentPlace.name = place["name"] as! String
                        currentPlace.location = place["location"] as! String
                        
                        tempPlaces.append(currentPlace)
                    }
                    
                    print(tempPlaces[0].name)
                }
            } else {
                // Log details of the failure
                print("Error")
            }
        }

    
        return tempPlaces

    } // end Place.list

}
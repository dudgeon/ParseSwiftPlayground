//
//  ViewController.swift
//  ParseSwiftPlayground
//
//  Created by Geoffrey Dudgeon on 9/26/15.
//  Copyright © 2015 Geoff Dudgeon. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {
    
    @IBOutlet weak var placeName: UITextField!
    @IBOutlet weak var placeLocation: UITextField!
    @IBOutlet weak var placeTable: UITableView!
    @IBOutlet weak var placeSaveButton: UIButton!
    
    @IBAction func placeSaveButton(sender: AnyObject) {
        
        // disable the save button
        placeSaveButton.enabled = false
        
        // we will be saving a new Parse Object of class "Place"
        let newPlace = PFObject(className: "Place")

        // get metadata from the form, unwrapping optionals
        if let name = placeName.text{
            newPlace["name"] = name
        }
        if let location = placeLocation.text{
            newPlace["location"] = location
        }
        
        // save new place to Parse Place class
        newPlace.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if (success) {
                // The object has been saved.
                print("Saved place: \(self.placeName.text!)")
                self.placeSaveButton.enabled = true
                
                // clear the input fields
                self.placeName.text = ""
                self.placeLocation.text = ""
            } else {
                // There was a problem, check error.description
                self.placeSaveButton.enabled = true
            }
        }
        
        

        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var placeList = Place.list


        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


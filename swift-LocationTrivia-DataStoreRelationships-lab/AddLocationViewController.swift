//
//  AddLocationViewController.swift
//  swift-LocationTrivia-DataStoreRelationships-lab
//
//  Created by ac on 3/7/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation


class AddLocationViewController:UIViewController, CLLocationManagerDelegate {
    
    //var location = Location()
    //
    let locationManager = CLLocationManager()

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var latitudeField: UITextField!
    @IBOutlet weak var longitudeField: UITextField!
    
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    
    @IBAction func useCurrentLocationAction(_ sender: Any) {
        
        //Ask for authorization
        //locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            //locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
            print("In locationServicesEnabled()")
        }
    }
    
    
    @IBAction func saveButtonAction(_ sender: Any) {
        let name = nameField.text ??  ""
        let location = Location(name: name, latitude: Float(latitudeField.text!)!, longitude: Float(longitudeField.text!)!)
        locations.locations.append(location)
        print("In saveButton")
        dismiss(animated: true )  //why different??

    }
    
    @IBAction func cancelButtonAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    let locations = LocationsDataStore.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.accessibilityLabel = "nameField"
        nameField.accessibilityIdentifier = "nameField"
        
        latitudeField.accessibilityIdentifier = "latitudeField"
        latitudeField.accessibilityLabel = "latitudeField"
        
        longitudeField.accessibilityLabel = "longitudeField"
        longitudeField.accessibilityIdentifier = "longitudeField"
        
        saveButton.accessibilityIdentifier = "saveButton"
        saveButton.accessibilityLabel = "saveButton"
        
        cancelButton.accessibilityLabel = "cancelButton"
        cancelButton.accessibilityIdentifier = "cancelButton"
        
        self.navigationItem.rightBarButtonItem?.accessibilityIdentifier = "addButton"
        self.navigationItem.rightBarButtonItem?.accessibilityLabel = "addButton"
        
        locationManager.delegate = self
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("In func locationManager")
        let locValue:CLLocationCoordinate2D = (manager.location?.coordinate)!
        latitudeField.text = String(locValue.latitude)
        longitudeField.text = String(locValue.longitude)
    }
    
    
//    override func viewDidAppear(_ animated: Bool) {
//        if cancelButton.isSelected {
//            print("In cancelButton")
//            self.dismiss(animated: true)
//        } else
//        if saveButton.isSelected {
//            let name = nameField.text ??  ""
//            let location = Location(name: name, latitude: Float(latitudeField.text!)!, longitude: Float(longitudeField.text!)!)
//            locations.locations.append(location)
//            print("In saveButton")
//            self.dismiss(animated: true )  //why different??
//            
//        }
//        
//    }
    
    
    
    
}


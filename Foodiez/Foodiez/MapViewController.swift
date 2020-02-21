//
//  MapViewController.swift
//  Foodiez
//
//  Created by Tilakbhai Suthar on 2019-12-02.
//  Copyright © 2019 Jay Shah. All rights reserved.
//

import Foundation
import MapKit
import UIKit

class MapViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var FoodiezLabelMapView: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var locateMapButton: UIButton!
    @IBOutlet weak var addPinbutton: UIButton!
    
    @IBOutlet weak var mapView: MKMapView!
    private let restaurants = ["Barrie", "Sudbury", "Toronto"]
    
    private let levels = ["-2", "-1", "0", "+1", "+2"]
    
    private let restaurantDegrees = [
        0: ["latitude": 44.389496, "longitude": -79.684738],
        1: ["latitude": 46.491107, "longitude": -80.991514],
        2: ["latitude": 43.665897, "longitude": -79.732163]
    ]
    
    private let zoomLevels = [
        0: 2,
        1: 1,
        2: 0.5,
        3: 0.1,
        4: 0.01
    ]
    
    private let restaurantComponent = 0
    private let levelsComponent = 1
    
    private var latestLocation = ""
    
    private var coordinates = CLLocationCoordinate2D()
    
    private var tableData = [
           "No data",
           "No data",
           "No data",
       ]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }

    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
                if (component == restaurantComponent)
        {
            return restaurants.count
        }
        else {
            return levels.count
        }

    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (component == restaurantComponent){
            return restaurants[row]
        }
        else {
            return levels[row]
        }
    }
    
    
    @IBAction func onLocateClick(_ sender: Any) {
        let restaurantRow =
                       pickerView.selectedRow(inComponent: restaurantComponent)
                   let levelRow =
                       pickerView.selectedRow(inComponent: levelsComponent)
                   let school = restaurants[restaurantRow]
                   let level = levels[levelRow]
               
               
                   let latitude = (restaurantDegrees[restaurantRow]?["latitude"])!
                   let longitude = restaurantDegrees[restaurantRow]?["longitude"]
                   
                   
                   let lanDelta = zoomLevels[levelRow]
                   let lonDelta = zoomLevels[levelRow]
               
                   let span = MKCoordinateSpan(latitudeDelta: lanDelta!, longitudeDelta: lonDelta!)

                   coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude!)
                   
                   let region = MKCoordinateRegion(center: coordinates, span: span)
               
                   mapView.setRegion(region, animated: true)
                   
                   latestLocation = String(school);
                   tableData.insert(latestLocation, at: 0)
//                   tableView.reloadData()
    }
    
    
    @IBAction func onAddPinClick(_ sender: Any) {
        let annotation  = MKPointAnnotation()
        annotation.title = "New Pin"
        annotation.subtitle = "There's a pin here now!"
        annotation.coordinate = coordinates
        mapView.addAnnotation(annotation)
    }
    
    override func viewDidLoad() {
           super.viewDidLoad()
           // Do any additional setup after loading the view.
           pickerView.selectRow(0, inComponent: restaurantComponent, animated: true)
           pickerView.selectRow(2, inComponent: levelsComponent, animated: true)
       }
    
}

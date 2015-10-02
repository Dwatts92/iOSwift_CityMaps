//
//  DetailViewController.swift
//  dylanwatts_lab4
//
//  Created by ddwatts on 9/19/15.
//  Copyright (c) 2015 ddwatts. All rights reserved.
//
//  Dylan Watts
//  MW 12:00
//  1202780964
//
//  A view that gets segued into from the places table.
//  Shows the corresponding name, picture, and description of the place.

import UIKit
import MapKit

class DetailViewController: UIViewController {
    
    var selectedName = String();
    var selectedImage = String();
    var selectedDescription = String();
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var placeImage: UIImageView!
    @IBOutlet weak var descriptionText: UILabel!

    @IBOutlet weak var lon: UILabel!
    @IBOutlet weak var lan: UILabel!
    
    @IBOutlet weak var `switch`: UISegmentedControl!
    
    @IBOutlet weak var myMap: MKMapView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.name.text=selectedName
        self.placeImage.image = UIImage(named: selectedImage)
        self.descriptionText.text = selectedDescription
        
        myMap.mapType = MKMapType.Satellite
        
        let addressString = selectedName
        getDirections(addressString)

    }
    
    func getDirections(sender: AnyObject){
        
        let geoCoder = CLGeocoder()
        
        // let address = "699, S. Mill Ave, Tempe, AZ, 85281"
        let address = ( sender as! NSString)
        
        var geocoder = CLGeocoder()
        geocoder.geocodeAddressString (address as String, completionHandler: {(placemarks: [AnyObject]!, error: NSError!) -> Void in
            
            if let placemark = placemarks?[0] as? CLPlacemark {
                let span = MKCoordinateSpanMake(0.02, 0.02)
                let region = MKCoordinateRegion(center: placemark.location.coordinate, span: span)
                
                var long = String(format:"%f", placemark.location.coordinate.longitude)
                var lat = String(format:"%f", placemark.location.coordinate.latitude)
                self.lon.text = long
                self.lan.text = lat
                
                self.myMap.setRegion(region, animated: true)
                var ani = MKPointAnnotation()
                ani.coordinate = placemark.location.coordinate
                ani.title = self.selectedName
                
                self.myMap.addAnnotation(ani)
            }
        })
        
    }
    
    //segmented controller
    @IBAction func switchChange(sender: AnyObject) {
        
        if `switch`.selectedSegmentIndex == 0{
            myMap.mapType = MKMapType.Satellite
        }
        else{
            myMap.mapType = MKMapType.Standard
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

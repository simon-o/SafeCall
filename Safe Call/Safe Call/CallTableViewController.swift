//
//  CallTableViewController.swift
//  Safe Call
//
//  Created by Antoine Simon on 25/04/2016.
//  Copyright © 2016 Antoine Simon. All rights reserved.
//

import UIKit
import CoreLocation

class CallTableViewController: UITableViewController, CLLocationManagerDelegate{
    
    var locationManager: CLLocationManager = CLLocationManager()
    
    @IBOutlet weak var CoordinateLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        var latestLocation: AnyObject = locations[locations.count - 1]
        
//        print("\(String(format: "%.4f", latestLocation.coordinate.latitude))")
//        print("\(String(format: "%.4f", latestLocation.coordinate.longitude))")
        
        CoordinateLabel.text = "Lat: \(String(format: "%.4f", latestLocation.coordinate.latitude)) Long: \(String(format: "%.4f", latestLocation.coordinate.longitude))"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case 1:
            UIApplication.sharedApplication().openURL(NSURL(string: "tel://\(112)")!)
            /*let alertController = UIAlertController(title: "iOScreator", message:
                "Hello, world!", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
            */
        case 2:
        UIApplication.sharedApplication().openURL(NSURL(string: "tel://\(15)")!)
        case 3:
        UIApplication.sharedApplication().openURL(NSURL(string: "tel://\(17)")!)
        case 4:
        UIApplication.sharedApplication().openURL(NSURL(string: "tel://\(18)")!)
        case 5:
        UIApplication.sharedApplication().openURL(NSURL(string: "tel://\(114)")!)
        default:
            NSLog("error")
        }
    }
}

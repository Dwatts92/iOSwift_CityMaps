//
//  ViewController.swift
//  dylanwatts_lab4
//
//  Created by ddwatts on 9/19/15.
//  Copyright (c) 2015 ddwatts. All rights reserved.
//
//  Dylan Watts
//  MW 12:00
//  1202780964
//
//  The main view which houses a view table with cells that correspond
//  to each of the pieces of data in "placesData".

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var placesTable: UITableView!
    
    var places: placesData = placesData()
    var name: String = ""
    var image: String = ""
    var descrip: String = ""
    
    var placeName: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Called when table is loaded, returns num of cells
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.visitedPlaces.count
    }
    
    //Creates each cell of the table
    func tableView(tableView: UITableView,cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("placeCell", forIndexPath: indexPath) as! UITableViewCell
        
        placeName = places.visitedPlaces[indexPath.row].getName();
        cell.textLabel?.text = placeName;
        
        //take name from cells and display little flag icon for their state
        if ((placeName == "Tempe, Arizona" ) || (placeName == "Flagstaff, Arizona"))
        {
            var cell_Image = UIImage(named: "az flag.png")
            cell.imageView?.image = cell_Image
        }
        else if (placeName == "New York, New York")
        {
            var cell_Image = UIImage(named: "new york flag.png")
            cell.imageView?.image = cell_Image
        }
        else
        {
            var cell_Image = UIImage(named: "cali flag.png")
            cell.imageView?.image = cell_Image
        }
        
        return cell;
    }
    
    //Segue gets called if cell is selected
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let selectedIndex: NSIndexPath = self.placesTable.indexPathForCell(sender as! UITableViewCell)!
        
        self.name = places.visitedPlaces[selectedIndex.row].getName();
        self.image = places.visitedPlaces[selectedIndex.row].getImage();
        self.descrip = places.visitedPlaces[selectedIndex.row].getDescription();
        
        if(segue.identifier == "details"){
            if let detailviewController: DetailViewController = segue.destinationViewController as? DetailViewController {
                detailviewController.selectedName = name;
                detailviewController.selectedImage = image;
                detailviewController.selectedDescription = descrip;
            }
        }
    }



}


//
//  placesData.swift
//  dylanwatts_lab4
//
//  Created by ddwatts on 9/19/15.
//  Copyright (c) 2015 ddwatts. All rights reserved.
//
//  Dylan Watts
//  MW 12:00
//  1202780964
//
//  Stores data for each of the five places visited:
//  The name, the image, and the description of each place.

import Foundation
class placesData
{
    var visitedPlaces: [place] = []

    init()
    {
        var newPlace = place(n:"Tempe, Arizona", i:"tempe.jpg" , d:"A small city south of Phoenix housing the largest university campus in the nation, ASU.")
        visitedPlaces.append(newPlace)
        
        newPlace = place(n:"Flagstaff, Arizona", i:"flagstaff.jpg" , d:"A colder city located in northern Arizona, home of NAU.")
        visitedPlaces.append(newPlace)
        
        newPlace = place(n:"San Diego, California", i:"san diego.jpg" , d:"A city that lies on the western Pacific coast, with notable places such as Balboa Park and Mission Beach.")
        visitedPlaces.append(newPlace)
        
        newPlace = place(n:"San Francisco, California", i:"san fran.jpg" , d:"A city located at the northern tip of CA, noted for its downhill streets, cable cars, and fog.")
        visitedPlaces.append(newPlace)
        
        newPlace = place(n:"New York, New York", i:"new york.jpg" , d:"The most famous city in the U.S., known for its crowded streets, tall buildings, and its 5 boroughs.")
        visitedPlaces.append(newPlace)
        
        
    }
  
}


class place
{
    private var name: String = ""
    private var image:String = ""
    private var description:String = ""
    
    init (n: String, i: String,  d: String)
    {
        name=n
        image=i
        description=d;
        
    }
    
    internal func getName() -> String
    {
        return name
    }
    
    internal func getImage() -> String
    {
        return image
    }
    
    internal func getDescription() -> String
    {
        return description
    }
    
    
}
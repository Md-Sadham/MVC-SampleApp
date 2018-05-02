//
//  WeatherModel.swift
//  MVCSampleApp
//
//  Created by Sadham on 29/04/2018.
//  Copyright © 2018 Sadham. All rights reserved.
//

import UIKit

class WeatherModel: NSObject {
    
    var resultsCount : Int = 0
    var resultsArray : Array<Any> = []
    
    func parseWeatherResponse(response : Dictionary<String, Any>) {
        
        resultsCount = response["resultCount"] as! Int
        resultsArray = response["results"] as! Array<Any>
    }
}

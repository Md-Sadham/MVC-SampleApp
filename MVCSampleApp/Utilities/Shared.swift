//
//  Shared.swift
//  MVCSampleApp
//
//  Created by Sadham on 29/04/2018.
//  Copyright © 2018 Sadham. All rights reserved.
//

import UIKit

class Shared: NSObject {
    static let appDelegateRef : AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    static let BASE_URL = "https://itunes.apple.com/search/media=music&entity=song&term=arr" // "http://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=b1b15e88fa797225412429c1c50c122a1"
    
    static let SUCCESS_MSG = "Weather Info retrieved successfully"
    static let FAILURE_MSG = "Something went wrong when contact weather server"

}

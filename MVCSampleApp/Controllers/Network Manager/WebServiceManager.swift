//
//  WebServiceManager.swift
//  MVCSampleApp
//
//  Created by Sadham on 29/04/2018.
//  Copyright © 2018 Sadham. All rights reserved.
//

import UIKit

class WebServiceManager: NSObject {

    // create singleton instance
    class var webServiceManagerSharedInstance : WebServiceManager {
        struct Singleton {
            static let instance = WebServiceManager()
        }
        return Singleton .instance
    }
    
    func getTodayWeatherInfo (weatherModelObj : WeatherModel,
                              Success: @escaping ((_ weatherModelObj : WeatherModel) -> Void),
                              Failure: @escaping ((_ serverError : String) -> Void)) {
        let connManagerObj = ConnectionManager.connectionManagerSharedInstance
        connManagerObj.requestGetServiceAPI(urlString: Shared.BASE_URL, onSuccess: { (responseCode : Int, serverResponse : Any) in
            let response = serverResponse as! Dictionary<String, Any>
            if !response.isEmpty {
                weatherModelObj.parseWeatherResponse(response: response)
            }
            Success(weatherModelObj)
            
        }, onFailure: { (error: String) in
            Failure(error)
        })
    }
}

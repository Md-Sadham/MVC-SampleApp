//
//  ViewController.swift
//  MVCSampleApp
//
//  Created by Sadham on 29/04/2018.
//  Copyright © 2018 Sadham. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let weatherModelObj = WeatherModel()
        
        let webserviceObj = WebServiceManager.webServiceManagerSharedInstance
        webserviceObj.getTodayWeatherInfo(weatherModelObj: weatherModelObj, Success: { (weatherModelObj : WeatherModel!) in
            
            print("MVC WORKING!!!")
            print("FINALLY, results count", weatherModelObj.resultsCount)
            
        }, Failure:  { (error: String) in
            print("FINAALy FAIILED")
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//
//  ConnectionManager.swift
//  MVCSampleApp
//
//  Created by Sadham on 29/04/2018.
//  Copyright © 2018 Sadham. All rights reserved.
//

import UIKit

class ConnectionManager: NSObject {
    typealias successCompletionHandler = (_ statusCode: Int, _ serverResponse: Any) -> Void
    typealias failureCompletionHandler = (_ error : String) -> Void
    
    class var connectionManagerSharedInstance : ConnectionManager {
        struct Singleton {
            static let instance = ConnectionManager()
        }
        return Singleton .instance
    }
    
    func requestGetServiceAPI(urlString : String, onSuccess: @escaping successCompletionHandler, onFailure: @escaping failureCompletionHandler) {
        
        print("===============================GET REQUESTING API======================================================")
        print("URL String =\(urlString)")
        
        // URL Request
        let requestUrl = URL(string: urlString)
        var urlRequest = URLRequest(url: requestUrl!)
        urlRequest.timeoutInterval = 60
        urlRequest.cachePolicy = .reloadIgnoringCacheData
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-type")
        
        // URL Session
        let urlSessionConfig = URLSessionConfiguration.default
        let urlSession = URLSession(configuration: urlSessionConfig)
        
        // Data task
        if Reachability.isConnectedToNetwork() == true {
            let task = urlSession.dataTask(with: urlRequest, completionHandler: {
                (data, response, error) in
                
                if error != nil
                {
                    print("Error  ==",error!.localizedDescription);
                    onFailure(error!.localizedDescription)
                }
                else
                {
                    let httpResponse = response as! HTTPURLResponse
                    let statusCode = httpResponse.statusCode
                    
                    do {
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: .allowFragments)
                        
                        let response = jsonResponse as! Dictionary<String,Any>
                        if !response.isEmpty {
                            
                            // Just checking whether response have value or not.
                            // Actual parsing must be done in model class.
                            // Guard type 1
                            guard response["resultCount"] != nil else {
                                return onFailure("Result count not present")
                            }
                            let resultCount = response["resultCount"] as! Int
                            print("RESULT COUNT: \(resultCount)")
                            
                            // Guard type 2
                            guard let resultsFromGuard = response["results"] as? Array<Any> else {
                                return onFailure("Results not present")
                            }
                            print("RESULTssssssssss:", resultsFromGuard)
                        }
                        onSuccess(statusCode, response)
                    }
                    catch {
                        onFailure("Json Parse Error")
                    }
                }
            })
            task.resume();
        }
        else {
            onFailure("vdvxcv")
        }
    }
}

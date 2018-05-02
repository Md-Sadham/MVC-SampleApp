//
//  OtherUtilities.swift
//  MVCSampleApp
//
//  Created by Sadham on 29/04/2018.
//  Copyright © 2018 Sadham. All rights reserved.
//

import UIKit

class OtherUtilities: NSObject {
    
    enum UIUserInterfaceIdiom : Int
    {
        case Unspecified
        case Phone
        case Pad
    }
    
    struct ScreenSize
    {
        static let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
        static let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
        static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
        static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    }
    
    struct DeviceType
    {
        static let IS_IPHONE_4_OR_LESS  = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
        static let IS_IPHONE_5          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
        static let IS_IPHONE_6          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
        static let IS_IPHONE_6P         = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
        static let IS_IPAD              = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1024
    }
    
    struct Version{
        static let SYS_VERSION_FLOAT = (UIDevice.current.systemVersion as NSString).floatValue
        static let iOS7 = (Version.SYS_VERSION_FLOAT < 8.0 && Version.SYS_VERSION_FLOAT >= 7.0)
        static let iOS8 = (Version.SYS_VERSION_FLOAT >= 8.0 && Version.SYS_VERSION_FLOAT < 9.0)
        static let iOS9 = (Version.SYS_VERSION_FLOAT >= 9.0 && Version.SYS_VERSION_FLOAT < 10.0)
    }
    
    // Tips code:
    //         return UserDefaults.standard.object(forKey: "userID") as! NSNumber
    
    class func filterSpace(removeSpace : String) -> String
    {
        let trimmedString = removeSpace.trimmingCharacters(in: .whitespacesAndNewlines)
        
        return trimmedString
    }
    
    // MARK: - Alert Methods
    class func showSuccessFailureAlert(title : String, message: String, controller : UIViewController)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let alertOKButton = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        alert.addAction(alertOKButton)
        controller.present(alert, animated: true, completion: {
            print("Alert presented success");
        })
    }
    
    class func showSuccessFailureAlertWithDismissHandler(title : String, message: String, controller : UIViewController, alertDismissed:@escaping ((_ okPressed: Bool)->Void))
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let alertOKButton = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { action in
            print("Alert Dismissed")
            alertDismissed(true)
        })
        alert.addAction(alertOKButton)
        controller.present(alert, animated: true, completion: {
            print("Alert presented success");
        })
    }
    
    class func getUserStoryboardInstance() -> UIStoryboard
    {
        let userStoryboard = UIStoryboard(name: "Main", bundle: nil)
        return userStoryboard
    }
    
    // Verify whether string is url or not
    class func verifyUrl (urlString: String?) -> Bool {
        //Check for nil
        if let urlString = urlString {
            // create NSURL instance
            if let url = NSURL(string: urlString) {
                // check if your application can open the NSURL instance
                return UIApplication.shared.canOpenURL(url as URL)
            }
        }
        return false
    }
}


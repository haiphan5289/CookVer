//
//  PushNotificationHandler.swift
//  Tourist
//
//  Created by Hận Lê on 11/28/18.
//  Copyright © 2018 TVT25. All rights reserved.
//

import Foundation
import UserNotifications
//import FirebaseMessaging
//import FirebaseCore
//import FirebaseAuth
import Firebase

enum NOTIFICATION_TYPE : Int {
    case TYPE_ORDER = 1
    case TYPE_ADMIN_CHANGE_ACCOUNT = 2
    case TYPE_UPDATE_TO_GROUP = 3
    case TYPE_SESSION = 4
    case TYPE_UPDATE_VERSION = 5
}


enum NotificationKey : String {
    case kDidReceiveNotification = "kDidReceiveNotification"
}

enum PushNotificationKeys : String {
    case adđDishes = "adđDishes"
    case deleteDishes = "deleteDishes"
    case adđNewDishes = "adđNewDishes"
    case deleteNewDishes = "deleteNewDishes"
    case adđNewGravies = "adđNewGravies"
    case deleteNewGravies = "deleteNewGravies"
}

class PushNotificationHandler {
    
    static var shared = PushNotificationHandler()
    
    func didReceiveRemoteNotification(userInfo: [AnyHashable : Any], application: UIApplication) {
        
//        if let dict_: NSDictionary = userInfo as [AnyHashable: Any]? as NSDictionary? {
//
//            guard let jsonData = try? JSONSerialization.data(withJSONObject: dict_, options: .prettyPrinted) else {
//                return
//            }
//            guard let decoded = try? JSONSerialization.jsonObject(with: jsonData, options: []) else {
//                return
//            }
//
//            guard let dict = decoded as? [String : Any] else {
//                print("failed")
//                return
//            }
//
//            NotificationCenter.default.post(name: NSNotification.Name(NotificationKey.kDidReceiveNotification.rawValue), object: nil, userInfo: nil)
//
//            var dictFull = dict
//
//
//            do {
//
//                guard let model = dictFull.toCodableObject() as PushNotificationModel? else {return}
//                if application.applicationState == .active  {
//                    self.handleNotification(model)
//                    print("active app")
//                }
//                else if application.applicationState == .inactive {
//                    DispatchQueue.main.asyncAfter(deadline: .now() +  1) {
//                        self.handleNotification(model)
//                    }
//                }
//                else if application.applicationState == .background {
//                    DispatchQueue.main.asyncAfter(deadline: .now() +  1) {
//                        self.handleNotification(model)
//                    }
//                }
//
//            } catch {
//                print("An error occurred: \(error)")
//            }
//        }
    }
    
    
    func touchedOnNotificationBanner(userInfo: [AnyHashable : Any]) {
        
        //        let VC = STORYBOARD_SETTING.instantiateViewController(withIdentifier: ProfileViewController.className) as! ProfileViewController
        //
        //        let baseVC = UIViewController.getTopViewController()
        //
        //        baseVC?.navigationController?.pushViewController(VC, animated: true)
    }
    
    func convertStringToJson(_ string: String) -> [String: Any]? {
        let data = string.data(using: .utf8)!
    
        guard let decoded = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) else {
            return nil
        }
        return (decoded as! [String : Any])
    }

    
//    func getOrderDetail(_ id: Int) {
//        let viewModel = OrderViewModel()
//        viewModel.orderDetail(id: id) { [weak self] (success, order, message) in
//            guard let order = order else {return}
//            self?.showOrderPopup(order)
//        }
//
//
//    }
//
//    func showOrderPopup(_ model: OrderModel) {
//        guard let root = UIViewController.getTopViewController() else {return}
//        let vc = STORYBOARD_ORDER.instantiateViewController(withClass: ConfirmOrderPopupVC.self)!
//        vc.orderModel = model
//        vc.modalPresentationStyle = .overFullScreen
//        root.definesPresentationContext = true
//        root.present(vc, animated: true, completion: nil)
//     }
    
    func setupNotificationFCM(_ application: UIApplication) {
        FirebaseApp.configure()
        if #available(iOS 10.0, *) {
            // For iOS 10 display notification (sent via APNS)
            //            UNUserNotificationCenter.current().delegate = self
            let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
            UNUserNotificationCenter.current().requestAuthorization(
                options: authOptions,
                completionHandler: {_, _ in })
            UNUserNotificationCenter.current().getNotificationSettings(){ (settings) in
                switch settings.soundSetting{
                case .enabled:
                    print("enabled sound setting")
                case .disabled:
                    print("setting has been disabled")
                case .notSupported:
                    print("something vital went wrong here")
                }
            }
        } else {
            let settings: UIUserNotificationSettings =
                UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            application.registerUserNotificationSettings(settings)
        }
        application.registerForRemoteNotifications()
        
        UIApplication.shared.applicationIconBadgeNumber = 0
    }
    
    
    func initFCMToken(_ application: UIApplication, tokenData: Data) -> String {
        let deviceToken:String = tokenData.reduce("", {$0 + String(format: "%02X", $1)})
        
        return deviceToken
    }
    
    func refeshFCMToken() {
        
    }
    
}

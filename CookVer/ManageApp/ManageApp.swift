//
/////  ManageApp.swift
//  baominh_ios
//
//  Created by haiphan on 09/10/2021.
//

import Foundation
import RxSwift
import AVFoundation
import CoreLocation
import UIKit

class ManageApp {
    
    struct SKProductModel {
        let productID: ProductID
        let price: NSDecimalNumber
        init(productID: ProductID, price: NSDecimalNumber) {
            self.productID = productID
            self.price = price
        }
        
        func getTextPrice() -> String {
            return "$\(self.price.roundTo())"
        }
    }
   
    private let disposeBag = DisposeBag()
    private init() {
        self.start()
    }
    
    func start() {
    }
    
    
    private func setupRX() {
        
    }
    
    //MARK: DEFAULT VALUE INAPP
    func listRawSKProduct() -> [SKProductModel] {
        var list: [SKProductModel] = []
        let w = SKProductModel(productID: .weekly, price: 0.99)
        let m = SKProductModel(productID: .monthly, price: 1.99)
        let y = SKProductModel(productID: .yearly, price: 9.99)
        list.append(w)
        list.append(m)
        list.append(y)
        return list
    }
    
}

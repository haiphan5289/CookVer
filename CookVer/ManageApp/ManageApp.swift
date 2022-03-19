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
    
    static let shared = ManageApp()
    @VariableReplay var dishes: [DishesModel] = []
    @VariableReplay var newDishes: [DishesModel] = []
    @VariableReplay var newGravies: [DishesModel] = []
   
    private let disposeBag = DisposeBag()
    private init() {
        self.start()
    }
    
    func start() {
        let getDishes = Observable.just(RealmManager.shared.getDishes())
        let addDishes = NotificationCenter.default.rx.notification(NSNotification.Name(PushNotificationKeys.adđDishes.rawValue), object: nil)
            .map { _ in RealmManager.shared.getDishes() }
        let deleteDishes = NotificationCenter.default.rx.notification(NSNotification.Name(PushNotificationKeys.deleteDishes.rawValue), object: nil)
            .map { _ in RealmManager.shared.getDishes() }
        Observable.merge(addDishes, deleteDishes, getDishes)
            .bind { [weak self] list in
                guard let wSelf = self else { return }
                wSelf.dishes = list
            }.disposed(by: self.disposeBag)
        
        let getNewDishes = Observable.just(RealmManager.shared.getAddDishes())
        let addNewDishes = NotificationCenter.default.rx.notification(NSNotification.Name(PushNotificationKeys.adđNewDishes.rawValue), object: nil)
            .map { _ in RealmManager.shared.getAddDishes() }
        let deleteNewDishes = NotificationCenter.default.rx.notification(NSNotification.Name(PushNotificationKeys.deleteNewDishes.rawValue), object: nil)
            .map { _ in RealmManager.shared.getAddDishes() }
        Observable.merge(getNewDishes, addNewDishes, deleteNewDishes)
            .bind { [weak self] list in
                guard let wSelf = self else { return }
                wSelf.newDishes = list
            }.disposed(by: self.disposeBag)
        
        let getNewGravies = Observable.just(RealmManager.shared.getAddGravies())
        let addNewGravies = NotificationCenter.default.rx.notification(NSNotification.Name(PushNotificationKeys.adđNewGravies.rawValue), object: nil)
            .map { _ in RealmManager.shared.getAddGravies() }
        let deleteNewGravies = NotificationCenter.default.rx.notification(NSNotification.Name(PushNotificationKeys.deleteNewGravies.rawValue), object: nil)
            .map { _ in RealmManager.shared.getAddGravies() }
        Observable.merge(getNewGravies, addNewGravies, deleteNewGravies)
            .bind { [weak self] list in
                guard let wSelf = self else { return }
                wSelf.newGravies = list
            }.disposed(by: self.disposeBag)
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

//
//  RealmModel.swift
//  iKanBid
//
//  Created by Quân on 7/23/19.
//  Copyright © 2019 TVT25. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

class RealmManager {
    
    struct Constant {
        static let minimum: Int = 3
    }
    
    static var shared = RealmManager()
    var realm : Realm!
    
    init() {
        migrateWithCompletion()
        realm = try! Realm()
    }
    
    func migrateWithCompletion() {
        let config = RLMRealmConfiguration.default()
        config.schemaVersion = 7
        
        config.migrationBlock = { (migration, oldSchemaVersion) in
            if (oldSchemaVersion < 1) {
                // Nothing to do!
                // Realm will automatically detect new properties and removed properties
                // And will update the schema on disk automatically
            }
        }
        
        RLMRealmConfiguration.setDefault(config)
        print("schemaVersion after migration:\(RLMRealmConfiguration.default().schemaVersion)")
        RLMRealm.default()
    }
    
    private func getDishesRealm() -> [DishesRealm]  {
        let arr = realm.objects(DishesRealm.self).toArray(ofType: DishesRealm.self)
        return arr
    }

    func updateOrInsertConfig(model: DishesModel) {
        let list = self.getDishesRealm()

        if let index = list.firstIndex(where: { $0.id == model.code  }) {
            try! realm.write {
                list[index].data = try? model.toData()
                NotificationCenter.default.post(name: NSNotification.Name(PushNotificationKeys.adđDishes.rawValue), object: model, userInfo: nil)
            }
        } else {
            let itemAdd = DishesRealm.init(model: model)
            try! realm.write {
                realm.add(itemAdd)
                NotificationCenter.default.post(name: NSNotification.Name(PushNotificationKeys.adđDishes.rawValue), object: model, userInfo: nil)
            }
        }
    }
    
    func deleteDishes(model: DishesModel) {
        let list = self.getDishesRealm()
        if let index = list.firstIndex(where: { $0.id == model.code  }) {
            try! realm.write {
                realm.delete(list[index])
                NotificationCenter.default.post(name: NSNotification.Name(PushNotificationKeys.deleteDishes.rawValue), object: list[index], userInfo: nil)
            }
        }
    }
    
    func getDishes() -> [DishesModel] {
        let listRealm = self.getDishesRealm()
        var list: [DishesModel] = []
        listRealm.forEach { model in
            guard let model = model.data?.toCodableObject() as DishesModel? else {
                return
            }
            list.append(model)
        }
        return list
    }
    
    private func getAddDishesRealm() -> [AddDishesRealm]  {
        let arr = realm.objects(AddDishesRealm.self).toArray(ofType: AddDishesRealm.self)
        return arr
    }

    func updateOrInsertAdd(model: DishesModel) {
        let list = self.getAddDishesRealm()

        if let index = list.firstIndex(where: { $0.id == model.code  }) {
            try! realm.write {
                list[index].data = try? model.toData()
                NotificationCenter.default.post(name: NSNotification.Name(PushNotificationKeys.adđNewDishes.rawValue), object: model, userInfo: nil)
            }
        } else {
            let itemAdd = AddDishesRealm.init(model: model)
            try! realm.write {
                realm.add(itemAdd)
                NotificationCenter.default.post(name: NSNotification.Name(PushNotificationKeys.adđNewDishes.rawValue), object: model, userInfo: nil)
            }
        }
    }
    
    func getAddDishes() -> [DishesModel] {
        let listRealm = self.getAddDishesRealm()
        var list: [DishesModel] = []
        listRealm.forEach { model in
            guard let model = model.data?.toCodableObject() as DishesModel? else {
                return
            }
            list.append(model)
        }
        return list
    }
    
    private func getAddGraviesRealm() -> [AddGraviesRealm]  {
        let arr = realm.objects(AddGraviesRealm.self).toArray(ofType: AddGraviesRealm.self)
        return arr
    }

    func updateOrInsertAddGravies(model: DishesModel) {
        let list = self.getAddGraviesRealm()

        if let index = list.firstIndex(where: { $0.id == model.code  }) {
            try! realm.write {
                list[index].data = try? model.toData()
                NotificationCenter.default.post(name: NSNotification.Name(PushNotificationKeys.adđNewGravies.rawValue), object: model, userInfo: nil)
            }
        } else {
            let itemAdd = AddGraviesRealm.init(model: model)
            try! realm.write {
                realm.add(itemAdd)
                NotificationCenter.default.post(name: NSNotification.Name(PushNotificationKeys.adđNewGravies.rawValue), object: model, userInfo: nil)
            }
        }
    }
    
    func getAddGravies() -> [DishesModel] {
        let listRealm = self.getAddGraviesRealm()
        var list: [DishesModel] = []
        listRealm.forEach { model in
            guard let model = model.data?.toCodableObject() as DishesModel? else {
                return
            }
            list.append(model)
        }
        return list
    }
    
}


extension Results {
    func toArray<T>(ofType: T.Type) -> [T] {
        var array = [T]()
        for i in 0 ..< count {
            if let result = self[i] as? T {
                array.append(result)
            }
        }
        return array
    }
}


extension Object {
    func toDictionary() -> [String:Any] {
        let properties = self.objectSchema.properties.map { $0.name }
        var dicProps = [String:Any]()
        for (key, value) in self.dictionaryWithValues(forKeys: properties) {
            if let value = value as? ListBase {
                dicProps[key] = value.toArray()
            } else if let value = value as? Object {
                dicProps[key] = value.toDictionary()
            } else {
                dicProps[key] = value
            }
        }
        return dicProps
    }
}

extension ListBase {
    func toArray() -> [Any] {
        var _toArray = [Any]()
        for i in 0..<self._rlmArray.count {
            if let value = self._rlmArray[i] as? Object {
                let obj = unsafeBitCast(self._rlmArray[i], to: Object.self)
                _toArray.append(obj.toDictionary())
            } else {
                _toArray.append(self._rlmArray[i])
            }
            
        }
        return _toArray
    }
}

extension Data {
    func toCodableObject<T: Codable>() -> T? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .useDefaultKeys
        if let obj = try? decoder.decode(T.self, from: self) {
            return obj
        }
        return nil    }
    
}

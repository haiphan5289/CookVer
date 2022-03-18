//
//  RealmModel.swift
//  KFC
//
//  Created by Dong Nguyen on 12/12/19.
//  Copyright © 2019 TVT25. All rights reserved.
//

import Foundation
import RealmSwift

class DishesRealm: Object {
    @objc dynamic var data: Data?
    @objc dynamic var id: Int = 0

    init(model: DishesModel) {
        super.init()
        do {
            self.data = try model.toData()
            self.id = model.code ?? 0
        } catch {
            print("\(error.localizedDescription)")
        }
        

    }
    required init() {
        super.init()
    }
}

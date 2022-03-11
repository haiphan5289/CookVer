//
//  DishesModel.swift
//  CookVer
//
//  Created by haiphan on 10/03/2022.
//

import Foundation
import UIKit

struct DishesModel: Codable {
    let code: Int?
    let title, image, resources, cooking: String?
    enum CodingKeys: String, CodingKey {
        case title
        case resources
        case image
        case code
        case cooking
    }
    
    func getImage() -> UIImage? {
        guard let text = self.image else {
            return nil
        }
        return UIImage(named: "\(text)")
    }
    
}

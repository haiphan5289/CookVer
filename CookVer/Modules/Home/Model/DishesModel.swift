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
    var dataImage: Data?
    
    enum CodingKeys: String, CodingKey {
        case title
        case resources
        case image
        case code
        case cooking
        case dataImage
    }
    
    func getImage() -> UIImage? {
        if let text = self.image {
            return  UIImage(named: "\(text)")
        }
        
        if let data = self.dataImage {
            do {
                return try UIImage(imageData: data)
            } catch {
                print(error.localizedDescription)
            }
            
        }
        
        return Asset.icGalary.image
    }
    
}

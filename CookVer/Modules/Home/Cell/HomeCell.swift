//
//  HomeCell.swift
//  CookVer
//
//  Created by haiphan on 10/03/2022.
//

import UIKit

class HomeCell: UICollectionViewCell {
    
    struct Constant {
        static let xShadow: CGFloat = 0
        static let yShadow: CGFloat = 4
        static let spreadShadow: CGFloat = -6
        static let blur: CGFloat = 54
        static let numberOfCell: CGFloat = 3
        static let spacingSection: CGFloat = 26
        static let size: CGSize = CGSize(width: 100, height: 88)
    }

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.clipsToBounds = true
        self.layer.borderColor = Asset.backOpacity06.color.cgColor
        self.layer.borderWidth = 1
        self.backgroundColor = .white
        self.layer.applySketchShadow(color: Asset.backOpacity06.color,
                                                      alpha: 1,
                                                      x: Constant.xShadow,
                                                      y: Constant.yShadow,
                                                      blur: Constant.blur,
                                                      spread: Constant.spreadShadow)
    }

}

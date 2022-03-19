//
//  SettingCell.swift
//  CookVer
//
//  Created by haiphan on 19/03/2022.
//

import UIKit

class SettingCell: UICollectionViewCell {
    
    struct Constant {
        static let xShadow: CGFloat = 0
        static let yShadow: CGFloat = 4
        static let spreadShadow: CGFloat = -6
        static let blur: CGFloat = 54
    }

    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var img: UIImageView!
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
        self.layer.cornerRadius = 20
    }

}
extension SettingCell {
    
    func setupValue(value: SettingVC.StatusCell) {
        self.img.image = value.img
        self.lbTitle.text = value.text
    }
    
}

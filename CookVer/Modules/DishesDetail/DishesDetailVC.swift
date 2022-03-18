
//
//  
//  DishesDetailVC.swift
//  CookVer
//
//  Created by haiphan on 18/03/2022.
//
//
import UIKit
import RxCocoa
import RxSwift

class DishesDetailVC: BaseNavigationViewController {
    
    var model: DishesModel?
    
    // Add here outlets
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbResources: UILabel!
    @IBOutlet weak var lbContents: UILabel!
    
    // Add here your view model
    private var viewModel: DishesDetailVM = DishesDetailVM()
    
    private let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setupRX()
    }
    
}
extension DishesDetailVC {
    
    private func setupUI() {
        // Add here the setup for the UI
        title = "How to cook this dishes"
        if let model = self.model {
            self.img.image = model.getImage()
            self.lbTitle.text = model.title
            self.lbResources.text = model.resources
            self.lbContents.text = model.cooking
        }
        
        if let model = self.model, (ManageApp.shared.dishes.firstIndex(where: { $0.code == model.code }) != nil) {
            self.buttonRight.setImage(Asset.icHeart.image, for: .normal)
        } else {
            self.buttonRight.setImage(Asset.icUnheart.image, for: .normal)
        }
        
    }
    
    private func setupRX() {
        // Add here the setup for the RX
    }
}

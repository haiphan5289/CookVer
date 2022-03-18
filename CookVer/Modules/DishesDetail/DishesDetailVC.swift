
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
    
    enum StatusDishes {
        case like, unLike
    }
    
    var model: DishesModel?
    
    // Add here outlets
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbResources: UILabel!
    @IBOutlet weak var lbContents: UILabel!
    
    // Add here your view model
    private var viewModel: DishesDetailVM = DishesDetailVM()
    @VariableReplay private var statusDish: StatusDishes = .unLike
    
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
    }
    
    private func setupRX() {
        // Add here the setup for the RX
        ManageApp.shared.$dishes.asObservable().bind { [weak self] list in
            guard let wSelf = self, let model = wSelf.model else { return }
            if (list.firstIndex(where: { $0.code == model.code }) != nil) {
                wSelf.statusDish = .like
            } else {
                wSelf.statusDish = .unLike
            }
        }.disposed(by: self.disposeBag)
        
        self.$statusDish.asObservable().bind { [weak self] stt in
            guard let wSelf = self else { return }
            switch stt {
            case .like: wSelf.buttonRight.setImage(Asset.icHeart.image, for: .normal)
            case .unLike: wSelf.buttonRight.setImage(Asset.icUnheart.image, for: .normal)
            }
        }.disposed(by: self.disposeBag)
        
        self.buttonRight.rx.tap.bind { [weak self] _ in
            guard let wSelf = self, let model = wSelf.model else { return }
            switch wSelf.statusDish {
            case .like: RealmManager.shared.deleteDishes(model: model)
            case .unLike: RealmManager.shared.updateOrInsertConfig(model: model)
            }
        }.disposed(by: self.disposeBag)
        
        
    }
}


//
//  
//  HomeVC.swift
//  CookVer
//
//  Created by haiphan on 09/03/2022.
//
//
import UIKit
import RxCocoa
import RxSwift

class HomeVC: BaseNavigationViewController {
    
    // Add here outlets
    
    // Add here your view model
    private var viewModel: HomeVM = HomeVM()
    
    private let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setupRX()
    }
    
}
extension HomeVC {
    
    private func setupUI() {
        // Add here the setup for the UI
        title = L10n.Tabbar.home
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let vc = HomeVC.createVC()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    private func setupRX() {
        // Add here the setup for the RX
    }
}

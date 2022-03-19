
//
//  
//  SettingVC.swift
//  CookVer
//
//  Created by haiphan on 19/03/2022.
//
//
import UIKit
import RxCocoa
import RxSwift

class SettingVC: UIViewController {
    
    // Add here outlets
    
    // Add here your view model
    private var viewModel: SettingVM = SettingVM()
    
    private let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setupRX()
    }
    
}
extension SettingVC {
    
    private func setupUI() {
        // Add here the setup for the UI
    }
    
    private func setupRX() {
        // Add here the setup for the RX
    }
}

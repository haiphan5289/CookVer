//
//  BaseTabarViewController.swift
//  Ayofa
//
//  Created by Admin on 3/5/20.
//  Copyright © 2020 ThanhPham. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import SnapKit

class BaseTabbarViewController: UITabBarController {
    
    enum TypeTabbar: Int, CaseIterable {
        case home, gravy, myfavourite, setting
        
        var viewcontrollers: UINavigationController {
            switch self {
            case .home:
                let vc = HomeVC.createVC()
                let navi = UINavigationController(rootViewController: vc)
                return navi
            case .myfavourite:
                let vc = HomeVC.createVC()
                let navi = UINavigationController(rootViewController: vc)
                return navi
            case .setting:
                let vc = HomeVC.createVC()
                let navi = UINavigationController(rootViewController: vc)
                return navi
            case .gravy:
                let vc = GravyVC.createVC()
                let navi = UINavigationController(rootViewController: vc)
                return navi
            }
        }
        
        var title: String {
            switch self {
            case .home: return L10n.Tabbar.home
            case .myfavourite: return L10n.Tabbar.myfavourite
            case .setting: return L10n.Tabbar.settings
            case .gravy: return L10n.Tabbar.gravy
            }
        }
        var img: UIImage {
            switch self {
            case .home: return Asset.icHome.image
            case .myfavourite: return Asset.icFavorite.image
            case .setting: return Asset.icSettings.image
            case .gravy: return Asset.icGravy.image
            }
        }
        
    }
    
    private let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.setupVar()
        self.setupUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func setupVar() {
        setupTabbar()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //        let height: CGFloat = tabBar.frame.height + Constant.shared.getHeightSafeArea(type: .bottom)
        //        var tabFrame            = tabBar.frame
        //        tabFrame.size.height    = height
        //        tabFrame.origin.y       = view.frame.size.height - height
        //        self.customTabbar.frame            = tabFrame
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        //        guard let listTabbar = self.tabBar.items else {
        //            return
        //        }
        //
        //        listTabbar.enumerated().forEach { (tabbar) in
        //            if let type = TypeTabbar(rawValue: tabbar.offset) {
        //                if tabbar.element == item {
        //                    tabbar.element.image = type.imageActive
        //                } else {
        //                    tabbar.element.image = type.image
        //                }
        //            }
        //        }
        
    }
    
    func setupUI() {
        self.tabBar.isTranslucent = false
        UITabBar.appearance().tintColor = Asset.primary.color
        UITabBar.appearance().barTintColor = .white
        //self.view.backgroundColor = Asset.colorApp.color
        if #available(iOS 15.0, *) {
            let appearance: UITabBarAppearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .white
            tabBar.standardAppearance = appearance
            tabBar.scrollEdgeAppearance = appearance
        }
    }
    
    func setupTabbar() {
        self.viewControllers = TypeTabbar.allCases.map { $0.viewcontrollers }
        TypeTabbar.allCases.forEach { (type) in
            if let vc = self.viewControllers?[type.rawValue] {
                vc.tabBarItem.title = type.title
                vc.tabBarItem.image = type.img
            }
        }
        
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        // Handle didSelect viewController method here
    }
}

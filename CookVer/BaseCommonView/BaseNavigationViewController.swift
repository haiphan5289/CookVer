//
//  BaseNavigationViewController.swift
//  Audio
//
//  Created by paxcreation on 3/30/21.
//

import UIKit
import RxSwift
import RxCocoa

class BaseNavigationViewController: UIViewController {
    
    let buttonLeft = UIButton(frame: CGRect(origin: .zero, size: CGSize(width: 44, height: 44)))
    let buttonRight = UIButton(frame: CGRect(origin: .zero, size: CGSize(width: 44, height: 44)))

    private let disposebag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
        setupNavigation()
    }
    
    private func setupNavigation() {
        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            if let navBar = self.navigationController {
                let bar = navBar.navigationBar
                bar.standardAppearance = appearance
                bar.scrollEdgeAppearance = appearance
            }

        }
        
        var filled = UIButton.Configuration.plain()
        filled.buttonSize = .small
        filled.image = Asset.icSearch.image

        filled.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: -16, bottom: 0, trailing: 0)
        self.buttonLeft.configuration = filled
        let leftBarButton = UIBarButtonItem(customView: buttonLeft)


        var filledRight = UIButton.Configuration.plain()
        filledRight.buttonSize = .small
        filledRight.image = Asset.icAdd.image
        filledRight.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: -16)
        self.buttonRight.configuration = filledRight
        let rightBarButton = UIBarButtonItem(customView: self.buttonRight)

        navigationItem.leftBarButtonItem = leftBarButton
        navigationItem.rightBarButtonItem = rightBarButton
        
    }
    
}

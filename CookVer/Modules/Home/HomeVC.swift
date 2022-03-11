
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
    
    struct Constant {
        static let sizeCell: CGSize = CGSize(width: 100, height: 150)
        static let spaceSection: CGFloat = 20
    }
    
    // Add here outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // Add here your view model
    private var viewModel: HomeVM = HomeVM()
    private var listDishes: [DishesModel] = []
    
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
        self.collectionView.register(HomeCell.nib, forCellWithReuseIdentifier: HomeCell.identifier)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    private func setupRX() {
        // Add here the setup for the RX
        self.viewModel.dishesEvent.asObservable().bind { [weak self] list in
            guard let wSelf = self else { return }
            wSelf.listDishes = list
            wSelf.collectionView.reloadData()
        }.disposed(by: self.disposeBag)
    }
}
extension HomeVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listDishes.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCell.identifier, for: indexPath) as? HomeCell else {
            fatalError("")
        }
        let item = self.listDishes[indexPath.row]
        cell.lbTitle.text = item.title
        cell.img.image = item.getImage()
        return cell
    }
    
    
}
extension HomeVC: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return Constant.sizeCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Constant.spaceSection
    }
}

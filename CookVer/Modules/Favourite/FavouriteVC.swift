
//
//  
//  FavouriteVC.swift
//  CookVer
//
//  Created by haiphan on 18/03/2022.
//
//
import UIKit
import RxCocoa
import RxSwift

class FavouriteVC: BaseNavigationViewController {
    
    struct Constant {
        static let sizeCell: CGSize = CGSize(width: 100, height: 150)
        static let spaceSection: CGFloat = 20
    }
    
    // Add here outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // Add here your view model
    private var viewModel: FavouriteVM = FavouriteVM()
    private var favourites: [DishesModel] = []
    
    private let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setupRX()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.buttonRight.isHidden = true
    }
    
}
extension FavouriteVC {
    
    private func setupUI() {
        // Add here the setup for the UI
        title = "Favourite"
        self.collectionView.register(HomeCell.nib, forCellWithReuseIdentifier: HomeCell.identifier)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    private func setupRX() {
        // Add here the setup for the RX
        ManageApp.shared.$dishes.asObservable().bind { [weak self] list in
            guard let wSelf = self else { return }
            wSelf.favourites = list
            wSelf.collectionView.reloadData()
        }.disposed(by: self.disposeBag)
        
//        self.searchBar.rx.text.asObservable().bind { [weak self] text in
//            guard let wSelf = self else {
//                return
//            }
//            if let text = text, text != "" {
//                wSelf.graviesFilter = wSelf.gravies.filter { ($0.title ?? "").uppercased().contains(text.uppercased()) }
//            } else {
//                wSelf.graviesFilter = wSelf.gravies
//            }
//            wSelf.collectionView.reloadData()
//        }.disposed(by: self.disposeBag)
    }
}
extension FavouriteVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.favourites.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCell.identifier, for: indexPath) as? HomeCell else {
            fatalError("")
        }
        let item = self.favourites[indexPath.row]
        cell.lbTitle.text = item.title
        cell.img.image = item.getImage()
        return cell
    }
    
    
}
extension FavouriteVC: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return Constant.sizeCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Constant.spaceSection
    }
}

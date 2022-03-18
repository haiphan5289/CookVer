
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
import DKImagePickerController

class HomeVC: BaseNavigationViewController {
    
    struct Constant {
        static let sizeCell: CGSize = CGSize(width: 100, height: 150)
        static let spaceSection: CGFloat = 20
    }
    
    // Add here outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    // Add here your view model
    private var viewModel: HomeVM = HomeVM()
    private var listDishes: [DishesModel] = []
    private var listDishesFilter: [DishesModel] = []
    
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
            wSelf.listDishesFilter = list
            wSelf.collectionView.reloadData()
        }.disposed(by: self.disposeBag)
        
        self.searchBar.rx.text.asObservable().bind { [weak self] text in
            guard let wSelf = self else {
                return
            }
            if let text = text, text != "" {
                wSelf.listDishesFilter = wSelf.listDishes.filter { ($0.title ?? "").uppercased().contains(text.uppercased()) }
            } else {
                wSelf.listDishesFilter = wSelf.listDishes
            }
            wSelf.collectionView.reloadData()
        }.disposed(by: self.disposeBag)
    }
}
extension HomeVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listDishesFilter.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCell.identifier, for: indexPath) as? HomeCell else {
            fatalError("")
        }
        let item = self.listDishesFilter[indexPath.row]
        cell.lbTitle.text = item.title
        cell.img.image = item.getImage()
        return cell
    }
    
}
extension HomeVC: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = self.listDishesFilter[indexPath.row]
        let vc = DishesDetailVC.createVC()
        vc.model = model
        self.navigationController?.pushViewController(vc, completion: nil)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return Constant.sizeCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Constant.spaceSection
    }
}

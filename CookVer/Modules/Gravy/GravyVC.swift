
//
//  
//  GravyVC.swift
//  CookVer
//
//  Created by haiphan on 11/03/2022.
//
//
import UIKit
import RxCocoa
import RxSwift

class GravyVC: BaseNavigationViewController {
    
    struct Constant {
        static let sizeCell: CGSize = CGSize(width: 100, height: 150)
        static let spaceSection: CGFloat = 20
    }
    
    // Add here outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    // Add here your view model
    private var viewModel: GravyVM = GravyVM()
    private var gravies: [DishesModel] = []
    private var graviesFilter: [DishesModel] = []
    
    private let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setupRX()
    }
    
}
extension GravyVC {
    
    private func setupUI() {
        // Add here the setup for the UI
        title = L10n.Tabbar.gravy
        self.collectionView.register(HomeCell.nib, forCellWithReuseIdentifier: HomeCell.identifier)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    private func setupRX() {
        // Add here the setup for the RX
        Observable.combineLatest(self.viewModel.graviesEvent, ManageApp.shared.$newGravies)
            .asObservable().bind { [weak self] listJSon, listNew in
            guard let wSelf = self else { return }
            wSelf.gravies = listNew + listJSon
            wSelf.graviesFilter = listNew + listJSon
            wSelf.collectionView.reloadData()
        }.disposed(by: self.disposeBag)
        
        self.buttonRight.rx.tap.bind { [weak self] _ in
            guard let wSelf = self else { return }
            let vc = CreateDishVC.createVC()
            vc.openfrom = .gravies
            vc.hidesBottomBarWhenPushed = true
            wSelf.navigationController?.pushViewController(vc, completion: nil)
        }.disposed(by: self.disposeBag)
        
        self.searchBar.rx.text.asObservable().bind { [weak self] text in
            guard let wSelf = self else {
                return
            }
            if let text = text, text != "" {
                wSelf.graviesFilter = wSelf.gravies.filter { ($0.title ?? "").uppercased().contains(text.uppercased()) }
            } else {
                wSelf.graviesFilter = wSelf.gravies
            }
            wSelf.collectionView.reloadData()
        }.disposed(by: self.disposeBag)
    }
}
extension GravyVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.graviesFilter.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCell.identifier, for: indexPath) as? HomeCell else {
            fatalError("")
        }
        let item = self.graviesFilter[indexPath.row]
        cell.lbTitle.text = item.title
        cell.img.image = item.getImage()
        return cell
    }
    
    
}
extension GravyVC: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = self.graviesFilter[indexPath.row]
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

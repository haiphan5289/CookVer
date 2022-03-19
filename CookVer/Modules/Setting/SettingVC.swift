
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
    
    enum StatusCell: Int, CaseIterable {
        case getPremium, term, contact
        
        var text: String {
            switch self {
            case .getPremium: return "Get Premium"
            case .term: return "Term"
            case .contact: return "Contact"
            }
        }
        
        var img: UIImage? {
            switch self {
            case .getPremium: return Asset.icPremium.image
            case .term: return Asset.icPrivacy.image
            case .contact: return Asset.icContact.image
            }
        }
        
    }
    
    // Add here outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // Add here your view model
    private var viewModel: SettingVM = SettingVM()
    private var sources: [StatusCell] = StatusCell.allCases
    
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
        title = "Setting"
        if let index = sources.firstIndex(where: { $0 == .getPremium }) {
            sources.remove(at: index)
        }
        self.collectionView.register(SettingCell.nib, forCellWithReuseIdentifier: SettingCell.identifier)
        self.collectionView.delegate = self
    }
    
    private func setupRX() {
        // Add here the setup for the RX
        Observable.just(self.sources)
            .bind(to: self.collectionView.rx.items(cellIdentifier: SettingCell.identifier, cellType: SettingCell.self)) { row, data, cell in
                cell.setupValue(value: data)
            }.disposed(by: disposeBag)
        
        self.collectionView.rx.itemSelected.bind { [weak self] idx in
            guard let wSelf = self else { return }
            switch wSelf.sources[idx.row] {
            case .getPremium: break
            case .term: ManageApp.shared.openLink(link: ConstantApp.shared.linkTerm)
            case .contact: ManageApp.shared.openLink(link: ConstantApp.shared.linkFb)
            }
        }.disposed(by: disposeBag)
    }
}
extension SettingVC: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 200)
    }
}

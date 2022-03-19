
//
//  
//  CreateDishVC.swift
//  CookVer
//
//  Created by haiphan on 18/03/2022.
//
//
import UIKit
import RxCocoa
import RxSwift

class CreateDishVC: UIViewController {
    
    enum openfrom {
        case dishes, gravies
    }
    var openfrom: openfrom = .dishes
    
    // Add here outlets
    @IBOutlet weak var imgDishes: UIImageView!
    @IBOutlet weak var btSelectImage: UIButton!
    @IBOutlet weak var tfTitle: UITextField!
    @IBOutlet weak var tvResources: UITextView!
    @IBOutlet weak var tvCooking: UITextView!
    @IBOutlet weak var btAddDishes: UIButton!
    
    // Add here your view model
    private var viewModel: CreateDishVM = CreateDishVM()
    private var codes: [Int] = []
    
    private let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setupRX()
    }
    
}
extension CreateDishVC {
    
    private func setupUI() {
        // Add here the setup for the UI
        self.tvResources.text = "Input resources"
        self.tvResources.textColor = UIColor.lightGray
        
        self.tvCooking.text = "Input cooking"
        self.tvCooking.textColor = UIColor.lightGray
    }
    
    private func setupRX() {
        // Add here the setup for the RX
        self.viewModel.$totalDishes.asObservable().bind { [weak self] list in
            guard let wSelf = self else { return }
            wSelf.codes = list.map { $0.code }.compactMap { $0 }
        }.disposed(by: self.disposeBag)
        
        self.btSelectImage.rx.tap.bind { [weak self] _ in
            guard let wSelf = self else { return }
            let vc = UIImagePickerController()
            vc.sourceType = .photoLibrary
            vc.allowsEditing = true
            vc.delegate = self
            wSelf.present(vc , animated: true, completion: nil)
        }.disposed(by: self.disposeBag)
        
        self.btAddDishes.rx.tap.bind { [weak self] _ in
            guard let wSelf = self else { return }
            guard wSelf.imgDishes.image != Asset.icGalary.image,
                    let text = wSelf.tfTitle.text,
                    text != "",
                    wSelf.tvResources.textColor != UIColor.lightGray,
                    wSelf.tvCooking.textColor != UIColor.lightGray else {
                wSelf.showAlert(title: nil, message: "Please input the full fields")
                return
            }
            var newCode = Int.random(in: 0..<99999)
            while wSelf.codes.contains(newCode) {
                newCode = Int.random(in: 0..<99999)
            }
            
            var dishesModel = DishesModel(code: newCode, title: text, image: nil, resources: wSelf.tvResources.text, cooking: wSelf.tvCooking.text)
            dishesModel.dataImage = wSelf.imgDishes.image?.pngData()
            switch wSelf.openfrom {
            case .dishes: RealmManager.shared.updateOrInsertAdd(model: dishesModel)
            case .gravies: RealmManager.shared.updateOrInsertAddGravies(model: dishesModel)
            }
            
            wSelf.navigationController?.popViewController(animated: true, nil)
        }.disposed(by: self.disposeBag)
        
        self.tvResources.rx.didBeginEditing.asObservable().bind { [weak self] _ in
            guard let wSelf = self else { return }
            if wSelf.tvResources.textColor == UIColor.lightGray {
                wSelf.tvResources.text = nil
                wSelf.tvResources.textColor = UIColor.black
            }
        }.disposed(by: self.disposeBag)
        
        self.tvCooking.rx.didBeginEditing.asObservable().bind { [weak self] _ in
            guard let wSelf = self else { return }
            if wSelf.tvCooking.textColor == UIColor.lightGray {
                wSelf.tvCooking.text = nil
                wSelf.tvCooking.textColor = UIColor.black
            }
        }.disposed(by: self.disposeBag)
    }
}
extension CreateDishVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else {
            return
        }
        picker.dismiss(animated: true) {
            self.imgDishes.image = image
        }
    }
}

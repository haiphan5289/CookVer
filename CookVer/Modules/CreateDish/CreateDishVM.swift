
//
//  ___HEADERFILE___
//
import Foundation
import RxCocoa
import RxSwift

class CreateDishVM {
    
    @VariableReplay var totalDishes: [DishesModel] = []
    
    private let disposeBag = DisposeBag()
    init() {
        self.getDishes()
        self.getGravies()
    }
    
    private func getGravies() {
        ReadJson.shared.readJSONObs(offType: [DishesModel].self, name: "Gravy", type: "json").bind { [weak self] list in
            guard let wSelf = self else { return }
            wSelf.totalDishes += list
        }.disposed(by: self.disposeBag)
    }
    
    private func getDishes() {
        ReadJson.shared.readJSONObs(offType: [DishesModel].self, name: "Dishes", type: "json").bind { [weak self] list in
            guard let wSelf = self else { return }
            wSelf.totalDishes += list
        }.disposed(by: self.disposeBag)
    }
    
}

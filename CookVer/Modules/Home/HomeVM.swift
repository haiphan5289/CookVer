
//
//  ___HEADERFILE___
//
import Foundation
import RxCocoa
import RxSwift

class HomeVM {
    
    let dishesEvent: BehaviorRelay<[DishesModel]> = BehaviorRelay.init(value: [])
    
    private let disposeBag = DisposeBag()
    init() {
        self.getDishes()
    }
    
    private func getDishes() {
        ReadJson.shared.readJSONObs(offType: [DishesModel].self, name: "Dishes", type: "json").bind { [weak self] list in
            guard let wSelf = self else { return }
            wSelf.dishesEvent.accept(list)
        }.disposed(by: self.disposeBag)
    }
}

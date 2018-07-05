//
//  BaseViewModel.swift
//  EP Showcase
//
//  Created by Ernest on 15/6/18.
//  Copyright © 2018 Ernest. All rights reserved.
//

import RxSwift
import RxCocoa

class BaseViewModel<T> {
    var _items = BehaviorRelay<[T]>(value: [])
    
    var _loading = BehaviorRelay<Bool>(value: false)
    
    var _onError = BehaviorRelay<Bool>(value: false)

    var disposeBag : DisposeBag?
    
    var items: Observable<[T]> {
        return _items.asObservable()
    }
    
    var loading: Observable<Bool> {
        return _loading.asObservable()
    }

    var onError: Observable<Bool> {
        return _onError.asObservable()
    }
    
    func setDisposeBag(_ disposeBag : DisposeBag) -> Void {
        self.disposeBag = disposeBag
    }
    
    func setData(_ list: [T]) -> Void {
        _items.accept(list)
    }
    
    func setFilter(_ term: String) {
    }
    
    func loadData() -> Void {
        _loading.accept(false)
        
        getData()
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: {
                [unowned self] model in self.setData(model)
                    self._loading.accept(true)
                }, onError: {
                    [unowned self] error in print(error)
                    self._loading.accept(true)
                    self._onError.accept(true)
            })
            .disposed(by: disposeBag!)
    }
    
    func getData() -> Observable<[T]> {
        fatalError("This method must be overridden")
    }
}

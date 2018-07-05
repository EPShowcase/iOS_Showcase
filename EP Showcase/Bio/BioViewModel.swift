//
//  BioViewModel.swift
//  EP Showcase
//
//  Created by Ernest on 11/6/18.
//  Copyright © 2018 Ernest. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class BioViewModel : BaseViewModel<BioModel> {
    
    override func getData() -> Observable<[BioModel]> {
        return BioService.getBio()
    }
}

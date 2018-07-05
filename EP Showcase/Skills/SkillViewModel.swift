//
//  SkillViewModel.swift
//  EP Showcase
//
//  Created by Ernest on 11/6/18.
//  Copyright © 2018 Ernest. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SkillViewModel : BaseViewModel<SkillModel> {

    private var searchTerm = ""
    
    private var unfilteredItems = [SkillModel]()
    
    override func setData(_ list: [SkillModel]) -> Void {
        unfilteredItems = list;
        _items.accept(filter(list, searchTerm))
    }
    
    override func setFilter(_ term: String) {
        searchTerm = term.lowercased()
        setData(unfilteredItems)
    }
    
    func filter(_ list : [SkillModel], _ search : String) -> [SkillModel] {
        return list.filter {
            $0.platform.contains(search)
        }
    }

    override func getData() -> Observable<[SkillModel]> {
        return SkillService.getSkills()
    }
}


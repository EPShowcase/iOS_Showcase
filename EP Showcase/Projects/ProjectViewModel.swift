//
//  ProjectViewModel.swift
//  EP Showcase
//
//  Created by Ernest on 11/6/18.
//  Copyright © 2018 Ernest. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ProjectViewModel : BaseViewModel<ProjectModel> {
    
    private var searchTerm = ""
    
    private var unfilteredItems = [ProjectModel]()
    
    override func setData(_ list: [ProjectModel]) -> Void {
        unfilteredItems = list;
        _items.accept(filter(list, searchTerm))
    }

    override func getData() -> Observable<[ProjectModel]> {
        return ProjectService.getProjects()
    }
    
    override func setFilter(_ term: String) {
        searchTerm = term.lowercased()
        setData(unfilteredItems)
    }
    
    func filter(_ list : [ProjectModel], _ search : String) -> [ProjectModel] {
        return list.filter {
            $0.platform.contains(search)
        }
    }
}

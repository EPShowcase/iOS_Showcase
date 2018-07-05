//
//  ProjectViewController.swift
//  EP Showcase
//
//  Created by Ernest on 9/6/18.
//  Copyright © 2018 Ernest. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ProjectViewController: BaseViewController<ProjectModel> {

    @IBOutlet weak var tableView: UITableView!

    let filters : [String] = ["android","ios","web","other"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel!.setFilter(filters[0])
        
        viewModel!.items
            .bind(to: tableView.rx.items(cellIdentifier: "ProjectCell", cellType: ProjectCell.self)) { (row, element, cell) in
                cell.bindCell(model: element)
            }
            .disposed(by: disposeBag)
        
        setUpTableView(tableView)
    }
    
    override func createViewModel() -> BaseViewModel<ProjectModel> {
        return ProjectViewModel()
    }
    
    @IBAction func onFilterChanged(_ sender: UISegmentedControl) {
        viewModel!.setFilter(filters[sender.selectedSegmentIndex])
    }
}

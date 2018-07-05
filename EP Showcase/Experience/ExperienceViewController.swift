//
//  ExperienceViewController.swift
//  EP Showcase
//
//  Created by Ernest on 9/6/18.
//  Copyright © 2018 Ernest. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ExperienceViewController: BaseViewController<ExperienceModel> {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel!.items
            .bind(to: tableView.rx.items(cellIdentifier: "ExperienceCell", cellType: ExperienceCell.self)) { (row, element, cell) in
                cell.bindCell(model: element)
            }
            .disposed(by: disposeBag)

        setUpTableView(tableView)
    }
    
    override func createViewModel() -> BaseViewModel<ExperienceModel> {
        return ExperienceViewModel()
    }
}

//
//  BioViewController.swift
//  EP Showcase
//
//  Created by Ernest on 9/6/18.
//  Copyright © 2018 Ernest. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class BioViewController : BaseViewController<BioModel> {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel!.items
            .bind(to: tableView.rx.items(cellIdentifier: "BioCell", cellType: BioCell.self)) { (row, element, cell) in
                cell.bindCell(model: element)
                cell.controller = self
            }
            .disposed(by: disposeBag)
        
        setUpTableView(tableView)
    }
    
    override func createViewModel() -> BaseViewModel<BioModel> {
        return BioViewModel()
    }
}

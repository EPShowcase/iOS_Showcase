//
//  BaseViewController.swift
//  EP Showcase
//
//  Created by Ernest on 15/6/18.
//  Copyright © 2018 Ernest. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class BaseViewController<T> : UIViewController, Retryable {
    
    var viewModel : BaseViewModel<T>?
    var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = createViewModel()
        viewModel!.setDisposeBag(disposeBag)
    }
    
    func createViewModel() -> BaseViewModel<T> {
        fatalError("This method must be overridden")
    }
    
    func showErrorView() -> Void {
        let storyboard = UIStoryboard(name: "ErrorView", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "ErrorView")
        addChildViewController(controller)
        view.addSubview(controller.view)
        controller.didMove(toParentViewController: self)
    }

    func setUpTableView(_ tableView : UITableView) {
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
        tableView.allowsSelectionDuringEditing = false;
        tableView.allowsSelection = false;
        
        setupPullToRefresh(tableView)

        viewModel!.onError
            .subscribe({
                [unowned self] error in
                if error.element! {
                    self.showErrorView()
                }
            })
            .disposed(by: disposeBag)
        
        viewModel!.loadData()
    }
    
    fileprivate func setupPullToRefresh(_ tableView : UITableView) {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
        
        viewModel!.loading.subscribe({
            value in refreshControl.endRefreshing()
        }).disposed(by: disposeBag)
        
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.backgroundView = refreshControl
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
            if let scrollView = refreshControl.superview as? UIScrollView {
                scrollView.setContentOffset(CGPoint(x: 0, y: scrollView.contentOffset.y - refreshControl.frame.height), animated: true)
            }
            refreshControl.beginRefreshing()
        }
    }
    
    @objc func refresh(_ refreshControl: UIRefreshControl) {
        viewModel!.loadData()
    }
    
    func retry() {
        viewModel!.loadData()
    }
}

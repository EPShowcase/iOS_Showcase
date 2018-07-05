//
//  ErrorViewController.swift
//  EP Showcase
//
//  Created by Ernest on 15/6/18.
//  Copyright © 2018 Ernest. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

protocol Retryable {
    func retry() -> Void;
}

class ErrorViewController: UIViewController {
    
    @IBAction func onRetry(_ sender: UIButton) {
        let parent = self.parent as! Retryable
        parent.retry()
        //dismiss(animated: true, completion: nil)
        view.removeFromSuperview()
    }
}

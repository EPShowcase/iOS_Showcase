//
//  MainTabViewController.swift
//  EP Showcase
//
//  Created by Ernest on 8/6/18.
//  Copyright © 2018 Ernest. All rights reserved.
//

import UIKit
import SideMenu

class MainTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let storyboard = UIStoryboard.init(name: "SideMenu", bundle: nil)
        let menuLeftNavigationController = storyboard.instantiateViewController(withIdentifier: "SideMenuNavigationController") as! UISideMenuNavigationController
        SideMenuManager.default.menuLeftNavigationController = menuLeftNavigationController
        SideMenuManager.default.menuAddPanGestureToPresent(toView: self.navigationController!.navigationBar)
        SideMenuManager.default.menuAddScreenEdgePanGesturesToPresent(toView: self.navigationController!.view)
    }
}

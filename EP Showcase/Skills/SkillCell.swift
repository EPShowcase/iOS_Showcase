//
//  SkillTableViewCell.swift
//  EP Showcase
//
//  Created by Ernest on 10/6/18.
//  Copyright © 2018 Ernest. All rights reserved.
//

import UIKit
import AlamofireImage

class SkillCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var descriptionLbl: UILabel!
    
    func bindCell(model: SkillModel) -> Void {        
        titleLbl.text = model.title
        descriptionLbl.text = model.description
    }
}

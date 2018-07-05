//
//  ExperienceTableViewCell.swift
//  EP Showcase
//
//  Created by Ernest on 10/6/18.
//  Copyright © 2018 Ernest. All rights reserved.
//

import UIKit
import AlamofireImage

class ExperienceCell: UITableViewCell {

    @IBOutlet weak var companyLbl: UILabel!
    
    @IBOutlet weak var jobLbl: UILabel!
    
    @IBOutlet weak var datesLbl: UILabel!
    
    @IBOutlet weak var descriptionLbl: UILabel!
    
    func bindCell(model: ExperienceModel) -> Void {
        companyLbl.text = model.company
        jobLbl.text = model.job
        datesLbl.text = getDates(model)
        descriptionLbl.text = model.jobDescription
    }
    
    func getDates(_ model: ExperienceModel) -> String {
        let toMonthYear = DateFormatter()
        toMonthYear.dateFormat = "MMM yyyy"
        
        let startDate = model.startDate.asMongoDate()
        let startText = toMonthYear.string(from: startDate!)

        let endDate = model.endDate.asMongoDate()
        let endText = toMonthYear.string(from: endDate!)

        return "\(startText) - \(endText)"
    }
}

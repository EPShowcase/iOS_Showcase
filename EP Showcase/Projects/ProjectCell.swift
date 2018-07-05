//
//  ProjectTableViewCell.swift
//  EP Showcase
//
//  Created by Ernest on 10/6/18.
//  Copyright © 2018 Ernest. All rights reserved.
//

import UIKit
import AlamofireImage

class ProjectCell: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var descriptionLbl: UILabel!
    
    @IBOutlet weak var datesLbl: UILabel!
    
    func bindCell(model: ProjectModel) -> Void {
        nameLbl.text = model.name
        descriptionLbl.text = model.description
        datesLbl.text = getDates(model)
    }

    func getDates(_ model: ProjectModel) -> String {
        let toMonthYear = DateFormatter()
        toMonthYear.dateFormat = "MMM yyyy"
        
        let startDate = model.startDate.asMongoDate()
        let startText = toMonthYear.string(from: startDate!)
        
        let endDate = model.endDate.asMongoDate()
        let endText = toMonthYear.string(from: endDate!)
        
        let period = getPeriod(startDate!, endDate!)
        
        return "\(startText) - \(endText) \(period)"
    }
    
    func getPeriod(_ start: Date, _ end: Date) -> String {
        let components = Calendar.current.dateComponents([.year, .month], from: start, to: end)

        let years = components.year ?? 0
        let months = components.month ?? 0
        
        var result = ""
        
        if years > 0 {
            result = "\(years) " + "years".localized()
        }

        if months > 0 {
            result += result.count > 0 ? " \(months) " : "\(months) "
            result += "months".localized()
        }

        return result.count > 0 ? "• " + result : ""
    }
}

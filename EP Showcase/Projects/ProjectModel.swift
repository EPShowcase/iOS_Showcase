//
//  ProjectModel.swift
//  EP Showcase
//
//  Created by Ernest on 11/6/18.
//  Copyright © 2018 Ernest. All rights reserved.
//

import UIKit

struct ProjectModel: Decodable {
    let name: String
    let startDate: String
    let endDate: String
    let description: String
    let platform: String
    let link: String
}

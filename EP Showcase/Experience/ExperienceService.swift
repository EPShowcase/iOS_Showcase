//
//  ExperienceService.swift
//  EP Showcase
//
//  Created by Ernest on 11/6/18.
//  Copyright © 2018 Ernest. All rights reserved.
//

import RxAlamofire
import RxSwift
import Alamofire

class ExperienceService : BaseService {
    
    static func getExperience() -> Observable<[ExperienceModel]> {
        let stringURL = baseUrl() + "/api/experience"
        let manager = SessionManager.default

        return manager.rx.request(.get, stringURL)
            .validate(statusCode: 200 ..< 300)
            .validate(contentType: ["application/json"])
            .responseJSON()
            .map(mapArray)
    }
}

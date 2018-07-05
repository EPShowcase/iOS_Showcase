//
//  SkillService.swift
//  EP Showcase
//
//  Created by Ernest on 11/6/18.
//  Copyright © 2018 Ernest. All rights reserved.
//

import RxAlamofire
import RxSwift
import Alamofire

class SkillService : BaseService {
    
    static func getSkills() -> Observable<[SkillModel]> {
        let stringURL = baseUrl() + "/api/skills"
        let manager = SessionManager.default

        return manager.rx.request(.get, stringURL)
            .validate(statusCode: 200 ..< 300)
            .validate(contentType: ["application/json"])
            .responseJSON()
            .map(mapArray)
    }
}

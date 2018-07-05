//
//  BioService.swift
//  EP Showcase
//
//  Created by Ernest on 11/6/18.
//  Copyright © 2018 Ernest. All rights reserved.
//

import RxAlamofire
import RxSwift
import Alamofire

class ProjectService : BaseService {
    
    static func getProjects() -> Observable<[ProjectModel]> {
        let stringURL = baseUrl() + "/api/projects"
        let manager = SessionManager.default

        return manager.rx.request(.get, stringURL)
            .validate(statusCode: 200 ..< 300)
            .validate(contentType: ["application/json"])
            .responseJSON()
            .map(mapArray)
    }
}

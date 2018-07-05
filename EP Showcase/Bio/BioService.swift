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

class BioService : BaseService {
    
    static func getBio() -> Observable<[BioModel]> {
        let stringURL = baseUrl() + "/api/bio?filter=%7B%22id%22%3A%225b20b57eda7b02555220d408%22%7D"
        let manager = SessionManager.default

        return manager.rx.request(.get, stringURL)
            .validate(statusCode: 200 ..< 300)
            .validate(contentType: ["application/json"])
            .responseJSON()
            .map(mapArray)
    }
}

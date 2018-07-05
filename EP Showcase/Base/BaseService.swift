//
//  BaseService.swift
//  EP Showcase
//
//  Created by Ernest on 13/6/18.
//  Copyright © 2018 Ernest. All rights reserved.
//

import Alamofire
import RxAlamofire

class BaseService {

    static func mapObject<T : Decodable>(result: Alamofire.DataResponse<Any>) throws -> T {
        guard let model = try? JSONDecoder().decode(T.self, from: result.data!) else {
            print("Error: Couldn't decode data")
            throw JsonError.invalidJson
        }
        
        return model
    }

    
    static func mapArray<T : Decodable>(result: Alamofire.DataResponse<Any>) throws -> [T] {
        guard let model = try? JSONDecoder().decode([T].self, from: result.data!) else {
            print("Error: Couldn't decode data")
            throw JsonError.invalidJson
        }
        
        return model
    }
    
    static func baseUrl() -> String {
        return "http://cv-api.megahard.info:3001";
        //return "http://192.168.1.7:3000";
    }
}

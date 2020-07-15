//
//  ApiRequest.swift
//  LentaApp
//
//  Created by Sultangazy Bukharbay on 7/15/20.
//  Copyright © 2020 Sultangazy Bukharbay. All rights reserved.
//

import Foundation
import Alamofire

protocol ApiRequestDelegate {
    func getBooks(forURL url: String, onComplete completionHandler: @escaping([Book]?, ApiFailure?) -> Void)
}
    
class ApiRequest: ApiRequestDelegate {
    func getBooks(forURL url: String, onComplete completionHandler: @escaping ([Book]?, ApiFailure?) -> Void) {
        AF.request(url, method: .get).response { (response) in
            if response.response?.statusCode == 200 {
                guard let data = response.data else { return }
                do {
                    let item = try data.fromJsonData(to: [Book].self)
                    completionHandler(item, nil)
                } catch {
                    let error = ApiFailure(statusCode: .other)
                    completionHandler(nil, error)
                }
            } else {
                if let statusCode = response.response?.statusCode,
                    let sc = StatusCode(rawValue: (statusCode)) {
                    let error = ApiFailure(statusCode: sc)
                    completionHandler(nil, error)
                } else {
                    let error = ApiFailure(statusCode: .reachability)
                    completionHandler(nil, error)
                }
            }
        }
    }
}

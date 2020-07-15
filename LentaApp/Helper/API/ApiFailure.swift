//
//  ApiFailure.swift
//  LentaApp
//
//  Created by Sultangazy Bukharbay on 7/15/20.
//  Copyright © 2020 Sultangazy Bukharbay. All rights reserved.
//

import Foundation

enum StatusCode: Int {
    case success = 200
    case reachability = 0
    case other
}

struct ApiFailure {
    
    var errorDescription: String?
    var customMessage: String?
    var statusCode: StatusCode?
    
    init(statusCode code: StatusCode) {
        self.statusCode = code
        
        switch code {
        case .reachability:
            customMessage = "Internet is not working. Check your connection"
            errorDescription = "Internet is not working. Check your connection"
        default:
            customMessage = "Something went wrong while parsing JSON"
            errorDescription = "Something went wrong while parsing JSON"
        }
    }
}

//
//  DataExtension.swift
//  LentaApp
//
//  Created by Sultangazy Bukharbay on 7/15/20.
//  Copyright © 2020 Sultangazy Bukharbay. All rights reserved.
//

import Foundation

extension Data {
    func fromJsonData<T : Decodable>(to type: T.Type) throws -> T {
        return try JSONDecoder().decode(T.self, from: self)
    }
}

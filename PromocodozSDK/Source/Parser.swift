//
//  Parser.swift
//  PromocodozSDK
//
//  Created by Андрей Чернопрудов on 27/01/2017.
//  Copyright © 2017 Promocodoz. All rights reserved.
//

import Foundation

struct Parser {
    
    static func decodeResult(fromData dataOrNil: Data?) throws -> String {
        guard let data = dataOrNil else {
            throw PromocodozError.descripted(message: "No data")
        }
        if let result = String(data: data, encoding: .utf8) {
            return result
        }
        throw PromocodozError.descripted(message: "No data")
    }
    
    static func decodeError(fromData dataOrNil: Data?) -> Error {
        guard let data = dataOrNil else {
            return PromocodozError.descripted(message: "No data")
        }
        do {
            guard let jsonObject = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any],
                let msg = jsonObject["Message"] as? String else
            {
                return PromocodozError.unknown
            }
            return PromocodozError.serverError(message: msg)
        } catch  {
            return error
        }
    }
}

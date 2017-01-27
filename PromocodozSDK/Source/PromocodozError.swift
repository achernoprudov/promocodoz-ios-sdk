//
//  PromocodozError.swift
//  PromocodozSDK
//
//  Created by Андрей Чернопрудов on 27/01/2017.
//  Copyright © 2017 Promocodoz. All rights reserved.
//

enum PromocodozError: LocalizedError {
    
    case serverError(message: String)
    case descripted(message: String)
    case unknown
    
    var failureReason: String? {
        switch self {
        case .descripted(message: let message):
            return message
        case .unknown:
            return "Unknown error"
        case .serverError(message: let message):
            return message
        }
    }
}

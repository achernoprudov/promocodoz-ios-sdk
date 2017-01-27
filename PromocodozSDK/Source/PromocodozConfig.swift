//
//  PromocodozConfig.swift
//  PromocodozSDK
//
//  Created by Андрей Чернопрудов on 27/01/2017.
//  Copyright © 2017 Promocodoz. All rights reserved.
//

/// Config for Promocodoz module
public struct PromocodozConfig {
    
    static var `default` = PromocodozConfig(accountSid: "default", secretToken: "default")
    
    /// Account identifier
    let accountSid: String
    
    /// Account secret token
    let secretToken: String
    
    /// Promocodoz platform
    let platform: String = "iOS"

}

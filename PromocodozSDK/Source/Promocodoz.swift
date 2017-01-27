//
//  Promocodoz.swift
//  PromocodozSDK
//
//  Created by Андрей Чернопрудов on 27/01/2017.
//  Copyright © 2017 Promocodoz. All rights reserved.
//

/// Base instance of Promocodoz module
public class Promocodoz {
    
    // MARK: - Aliases
    
    public typealias Handler = ((_ result: String?, _ error: Error?) -> Void)
    
    // MARK: - Static
    
    public static let instance = Promocodoz()
    
    // MARK: - Instance variables

    public var config: PromocodozConfig = .default
    
    // MARK: - Public
    
    /// Reserver promocode on promocodoz server
    ///
    /// - Parameters:
    ///   - promocode: promocode to reserver
    ///   - handler:
    public func reserve(promocode: String, withHandler handler: @escaping Handler) {
        let request = ReservePromocodeRequest(withConfig: config)
        request.execute(withPromocode: promocode, withHandler: handler)
    }
}

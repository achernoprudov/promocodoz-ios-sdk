//
//  ReservePromocodeRequest.swift
//  PromocodozSDK
//
//  Created by Андрей Чернопрудов on 27/01/2017.
//  Copyright © 2017 Promocodoz. All rights reserved.
//

import Foundation

struct ReservePromocodeRequest {
    
    typealias Handler = Promocodoz.Handler
    
    // MARK: - Instance varialbes
    
    let restMethod = "api/code"
    
    var config: PromocodozConfig
    
    // MARK: - Public
    
    init(withConfig config: PromocodozConfig) {
        self.config = config
    }
    
    func execute(withPromocode promocode: String, withHandler handler: @escaping Handler) {
        DispatchQueue.global(qos: .background).async {
            var request = self.buildRequest()
            do {
                let body = try self.buildBody(withPromocode: promocode)
                request.httpBody = body
            } catch {
                handler(nil, error)
                return
            }
            let session = URLSession.shared
            let task = session.dataTask(with: request, completionHandler: { (data, response, error) in
                if let error = error {
                    handler(nil, error)
                    return
                }
                guard let response = response as? HTTPURLResponse else {
                    let error = PromocodozError.descripted(message: "Could not cast response to HTTP response")
                    handler(nil, error)
                    return
                }
                guard response.statusCode == 200 else {
                    let error = Parser.decodeError(fromData: data)
                    handler(nil, error)
                    return
                }
                do {
                    let result = try Parser.decodeResult(fromData: data)
                    handler(result, nil)
                } catch {
                    handler(nil, error)
                }
            })
            task.resume()
        }
        
    }
    
    // MARK: - Private
    
    private func buildRequest() -> URLRequest {
        let urlString = Constants.hostUrl + restMethod
        let url = URL(string: urlString)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
    
    private func buildBody(withPromocode promocode: String) throws -> Data {
        let body = [
            "sid" : config.accountSid,
            "secret" : config.secretToken,
            "platform" : config.platform,
            "code" : promocode
        ]
        
        return try JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
    }
}

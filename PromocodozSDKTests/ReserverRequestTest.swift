//
//  ReserverRequestTest.swift
//  PromocodozSDK
//
//  Created by Андрей Чернопрудов on 27/01/2017.
//  Copyright © 2017 Promocodoz. All rights reserved.
//

import XCTest
@testable import PromocodozSDK

class ReserverRequestTest: XCTestCase {
    
    typealias Request = ReservePromocodeRequest
    
    let config: PromocodozConfig = .default

    func test_fail_readable() {
        
        let asyncExpectation = expectation(description: "get promocode")
        
        let request = Request(withConfig: config)
        request.execute(withPromocode: "promocode") { (result, error) in
            
            
            asyncExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 1) { error in
            print("Expectation error")
        }
        
    }
}

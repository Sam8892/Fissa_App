//
//  ApiSettings.swift
//  Fissa_App
//
//  Created by Stage2021 on 11/03/2021.
//  Copyright © 2021 Stage2021. All rights reserved.
//

import Foundation
enum ApiSettings {}

extension ApiSettings {
    static func encode<T>(_ value: T?) throws -> Data? where T : Codable {
        guard let object = value else {
            debugPrint("can't encode")
            return nil }
        do {
            let jsonEncoder = JSONEncoder()
            return try jsonEncoder.encode(object.self)
            
        } catch let error {
            debugPrint("can't encode", error)
            return nil
        }
    }
    
    
}

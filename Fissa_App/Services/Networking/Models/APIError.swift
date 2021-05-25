//
//  APIError.swift
//  Fissa_App
//
//  Created by Stage2021 on 04/05/2021.
//  Copyright © 2021 Stage2021. All rights reserved.
//

public enum APIError: Error {
    case parsingFailed
    case notConnectedToInternet
    case timedOut
    case emptyData
}

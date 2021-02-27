//
//  NetworkError.swift
//  TecnicalTest
//
//  Created by Julian David Urrutia Montilla on 26/02/21.
//

import Foundation

enum NetworkError: String, Error {
    case parsingData = "Failed to fetch the data :("
    case responseUnsuccessfull = "Something went wrong with the server.  Try later."
    case genericError = "Ups.  Something went wrong:(.  Try later."
}

//
//  ImageBreed.swift
//  TecnicalTest
//
//  Created by Julian David Urrutia Montilla on 27/02/21.
//

import Foundation

struct Image: Codable {
    var id: String?
    var url: String?
    
    private enum CodingKeys: CodingKey {
        case id
        case url
    }
    
    init(id: String, url: String) {
        self.id = id
        self.url = url
    }
}

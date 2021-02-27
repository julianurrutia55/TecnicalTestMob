//
//  BreedRepositoryMocks.swift
//  TecnicalTest
//
//  Created by Julian David Urrutia Montilla on 26/02/21.
//

import Foundation

class BreedRepositoryMocks: BreedRemoteRepositoryProtocol {
    
    let breeds: [Breed] = [
        Breed(arlternativeName: "", id: "prueba", name: "prueba name", description: "prueba desc", origin: "prueba casita", temperament: "prueba2", wikipediaURL: "https://google.com"),
        Breed(arlternativeName: "", id: "prueba", name: "prueba", description: "prueba", origin: "prueba", temperament: "prueba3", wikipediaURL: ""),
        Breed(arlternativeName: "", id: "prueba4", name: "prueba", description: "prueba", origin: "prueba", temperament: "prueba", wikipediaURL: "https://google.com"),
    ]
    
    func getBreedList(completion: @escaping (Result<[Breed], NetworkError>) -> Void) {
        completion(.success(breeds))
    }
}

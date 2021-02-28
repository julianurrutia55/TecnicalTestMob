//
//  BreedRepositoryMocks.swift
//  TecnicalTest
//
//  Created by Julian David Urrutia Montilla on 26/02/21.
//

import Foundation

class BreedRepositoryMocks: BreedRemoteRepositoryProtocol {
    
    let breeds: [Breed] = [
        Breed(arlternativeName: "", id: "prueba", name: "prueba name", description: "prueba desc", origin: "prueba casita", temperament: "prueba2", wikipediaUrl: "https://google.com", image: Image(id: "0XYvRd7oD", url: "https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg")),
        Breed(arlternativeName: "", id: "prueba", name: "prueba", description: "prueba", origin: "prueba", temperament: "prueba3", wikipediaUrl: "", image: Image(id: "ozEvzdVM-", url: "https://cdn2.thecatapi.com/images/ozEvzdVM-.jpg")),
        Breed(arlternativeName: "", id: "prueba4", name: "prueba", description: "prueba", origin: "prueba", temperament: "prueba", wikipediaUrl: "https://google.com",image: Image(id: "hBXicehMA", url: "https://cdn2.thecatapi.com/images/hBXicehMA.jpg")),
    ]
    
    func getBreedList(completion: @escaping (Result<[Breed], NetworkError>) -> Void) {
        completion(.success(breeds))
    }
}

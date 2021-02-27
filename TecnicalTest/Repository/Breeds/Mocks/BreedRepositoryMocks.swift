//
//  BreedRepositoryMocks.swift
//  TecnicalTest
//
//  Created by Julian David Urrutia Montilla on 26/02/21.
//

import Foundation

class BreedRepositoryMocks: BreedRemoteRepositoryProtocol {
    
    let breeds: [Breed] = [
        Breed(arlternativeName: "", id: "AngXmatadora", name: "Angora", description: "La mejor", origin: "Mi casita", temperament: "Suave", wikipediaURL: "https://google.com"),
        Breed(arlternativeName: "", id: "lamp1n10", name: "Lampiño", description: "El peor", origin: "Egipto maybe", temperament: "Se ve bravo", wikipediaURL: "https://google.com"),
        Breed(arlternativeName: "", id: "cr10ll1t0", name: "Criollito", description: "Si compras animales, te denuncio", origin: "Abandono T_T", temperament: "Hermosos, ADOPTE!", wikipediaURL: "https://google.com"),
    ]
    
    func getBreedList(completion: @escaping (Result<[Breed], NetworkError>) -> Void) {
        completion(.success(breeds))
    }
}

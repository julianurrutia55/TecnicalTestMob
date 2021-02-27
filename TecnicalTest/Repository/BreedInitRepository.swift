//
//  BreedInitRepository.swift
//  TecnicalTest
//
//  Created by Julian David Urrutia Montilla on 26/02/21.
//

import Foundation

class BreedInitRepository {
    
    var breedRepositoryProtocol: BreedRemoteRepositoryProtocol
    
    init(_ breedRepositoryProtocol: BreedRemoteRepositoryProtocol) {
        self.breedRepositoryProtocol = breedRepositoryProtocol
    }
    
    func getBreedList(completion: @escaping (Result<[Breed], NetworkError>) -> Void) {
        breedRepositoryProtocol.getBreedList(completion: completion)
    }
}

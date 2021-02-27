//
//  BreedRepository.swift
//  TecnicalTest
//
//  Created by Julian David Urrutia Montilla on 26/02/21.
//

import Foundation

class BreedRemoteRepository : BaseRepositoryRemote, BreedRemoteRepositoryProtocol {
    func getBreedList(completion: @escaping (Result<[Breed], NetworkError>) -> Void) {
        let endPoint = Constantes.fetchListOfBreeds
        
        sendRequest(endPoint, of: [Breed].self) { result in
            switch result {
            case .success(let breeds):
                completion(.success(breeds))
                break
            case.failure(let error):
                completion(.failure(error))
                break
            }
        }
    }
    
    
}

//
//  BreedRepositoryProtocol.swift
//  TecnicalTest
//
//  Created by Julian David Urrutia Montilla on 26/02/21.
//

import Foundation

protocol BreedRemoteRepositoryProtocol {
    func getBreedList(completion: @escaping (Result<[Breed], NetworkError>) -> Void)
}

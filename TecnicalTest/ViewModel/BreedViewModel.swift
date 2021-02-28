//
//  BreedViewModel.swift
//  TecnicalTest
//
//  Created by Julian David Urrutia Montilla on 26/02/21.
//

import Foundation

protocol BreedsViewModelDelegate: class {
    func reloadData()
    func error()
}

class BreedViewModel {
    
    private var repositoryInit: BreedInitRepository
    weak var delegate: BreedsViewModelDelegate?
    
    var breeds:[Breed] = []
    var error: NetworkError?
    
    init(repositoryInit: BreedInitRepository) {
        self.repositoryInit = repositoryInit
    }
    
    func getDataListBreed(){
        repositoryInit.getBreedList {[weak self] result in
            guard let resultData = self else { return }
            switch result {
                case .success(let breeds):
                    resultData.breeds = breeds
                    resultData.delegate?.reloadData()
                break
            case .failure(let error):
                resultData.error = error
                resultData.delegate?.error()
            }
            
            
        }
    }
}

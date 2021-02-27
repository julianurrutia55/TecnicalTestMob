//
//  BreedViewModel.swift
//  TecnicalTest
//
//  Created by Julian David Urrutia Montilla on 26/02/21.
//

import Foundation

class BreedViewModel {
    
    private var repositoryInit: BreedInitRepository
    
    private var breads:[Breed] = []
    
    init(repositoryInit: BreedInitRepository) {
        self.repositoryInit = repositoryInit
    }
    
    func getDataListBreed(){
        repositoryInit.getBreedList {[weak self] result in
            switch result {
                case .success(let breeds):
                    print(breeds)
                break
            case .failure(let error):
                print(error)
            }
            
            
        }
    }
}

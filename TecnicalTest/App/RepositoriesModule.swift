//
//  RepositoriesModule.swift
//  TecnicalTest
//
//  Created by Julian David Urrutia Montilla on 26/02/21.
//

import Foundation
import Swinject

class RepositoriesModule{
    
    let container: Container
    
    init() {
        self.container = Container()
        registerDependencies()
    }
    
    private func registerDependencies() {
        #if MOCKS
        container.register(BreedRemoteRepositoryProtocol.self) { _ in
            BreedRepositoryMocks()
        }
        #else
        container.register(BreedRemoteRepositoryProtocol.self) { _ in
            BreedRemoteRepository()
        }
        #endif
        
        //init repository
        container.register(BreedInitRepository.self) { r in
            BreedInitRepository(r.resolve(BreedRemoteRepositoryProtocol.self)!)
        }
        
        //view model
        container.register(BreedViewModel.self) { r in
            BreedViewModel(repositoryInit: r.resolve(BreedInitRepository.self)!)
        }
        
        //view
        container.register(BreedViewController.self) { r in
            BreedViewController(breedViewModel: r.resolve(BreedViewModel.self)!)
        }
    }
    
}

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
    }
    
    private func registerDependencies() {
        //Repositories
        #if MOCKS
       
        #else
        #endif
    }
    
}

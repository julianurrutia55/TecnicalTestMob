//
//  TecnicalTestTests.swift
//  TecnicalTestTests
//
//  Created by Julian David Urrutia Montilla on 26/02/21.
//

import XCTest
@testable import TecnicalTest

class TecnicalTestTests: XCTestCase {

    var breedInitRepository: BreedInitRepository!
    let dependencyInjector = RepositoriesModule()
    
    override func setUp() {
        breedInitRepository = BreedInitRepository(dependencyInjector.container.resolve(BreedRemoteRepositoryProtocol.self)!)
    }
    
    func testGetListOfBreedsSuccessResponse() {
        //Arrange
        breedInitRepository.getBreedList { result in
            switch result {
            case .success(let breeds):
                XCTAssertNotNil(breeds)
            case .failure(_):
                break
            }
        }
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


}

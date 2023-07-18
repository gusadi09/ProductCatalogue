//
//  ProductRepositoryTests.swift
//  ProductCatalogueTests
//
//  Created by Gus Adi on 18/07/23.
//

import XCTest
@testable import ProductCatalogue

final class ProductRepositoryTests: XCTestCase {
    private let sut = RepositoryStubHelper(isErrorRemote: false)
    private let errorSut = RepositoryStubHelper(isErrorRemote: true)
    
    func test_getProduct_success() async {
        let expectation = XCTestExpectation(description: "getProducts")
        
        do {
            let result = try await sut.getAllRemoteProducts()
            
            XCTAssertTrue(!result.isEmpty)
            expectation.fulfill()
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    func test_getProduct_failed() async {
        let expectation = XCTestExpectation(description: "getProductsFail")
        
        do {
            let result = try await errorSut.getAllRemoteProducts()
            
            
            XCTFail("False result")
            
        } catch {
            XCTAssertTrue(!error.localizedDescription.isEmpty)
            expectation.fulfill()
        }
    }
    
    func test_saveToLocal_withLoadLocalStorage_inMemmory() throws {
        let expectation = XCTestExpectation(description: "saveToLocal")
        
        try sut.saveProductToLocal(item: ProductResponse.sample)
        
        let data = try sut.loadLocalproducts()
        
        XCTAssertTrue(!data.isEmpty)
        
        expectation.fulfill()
    }
    
    func test_deleteLocal_withLoadLocalStorage_inMemmory() throws {
        let expectation = XCTestExpectation(description: "deleteLocal")
        
        try sut.deleteLocalProduct(item: ProductResponse.sample)
        
        let data = try sut.loadLocalproducts()
        
        XCTAssertTrue(data.isEmpty)
        
        expectation.fulfill()
    }
}

//
//  NYTBestsellersTests.swift
//  NYTBestsellersTests
//
//  Created by J on 1/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import XCTest
@testable import NYTBestsellers
// TODO: Write test for books image
// TODO: Write test for number of category books
// TODO: Books persistence manager 
class NYTBestsellersTests: XCTestCase {
  
  override func setUp() {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    let sessionManager = SessionManager()
    sessionManager.saveKey(value: 1, key: "one")
    sessionManager.saveKey(value: 4, key: "four")
    sessionManager.saveKey(value: "One", key: "OneString")
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    let sessionManager = SessionManager()
    sessionManager.deleteKey(key: "one")
    sessionManager.deleteKey(key: "four")
    sessionManager.deleteKey(key: "OneString")
  }
  
  func testNYTAPIClient() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    let exp = expectation(description: "Received books data")
    NYTAPIClient.getBestSellers() { (error, books) in
      if let error = error {
        XCTFail("failed with error: \(error.errorMessage())")
      } else if let books = books {
        XCTAssert(books.count > 0)
      }
      exp.fulfill()
    }
    wait(for: [exp], timeout: 3.0)
    
  }
  
  func testGoogleBooksAPIClient() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    let exp = expectation(description: "Received books image")
    GoogleBooksAPIClient.getImageData(isbn13:"9781455567102"){ (error, bookData) in
      if let error = error {
        XCTFail("failed with error: \(error.errorMessage())")
      } else if let bookData = bookData {
        XCTAssertNotNil(bookData)
      }
      exp.fulfill()
    }
    wait(for: [exp], timeout: 3.0)
  }
  
  func testSessionManagerInsert(){
    let sessionManager = SessionManager()
    sessionManager.saveKey(value: 1, key: "first")
    XCTAssertEqual(1, try? sessionManager.getKey(keyType: 3, key: "first"))
  }
  
  
  func testPerformanceExample() {
    // This is an example of a performance test case.
    self.measure {
      // Put the code you want to measure the time of here.
    }
  }
  
}

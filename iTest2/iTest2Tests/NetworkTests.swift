//
//  NetworkTests.swift
//  iTest2Tests
//
//  Created by Tatiana Cooper on 29/01/2022.
//

import XCTest

class NetworkTests: XCTestCase {
    
    let networkManager = NetworkManager()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

   
    
    func testDownloadWebData() throws {
        
        // Create an expectation for a background download task.
        let expectation = XCTestExpectation(description: "Download photos metadata")
        
        // Create a URL for a web page to be downloaded.
        let url = URL(string: METADATA_URL_STR)!
        
        // Create a background task to download the web page.
        let dataTask = URLSession.shared.dataTask(with: url) { (data, _, _) in
            
            // Make sure we downloaded some data.
            XCTAssertNotNil(data, "No data was downloaded.")
            
            // Fulfill the expectation to indicate that the background task has finished successfully.
            expectation.fulfill()
            
        }
        
        // Start the download task.
        dataTask.resume()
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    
    
   
  

}

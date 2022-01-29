//
//  PhotosModelTests.swift
//  iTest2Tests
//
//  Created by Tatiana Cooper on 29/01/2022.
//

import XCTest

class PhotosModelTestsWithHardcodedData: XCTestCase {
    
    var photosModel : PhotosModel!
    var arr : Array<Any>!
    

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        photosModel = PhotosModel()
        arr = self.dataToArr()
    }

   
    func testPerformanceParsePhotos() throws {
        self.measure {
            photosModel.parsePhotos(arr: arr)
        }
    }
    
    
   
    func testMemoryUse() throws {
        self.measure(metrics: [XCTMemoryMetric()]) {
            photosModel.parsePhotos(arr: arr)
        }
    }
    
    
    
    func testCPUUse () throws {
        self.measure(metrics: [ XCTCPUMetric()]) {
            photosModel.parsePhotos(arr: arr)
        }
       
    }
    
    func testDataToArr () throws {
        XCTAssertEqual(arr.count, 11)
    }
    
    
    //returns right demo data readen from data.txt file
    func dataToArr () -> Array<Any> {
        do {
            let testBundle = Bundle(for: type(of: self))
            let url = testBundle.url(forResource: "data", withExtension: "txt")
            XCTAssertNotNil(url, "Can't file data.tx file")
            let data = try Data(contentsOf: url!)
            XCTAssertNotNil(data, "Can't read data from file")
            let responseDictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String:AnyObject]
            XCTAssertNotNil(responseDictionary, "Can't build json from file")
            let results = responseDictionary![ WebFields.results.rawValue ] as? Array<Any>
            XCTAssertNotNil(results, "No results entry in json object")
            return results!
        }
        catch {
            XCTFail("Can't read data.txt file")
        }
        XCTFail("Can't create photos array from data.txt file ")
        return Array<Any>()
    }
  
    

}

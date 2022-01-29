//
//  PhotosModelAdditionalTests.swift
//  iTest2Tests
//
//  Created by Tatiana Cooper on 29/01/2022.
//

import XCTest

class PhotosModelAdditionalTests: XCTestCase {
    
    let photosModel = PhotosModel()

    
    func testForParsingWrongTypePhotosArray() throws {
        let arr = [3 , 4 , 5 , 6]
        photosModel.parsePhotos(arr: arr)
        XCTAssert(photosModel.photos.count == 0 , "Wrong photos parsing for Int photos array")
    }


}

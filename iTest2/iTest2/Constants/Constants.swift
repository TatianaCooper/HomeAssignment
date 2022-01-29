//
//  Constants.swift
//  iTest
//
//  Created by Tatiana Cooper on 27/01/2022.
//

import Foundation

enum WebFields : String {
    case results = "results"
    case mid = "id"
    case description = "description"
    case altDescription = "alt_description"
    case urls = "urls"
    case thumb = "thumb"
    case bigImg = "regular"
    case likes = "likes"
    case user = "user"
    case bio = "bio"
    case name = "name"
    case username = "username"
    case profileImage = "profile_image"
    case userThumb = "large"
    case tags = "tags"
    case title = "title"
}

let METADATA_URL_STR = "https://api.unsplash.com/search/photos?page=1&client_id=c99a7e7599297260b46b7c9cf36727badeb1d37b1f24aa9ef5d844e3fbed76fe&query=sea"

let LIST_ACCESSIBILITY_ID = "photosList"

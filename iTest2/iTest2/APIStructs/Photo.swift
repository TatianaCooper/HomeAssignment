//
//  Photos.swift
//  iTest2
//
//  Created by Tatiana Cooper on 28/01/2022.
//

import Foundation

struct Photo : Hashable {
    let mid: String?
    let imgUrl: URL?
    let description: String?
    let bigImgUrl: URL?
    let likes: Int?
    let userId : String!
    let tags : Set<String>!
}

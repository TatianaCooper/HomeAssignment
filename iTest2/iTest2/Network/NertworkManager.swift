//
//  NertworkManager.swift
//  iTest2
//
//  Created by Tatiana Cooper on 28/01/2022.
//

import Foundation

struct NetworkManager {
    func getMetadata ( completionHandler: @escaping ([String:AnyObject]? , Error?  )->() ) {
        guard let url = URL(string: METADATA_URL_STR) else {
            return
        }
        NetworkTask.get(url: url) { responseDictionary , error in
            completionHandler(responseDictionary, error)
        }
    }
}

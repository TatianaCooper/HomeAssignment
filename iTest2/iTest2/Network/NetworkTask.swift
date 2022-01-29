//
//  NetworkManager.swift
//  iTest
//
//  Created by Tatiana Cooper on 27/01/2022.
//

import Foundation

struct NetworkTask  {
    
    static func get(url: URL , completionHandler: @escaping ([String:AnyObject]? , Error?  )->()  ) {
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
           onResponse(data: data, response: response, error: error, completionHandler: completionHandler)
        }
        task.resume()
    }
    
    static func onResponse (  data : Data? , response : URLResponse? , error : Error? ,   completionHandler: @escaping ([String:AnyObject]? , Error?  )->()) {
        if (error == nil ){
            guard let data = data  else  {
                completionHandler (nil, nil )
                return
            }
            do {
                let responseDictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String:AnyObject]
                completionHandler (responseDictionary , nil )
            }
            catch let e {
                completionHandler (nil , e)
            }
        }
        else  {//error != nil
            completionHandler ( nil , error )
        }
            
    }
}

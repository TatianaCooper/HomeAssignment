//
//  PhotosModel.swift
//  iTest2
//
//  Created by Tatiana Cooper on 28/01/2022.
//

import Foundation
import SwiftUI

class PhotosModel : ObservableObject {
    
    @Published var photos =  Array<Photo>()
    
    var users = Dictionary<String, User>()
    
    let networkManager = NetworkManager()
    
    @Published var showNewtworkErrorDialog = false
    
    func start () {
        self.getPhotos()
    }
    
    func getPhotos () {
        networkManager.getMetadata { responseDictionary , error in
            guard error == nil else {
                DispatchQueue.main.async {
                    self.showNewtworkErrorDialog = true
                }
                return
            }
            guard let responseDictionary = responseDictionary else {
                return
            }
            guard let results = responseDictionary[ WebFields.results.rawValue ] as? Array<Any> else  {
                return
            }
            self.parsePhotos(arr: results)
        }
    }
    
    func parsePhotos (arr : Array<Any>) {
        var tempPhotos = Array<Photo>()
        for item in arr {
            if let item = item as? Dictionary<String, Any>  {
                var url : URL?
                var bigUrl: URL?
                let phid = item[WebFields.mid.rawValue] as? String
                let likes = item[WebFields.likes.rawValue] as? Int
                if let urls = item[WebFields.urls.rawValue] as? Dictionary<String,String> {
                    if let urlStr = urls[WebFields.thumb.rawValue]  {
                        url = URL(string: urlStr)
                    }
                    if let bigUrlStr = urls[WebFields.bigImg.rawValue]  {
                        bigUrl = URL(string: bigUrlStr)
                    }
                }
                var description = item[WebFields.description.rawValue] as? String
                if description == nil {
                    description = item[WebFields.altDescription.rawValue] as? String
                }
                var tempTags = Set<String>()
                if let tags = item[WebFields.tags.rawValue] as? Array<AnyObject> {
                    for tag in tags {
                        if let tagDict = tag as? Dictionary<String,Any> {
                            if let title = tagDict[WebFields.title.rawValue]  as? String {
                                tempTags.insert(title.lowercased())
                            }
                        }
                    }
                }
                print ("tempTags = \(tempTags)")
                if let user = item[WebFields.user.rawValue] as? Dictionary<String, Any> {
                    if let uid = user[WebFields.mid.rawValue] as? String {
                        if self.users[uid] == nil   {
                            var userThumb : URL?
                            let bio = user[WebFields.bio.rawValue] as? String
                            let fullName = user[WebFields.name.rawValue] as? String
                            let userName = user[WebFields.username.rawValue] as? String
                            if let urls = user[WebFields.profileImage.rawValue] as? Dictionary<String,String> {
                                if let userThumbStr = urls[WebFields.userThumb.rawValue]   {
                                    userThumb = URL(string: userThumbStr)
                                }
                            }
                            let user = User(mid: uid, thumbnail: userThumb, name: fullName, username: userName, bio: bio)
                            users[uid] = user
                        }
                        let photo = Photo(mid: phid, imgUrl: url, description: description, bigImgUrl: bigUrl, likes: likes , userId: uid , tags: tempTags)
                        tempPhotos.append(photo)
                    }
                }
                
               
            }
        }
        DispatchQueue.main.async {
            self.photos = tempPhotos
        }
        
    }
}

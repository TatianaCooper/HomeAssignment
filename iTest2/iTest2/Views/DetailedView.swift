//
//  DetailedView.swift
//  iTest2
//
//  Created by Tatiana Cooper on 28/01/2022.
//

import SwiftUI

struct DetailedView: View {
    let photo: Photo!
    let user : User!
    var body: some View {
        GeometryReader { geometryProxy in
            VStack (alignment: .center) {
                AsyncImage(url: photo.bigImgUrl) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geometryProxy.size.width, alignment: .center)
                        
                } placeholder: {
                    Color.gray
                }
                .clipShape(Rectangle())
                Text(photo.description ?? "" )
                
                Spacer()
                HStack {
                    AsyncImage(url: user?.thumbnail) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                          
                    } placeholder: {
                        Color.gray
                    }.frame(width: 128, height: 128)
                    VStack (alignment: .leading , spacing: 10) {
                        Text(user.name ?? "")
                        Text(user.username ?? "")
                        Text(user.bio ?? "")
                    }.frame( alignment: .leading)
                        .padding()
                }.padding()
                HStack {
                    if let likes = photo.likes {
                        Image (systemName: "heart.fill")
                        Text ("\(likes)")
                    }
                }
                .padding()
                
            }.navigationTitle(NSLocalizedString("detailed_view_title", comment: ""))
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}


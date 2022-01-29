//
//  ContentView.swift
//  iTest2
//
//  Created by Tatiana Cooper on 28/01/2022.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @EnvironmentObject var photosViewModel: PhotosModel
    @State private var searchText = ""
    @State var isToShowAlert : Bool = false
    var searchResults: [Photo] {
        if searchText.isEmpty {
            return self.photosViewModel.photos
        } else {
            let lowerCased = searchText.lowercased()
            return self.photosViewModel.photos.filter {$0.tags.joined(separator: "@#$%").contains(lowerCased) }
        }
    }
    var body: some View {
        VStack {
            NavigationView {
                List {
                    ForEach( searchResults, id: \.self) { photo in
                        NavigationLink (destination: DetailedView(photo: photo , user: self.photosViewModel.users[photo.userId]) ) {
                            HStack {
                                AsyncImage(url: photo.imgUrl) { image in
                                    image.resizable()
                                        .aspectRatio(contentMode: .fill)
                                        
                                } placeholder: {
                                    Color.gray
                                }
                                .frame(width: 88, height: 88)
                                .clipShape(Circle())
                                .overlay(
                                    Circle().stroke(Color.gray, lineWidth: 1))
                                Text (photo.description ?? "" )
                                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 33, trailing: 0 ))
                            }
                        }
                    }
                }
                .searchable(text: $searchText, prompt: NSLocalizedString("search_prompt", comment: ""))
                .navigationTitle(NSLocalizedString("main_view_title", comment: ""))
                .navigationBarTitleDisplayMode(.inline)
                .accessibilityIdentifier(LIST_ACCESSIBILITY_ID)
            }
        }.onReceive(self.photosViewModel.$showNewtworkErrorDialog) { val in
            if val == true {
                self.isToShowAlert = true
            }
        }.onAppear {
            self.photosViewModel.start()
        }.alert(isPresented: self.$isToShowAlert) {
            Alert(title: Text(NSLocalizedString("network_error_msg_title", comment: "")), message: Text(NSLocalizedString("network_error_msg_body", comment: "")))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

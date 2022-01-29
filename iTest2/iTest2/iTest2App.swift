//
//  iTest2App.swift
//  iTest2
//
//  Created by Tatiana Cooper on 28/01/2022.
//

import SwiftUI

@main
struct iTest2App: App {
    @StateObject var photosModel = PhotosModel()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(photosModel)
        }
    }
}

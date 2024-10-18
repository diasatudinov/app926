//
//  app926App.swift
//  app926
//
//  Created by Dias Atudinov on 02.10.2024.
//

import SwiftUI

@main
struct app926App: App {
    var body: some Scene {
        WindowGroup {
            NavigationView{
                LoaderUIView()
                    .onTapGesture {
                        UIApplication.shared.endEditing()
                    }
            }
        }
    }
}

//
//  ContentView.swift
//  DemoApp
//
//  Created by Alsey Coleman Miller on 7/28/23.
//

import SwiftUI
import CoreDemo

struct ContentView: View {
    var body: some View {
        NavigationView {
            PeopleListView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

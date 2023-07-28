//
//  PersonRowView.swift
//  DemoApp
//
//  Created by Alsey Coleman Miller on 7/28/23.
//

import Foundation
import SwiftUI
import CoreDemo

struct PersonRowView: View {
    
    let person: Person
    
    var body: some View {
        VStack {
            Text(verbatim: person.name)
            if let language = person.language {
                Text(verbatim: language.rawValue)
            }
        }
    }
}

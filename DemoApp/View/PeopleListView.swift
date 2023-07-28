//
//  PeopleListView.swift
//  DemoApp
//
//  Created by Alsey Coleman Miller on 7/28/23.
//

import Foundation
import SwiftUI
import CoreDemo

struct PeopleListView: View {
    
    @State
    private var data: ViewState = .loading
    
    var body: some View {
        content
            .refreshable {
                await reloadData()
            }
            .onAppear {
                Task(priority: .userInitiated) {
                    await self.reloadData()
                }
            }
            .navigationTitle("People")
    }
}

private extension PeopleListView {
    
    var content: some View {
        VStack {
            switch data {
            case .loading:
                Text("Loading...")
                ProgressView()
                    .progressViewStyle(.circular)
            case .error(let error):
                Text(verbatim: error)
            case .success(let people):
                List(people) {
                    PersonRowView(person: $0)
                }
            }
        }
        
    }
}

extension PeopleListView {
    
    enum ViewState {
        
        case loading
        case error(String)
        case success([Person])
    }
    
    func reloadData() async {
        let client = URLSession.shared
        self.data = .loading
        do {
            let response = try await client.fetchPeople()
            try await Task.sleep(for: .seconds(2))
            self.data = .success(response.people)
        }
        catch {
            self.data = .error(error.localizedDescription)
        }
    }
}

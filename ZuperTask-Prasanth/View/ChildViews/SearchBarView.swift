//
//  SearchBarView.swift
//  ZuperTask-Prasanth
//
//  Created by Prasanth S on 11/07/25.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            TextField("Search services", text: $searchText)
                .textFieldStyle(.plain)
        }
        .padding(8)
        .background(Color(.systemGray6))
        .cornerRadius(8)
        .padding([.horizontal, .top])
    }
}

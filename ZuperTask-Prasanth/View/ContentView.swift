//
//  ContentView.swift
//  ZuperTask-Prasanth
//
//  Created by Prasanth S on 11/07/25.
//

import SwiftUI
import ServicesSampleData

struct ContentView: View {
    @StateObject private var viewModel = ServiceListViewModel()
    @State private var selectedService: Service?
    
    var body: some View {
        NavigationStack {
            VStack {
                SearchBarView(searchText: $viewModel.searchText)
                Divider().background(Color.gray.opacity(0.5))
                List(viewModel.filteredServices, id: \.id) { service in
//                    NavigationLink(destination: ServiceDetailView(service: service)) {
                        ServiceRowView(service: service)
                            .onTapGesture {
                                selectedService = service
                        }
//                    }
                }
                .refreshable {
                    await viewModel.refreshServices()
                }
            }
            .listStyle(.plain)
            .navigationTitle("Services")
            .navigationDestination(item: $selectedService) { service in
                ServiceDetailView(service: service)
            }
        }
    }
}

#Preview {
    ContentView()
}

//
//  ServiceListViewModel.swift
//  ZuperTask-Prasanth
//
//  Created by Prasanth S on 11/07/25.
//


import Combine
import SwiftUI
import ServicesSampleData

class ServiceListViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var services: [Service] = SampleData.generateServices()
    @Published var filteredServices: [Service] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSearch()
        self.filteredServices = services
    }
    
    func setupSearch() {
        $searchText
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] text in
                self?.filterServices(text: text)
            }
            .store(in: &cancellables)
    }
    
    private func filterServices(text: String) {
        if text.isEmpty {
            filteredServices = services
        } else {
            filteredServices = services.filter {
                $0.title.localizedCaseInsensitiveContains(text) ||
                $0.description.localizedCaseInsensitiveContains(text) ||
                $0.customerName.localizedCaseInsensitiveContains(text)
            }
        }
    }
    
    func refreshServices() async {
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        self.services = SampleData.generateServices()
        self.filterServices(text: searchText)
    }
}

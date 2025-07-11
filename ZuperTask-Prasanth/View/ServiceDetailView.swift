//
//  ServiceDetailView.swift
//  ZuperTask-Prasanth
//
//  Created by Prasanth S on 11/07/25.
//


import SwiftUI
import MapKit
import CoreLocation
import ServicesSampleData

struct ServiceDetailView: View {
    let service: Service

    private let coordinate = CLLocationCoordinate2D(latitude: 13.059136, longitude: 80.171240)

    @State private var cameraPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 13.059136, longitude: 80.171240),
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )
    )

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Map(position: $cameraPosition) {
                    Marker(service.title, coordinate: coordinate)
                        .tint(.blue)
                }
                .frame(height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 12))

                HStack {
                    Text(service.title)
                        .font(.title2.bold())

                    Spacer()

                    Text(service.status.rawValue)
                        .font(.caption)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .foregroundStyle(Utils.statusTextColor(service.status.rawValue))
                        .background(Capsule().fill(Utils.statusColor(service.status.rawValue)))
                }

                VStack(alignment: .leading, spacing: 16) {
                    ServiceContentView(imageName: "person.circle.fill", heading: "Customer", contentString: service.customerName)
                    
                    ServiceContentView(imageName: "doc.text.fill", heading: "Description", contentString: service.description)
                 
                    ServiceContentView(imageName: "clock.fill", heading: "Scheduled Time", contentString: Utils.formattedDate(service.scheduledDate))
                    
                    ServiceContentView(imageName: "mappin.and.ellipse", heading: "Location", contentString: service.location)
                    
                    ServiceContentView(imageName: "text.bubble.fill", heading: "Service Notes", contentString: service.serviceNotes)
                }
                .font(.subheadline)
            }
            .padding()
        }
        .navigationTitle("Service Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}



#Preview {
    ServiceDetailView(service: Service(id: "1", title: "Car Service", customerName: "Prasanth", description: "Complete office space redesign with modern furniture and ergonomic workstations", status: .active, priority: .high, scheduledDate: "", location: "321 Industrial Boulevard", serviceNotes: "Please ensure parking space is available for service vehicle"))
}


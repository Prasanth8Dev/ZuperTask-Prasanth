//
//  ServiceRowView.swift
//  ZuperTask-Prasanth
//
//  Created by Prasanth S on 11/07/25.
//

import SwiftUI
import ServicesSampleData

struct ServiceRowView: View {
    let service: Service
    var body: some View {
        ZStack() {
            RoundedRectangle(cornerRadius: 15).stroke(Color.gray.opacity(0.5) ,lineWidth: 2).background(Color.white)
            VStack(alignment: .leading,spacing: 5) {
                HStack {
                    Text(service.title).font(.headline).bold()
                    Spacer()
                    Circle()
                        .fill(Utils.priorityColor(service.priority.rawValue))
                        .frame(width: 10, height: 10)
                    
                }
                
                HStack(spacing: 10) {
                    Image(systemName: "person.crop.circle")
                        .foregroundColor(Color(hex: "#25599E"))
                    Text(service.customerName).font(.subheadline).foregroundStyle(Color.gray)
                }
                HStack(spacing: 10) {
                    Image(systemName: "doc.text")
                        .foregroundColor(Color(hex: "#25599E"))
                    Text(service.description)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                HStack {
                    Text(service.status.rawValue)
                        .font(.caption)
                        .foregroundColor(Utils.statusTextColor(service.status.rawValue))
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Utils.statusColor(service.status.rawValue).opacity(0.2))
                        .clipShape(Capsule())
                    
                    Spacer()
                    
                    Text(Utils.formattedDate(service.scheduledDate))
                        .font(.caption)
                        .foregroundColor(.gray)
                }.padding(.top,10)
                
            }.padding()
        }
    }
}

#Preview {
    ServiceRowView(service: Service(id: "1", title: "Car Service", customerName: "Prasanth", description: "Complete office space redesign with modern furniture and ergonomic workstations", status: .active, priority: .high, scheduledDate: "", location: "321 Industrial Boulevard", serviceNotes: "Please ensure parking space is available for service vehicle"))
}

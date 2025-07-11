//
//  ServiceContentView.swift
//  ZuperTask-Prasanth
//
//  Created by Prasanth S on 11/07/25.
//

import SwiftUI

struct ServiceContentView: View {
    let imageName: String
    let heading: String
    let contentString: String
    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            Image(systemName: "person.circle.fill")
                .foregroundColor(Color(hex: "#25599E"))
            VStack(alignment: .leading, spacing: 4) {
                Text(heading)
                    .fontWeight(.semibold)
                Text(contentString)
            }
        }
    }
}

#Preview {
    ServiceContentView(imageName: "person.circle.fill", heading: "Name", contentString: "Prasanth")
}

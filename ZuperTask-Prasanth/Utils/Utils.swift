//
//  Utils.swift
//  ZuperTask-Prasanth
//
//  Created by Prasanth S on 11/07/25.
//
import SwiftUI

class Utils {
    
    static func statusColor(_ status: String) -> Color {
        switch status.lowercased() {
        case "in progress":
            return Color.blue.opacity(0.5)
        case "scheduled":
            return Color.green.opacity(0.5)
        case "completed":
            return Color.green.opacity(0.5)
        case "approved":
            return Color.orange.opacity(0.5)
        case "active":
            return Color.black.opacity(0.5)
        case "urgent":
            return Color.red.opacity(0.5)
        default:
            return Color.gray.opacity(0.5)
        }
    }
    
    static func statusTextColor(_ status: String) -> Color {
        switch status.lowercased() {
        case "in progress":
            return Color.blue
        case "scheduled":
            return Color.green
        case "completed":
            return Color.green
        case "approved":
            return Color.orange
        case "active":
            return Color.black
        case "urgent":
            return Color.red
        default: return Color.gray
        }
    }
    
    static func priorityColor(_ status: String) -> Color {
        switch status.lowercased() {
        case "low":
            return Color.green.opacity(0.6)
        case "medium":
            return Color.yellow
        case "high":
            return Color.orange
        case "critical":
            return Color.red
        default:
            return Color.gray               
        }
    }

    static func formattedDate(_ isoString: String) -> String {
        let formatter = ISO8601DateFormatter()
        if let date = formatter.date(from: isoString) {
            let displayFormatter = DateFormatter()
            displayFormatter.dateFormat = "MMM d, h:mm a"
            return displayFormatter.string(from: date)
        }
        return ""
    }
}

import SwiftUI

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17,
                            (int >> 4 & 0xF) * 17,
                            (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16,
                            int >> 8 & 0xFF,
                            int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24,
                            int >> 16 & 0xFF,
                            int >> 8 & 0xFF,
                            int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

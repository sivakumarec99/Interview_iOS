//
//  DatePickerView.swift
//  Interview
//
//  Created by JIDTP1408 on 03/04/25.
//

import Foundation
import SwiftUI

struct DatePickerView: View {
    
    let components = [
        UIComponent(
            title: "Basic Date Picker",
            description: "A simple date picker.",
            code: """
            struct BasicDatePicker: View {
                @State private var selectedDate = Date()

                var body: some View {
                    DatePicker("Select Date", selection: $selectedDate, displayedComponents: .date)
                        .datePickerStyle(DefaultDatePickerStyle())
                        .padding()
                }
            }
            """,
            contentView: AnyView(BasicDatePicker())
        ),
        
        UIComponent(
            title: "Date Picker with Range",
            description: "Restricts selection within a date range.",
            code: """
            struct RangeDatePicker: View {
                @State private var selectedDate = Date()
                let startDate = Calendar.current.date(byAdding: .day, value: -7, to: Date())!
                let endDate = Calendar.current.date(byAdding: .day, value: 7, to: Date())!

                var body: some View {
                    DatePicker("Select Date", selection: $selectedDate, in: startDate...endDate, displayedComponents: .date)
                        .datePickerStyle(WheelDatePickerStyle())
                        .padding()
                }
            }
            """,
            contentView: AnyView(RangeDatePicker())
        ),
        
        UIComponent(
            title: "Time Picker",
            description: "Select only the time.",
            code: """
            struct TimePicker: View {
                @State private var selectedTime = Date()

                var body: some View {
                    DatePicker("Select Time", selection: $selectedTime, displayedComponents: .hourAndMinute)
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .padding()
                }
            }
            """,
            contentView: AnyView(TimePicker())
        ),
        
        UIComponent(
            title: "Different Date Picker Styles",
            description: "Explore different styles like Graphical and Compact.",
            code: """
            struct StyledDatePicker: View {
                @State private var selectedDate = Date()

                var body: some View {
                    VStack {
                        DatePicker("Compact Style", selection: $selectedDate)
                            .datePickerStyle(CompactDatePickerStyle())
                            .padding()
                        
                        DatePicker("Graphical Style", selection: $selectedDate)
                            .datePickerStyle(GraphicalDatePickerStyle())
                            .padding()
                    }
                }
            }
            """,
            contentView: AnyView(StyledDatePicker())
        ),
        
        UIComponent(
            title: "Formatted Date Picker",
            description: "Custom formatted date display.",
            code: """
            struct FormattedDatePicker: View {
                @State private var selectedDate = Date()

                var body: some View {
                    VStack {
                        DatePicker("Select Date", selection: $selectedDate, displayedComponents: .date)
                            .datePickerStyle(DefaultDatePickerStyle())
                            .padding()
                        
                        Text("Selected: \\(selectedDate, formatter: dateFormatter)")
                    }
                }

                private var dateFormatter: DateFormatter {
                    let formatter = DateFormatter()
                    formatter.dateStyle = .long
                    return formatter
                }
            }
            """,
            contentView: AnyView(FormattedDatePicker())
        )
    ]
    
    var body: some View {
        List(components) { component in
            NavigationLink(destination: ComponentView(component: component, content: {
                component.contentView
            })) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(component.title)
                        .font(.headline)
                    Text(component.description)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
            }
        }
        .navigationTitle("SwiftUI DatePicker Components")
    }
}


struct BasicDatePicker: View {
    @State private var selectedDate = Date()

    var body: some View {
        DatePicker("Select Date", selection: $selectedDate, displayedComponents: .date)
            .datePickerStyle(DefaultDatePickerStyle())
            .padding()
    }
}
struct RangeDatePicker: View {
    @State private var selectedDate = Date()
    let startDate = Calendar.current.date(byAdding: .day, value: -7, to: Date())!
    let endDate = Calendar.current.date(byAdding: .day, value: 7, to: Date())!

    var body: some View {
        #if os(macOS)
            DatePicker("Select Date", selection: $selectedDate, in: startDate...endDate, displayedComponents: .date)
                .datePickerStyle(
                    .graphical)
                .padding()
        #else
            DatePicker("Select Date", selection: $selectedDate, in: startDate...endDate, displayedComponents: .date)
                .datePickerStyle(
                    WheelDatePickerStyle())
                .padding()
        #endif
       
    }
}

struct TimePicker: View {
    @State private var selectedTime = Date()

    var body: some View {
        DatePicker("Select Time", selection: $selectedTime, displayedComponents: .hourAndMinute)
            .datePickerStyle(GraphicalDatePickerStyle())
            .padding()
    }
}
struct StyledDatePicker: View {
    @State private var selectedDate = Date()

    var body: some View {
        VStack {
            DatePicker("Compact Style", selection: $selectedDate)
                .datePickerStyle(CompactDatePickerStyle())
                .padding()
            
            DatePicker("Graphical Style", selection: $selectedDate)
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding()
        }
    }
}

struct FormattedDatePicker: View {
    @State private var selectedDate = Date()

    var body: some View {
        VStack {
            DatePicker("Select Date", selection: $selectedDate, displayedComponents: .date)
                .datePickerStyle(DefaultDatePickerStyle())
                .padding()
            
            Text("Selected: \(selectedDate, formatter: dateFormatter)")
        }
    }

    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
}

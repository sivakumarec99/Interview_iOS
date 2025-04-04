//
//  SwiftUI.swift
//  Interview
//
//  Created by JIDTP1408 on 01/04/25.
//
import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        ComponentListView()
    }
}

// Enum for UI Components
enum UIComponentType: String, CaseIterable, Identifiable {
    case MenuView = "MenuView"
    case LinkView  = "LinkView"
    #if os(macOS)
    case SplitView = "SplitView"
    #endif
    case GroupBox = "GroupBox"
    case FormView = "FormView"
    case DisCloserGroup = "DisclosorGroup"
    case Advanced = "Advanced"
    case Animations = "Animations"
    case AlertsModals = "AlertsModalsViewScreen"
    case ListScroll = "ListScrollView"
    case NavigationTab = "NavigationTab"
    case ProgressRing = "ProgressRing"
    case GaugeView = "GaugeView"
    case progress = "Progress"
    case DatePicker = "DatePicker"
    case stepper = "Stepper"
    case sliderView = "SliderView"
    case picker = "Picker"
    case text = "Text"
    case button = "Button"
    case image = "Image"
    case textFiled = "TexField"
    case toggle = "Toggle"
    
    var id: String { self.rawValue }

    @ViewBuilder
    var destination: some View {
        switch self {
        case .progress:
            ProgressViewScreen()
        case .DatePicker:
            DatePickerView()
        case .stepper:
            StepperView()
        case .sliderView:
            SliderView()
        case.picker:
            PickerView()
        case .text:
            TextView()
        case .button:
            ButtonView()
        case .image:
            ImageView()
        case .textFiled:
            TextFieldView()
        case .toggle:
            ToggleView()
        case .GaugeView:
            GaugeViewScreen()
        case .ProgressRing:
            ProgressRingViewScreen()
        case .NavigationTab:
            NavigationTabViewScreen()
        case .ListScroll:
            ListScrollViewScreen()
        case .AlertsModals:
            AlertsModalsViewScreen()
        case .Animations:
            AnimationsViewScreen()
        case .Advanced:
            AdvancedViewsScreen()
        case .DisCloserGroup:
            DiscloserGroupViewScreen()
        case .FormView:
            FromViewCustom()
        case .GroupBox:
            GroupBoxViewScreen()
        #if os(macOS)
        case .SplitView:
            SplitViewScreen()
        #endif
        case .LinkView:
            LinkViewScreen()
        case .MenuView:
            MenuViewScreen()
        }
    
    }
}
// Extension to provide icons for components
extension UIComponentType {
    var iconName: String {
        switch self {
        case.DatePicker:
            return "photo"
        case .stepper:
            return "photo"
        case .sliderView:
            return "photo"
        case .picker:
            return "photo"
        case .text:
            return "textformat"
        case .button:
            return "rectangle.and.hand.point.up"
        case .image:
            return "photo"
        case .textFiled:
            return "photo"
        case .toggle:
            return "rectangle.and.hand.point.up"
        default:
            return "photo"
        }
    }
}


struct ComponentListView: View {
    var body: some View {
        NavigationView {
            List(UIComponentType.allCases) { component in
                NavigationLink(destination: component.destination) {
                    HStack {
                        Image(systemName: component.iconName)
                            .foregroundColor(.blue)
                        Text(component.rawValue)
                            .font(.headline)
                    }
                    .padding(.vertical, 5)
                }
            }
            .navigationTitle("SwiftUI Components")
        }
    }
}



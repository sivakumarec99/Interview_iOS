//
//  TabView.swift
//  Interview
//
//  Created by JIDTP1408 on 01/04/25.
//

import Foundation
import SwiftUI

struct TabViewScreen :View{
    var body: some View{
        TabView{
            SwiftUIView().tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            KitView().tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            ObjectiveC().tabItem {
                Image(systemName: "house.fill")
                Text("Objectiv C")
            }
            
        }
        
    }
    
}
struct TabViewScreen_Previews: PreviewProvider {
    static var previews: some View {
        TabViewScreen()
    }
}

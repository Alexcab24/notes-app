//
//  ContentView.swift
//  Notes
//
//  Created by Alex on 8/6/25.
//

import SwiftUI


struct ContentView: View {
    @StateObject var appInfo = AppInfo()
    
 
    
    var body: some View {
        TabView {
            NListView()
                .tabItem {
                    Label("All notes", systemImage: "house.fill")
                }
            NListView(forFavorites: true)
                .tabItem {
                    Label("Favorites notes", systemImage: "heart")
                }
        }
   
            .environmentObject(appInfo)
        }
    }


#Preview {
    ContentView()
}

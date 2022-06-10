//
//  TabBar.swift
//  TikTok2
//
//  Created by Fabiana Falgiano on 09/12/21.
//

import SwiftUI

struct TabBar: View {
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.black

      }
    
    var body: some View {
        TabView() {
            ContentView()
                .tabItem {
                    Text("Home")
                    Image(systemName: "house")
                }.tag(1)
            
            Text("xxx")
                .tabItem {
                    Text("Discover")
                    Image(systemName: "safari")
                }.tag(2)
            
            Text("xxx")
                .tabItem {
                    Text("Create")
                    Image(systemName: "video.badge.plus")
                }.tag(3)
            Text("xxx")
                .tabItem {
                    Text("Activities")
                    Image(systemName: "archivebox")
                }.tag(4)
            
            Text("xxx")
                .tabItem {
                    Text("Profile")
                    Image(systemName: "person")
                    
                }.tag(5)
            
        }.accentColor(Color(.systemPink))
            .preferredColorScheme(.dark)
        
    }
}
struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}

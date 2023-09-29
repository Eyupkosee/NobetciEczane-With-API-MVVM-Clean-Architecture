//
//  ContentView.swift
//  NobetciEczane
//
//  Created by eyüp köse on 26.09.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            MapView()
                .tabItem {
                    Image(systemName: "map.circle.fill")
                        .foregroundColor(Color.red)
                    Text("Map")
                }
            ListView()
                .tabItem {
                    Image(systemName: "magnifyingglass.circle.fill")
                        .foregroundColor(Color.red)
                    Text("search")
                }
            
        }.tint(.pink)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

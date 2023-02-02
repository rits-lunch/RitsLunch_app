//
//  tab.swift
//  RitsLunch
//
//  Created by 澤木柊斗 on 2023/02/01.
//

import SwiftUI

struct tab: View {
    var body: some View {
        TabView{
            ContentView()
                .tabItem{
                    VStack{
                        Image(systemName: "house")
                        Text("店舗状況")
                    }
                }
            menu()
                .tabItem{
                    VStack{
                        Image(systemName: "person")
                        Text("出店の方はこちら")
                    }
                }
            
            
        }
    }
}

struct tab_Previews: PreviewProvider {
    static var previews: some View {
        tab()
    }
}

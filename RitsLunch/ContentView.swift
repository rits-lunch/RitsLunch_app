//
//  ContentView.swift
//  RitsLunch
//
//  Created by Yuuki Yamaguchi on 2022/11/21.

import SwiftUI

struct ContentView: View {
    @State var results:Results?
    
    @ObservedObject var searcher = YoutubeSearcher()
    
    var body: some View {
    
        NavigationView {
            VStack {
                HStack {
                    VStack{Text("youtube")
                        Text("sample")
                    }
                    Button(action: {
                        self.searcher.search()
                    }) {
                        Text("表示する")
                    }
                    .background(
                        Capsule()
                            .foregroundColor(.white)
                            .frame(width: 80, height: 30))
                        .padding(20)
                }
                
                Spacer()
                if self.searcher.results != nil {
                    List {
                        ForEach(self.searcher.results!.items) {item in
                            
                                VideoRowView(title: item.snippet.title,  description: item.snippet.description)
                            }
                        
                    }
                }
              
            
            }
      
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

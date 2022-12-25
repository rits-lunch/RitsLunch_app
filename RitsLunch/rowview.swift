//
//  rowview.swift
//  RitsLunch
//
//  Created by 澤木柊斗 on 2022/12/25.
//

import SwiftUI


struct VideoRowView: View {
    @State var title: String
  
    @State var description: String
    
    var body: some View {
        HStack{
            
            VStack{
                Text(title)
                    .font(.headline)
                Text(description)
                    .font(.caption)
                    .lineLimit(3)
            }
        }
    }
}

struct VideoRowView_Previews: PreviewProvider {
    static var previews: some View {
        VideoRowView(title: "これはタイトル",  description: "これは動画の説明です。これは動画の説明です。これは動画の説明です。これは動画の説明です。これは動画の説明です。これは動画の説明です。これは動画の説明です。これは動画の説明です。")
    }
}

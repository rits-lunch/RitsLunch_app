//
//  rowview.swift
//  youtube
//
//  Created by 澤木柊斗 on 2022/12/16.
//


import SwiftUI


struct VideoRowView: View {
    @State var title: String
    let imgurl:String
    @State var description: String
    
    var body: some View {
        HStack{
            
            VStack{
                AsyncImage(url:URL(string:imgurl)){image in image.image?.resizable().scaledToFit()}
                
                
                Text(title)
                    .font(.headline)
                Text(description)
                    .font(.caption)
                    .lineLimit(3)
                NavigationLink(destination: detail(),label:{ Text("詳細はこちら")}
                               
                )
            }
        }
    }}
struct VideoRowView_Previews: PreviewProvider {
    static var previews: some View {
        VideoRowView(title: "これはタイトル", imgurl: "https://o2-m.com/dog1.png",  description: "これは動画の説明です。これは動画の説明です。これは動画の説明です。これは動画の説明です。これは動画の説明です。これは動画の説明です。これは動画の説明です。これは動画の説明です。")
    }
}


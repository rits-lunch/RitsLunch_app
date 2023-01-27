//
//  detail.swift
//  youtube
//
//  Created by 澤木柊斗 on 2023/01/18.
//

import SwiftUI


    struct detail: View {
        @State var title: String
        let imgurl:String
        @State var description:String
        
        var body: some View {
            VStack{
                AsyncImage(url:URL(string:imgurl)){image in image.image?.resizable().frame(width: 400, height: 270)}
                HStack(alignment:.top){
                    VStack{
                    Text(title).fontWeight(.heavy)
                        .lineLimit(1)
                        .padding(.bottom,2)
                        Text(description) }
                    Spacer()
                        Text("営業中")
                        .frame(width: 70,height: 30)
                        .background(.green,in:Capsule())
                        .fontWeight(.bold)
                    
                }.padding(.horizontal,30)
                    .padding(.bottom,50)
                .padding(.top,10)
              
         
              
                
                NavigationLink(destination:VideoRowView(title: "これはタイトル", imgurl: "https://o2-m.com/dog1.png",  description: "これは動画の説明です。これは動画の説明です。これは動画の説明です。これは動画の説明です。これは動画の説明です。これは動画の説明です。これは動画の説明です。これは動画の説明です。") ,label:{VStack{
                    Text("")
                    };Spacer()
                }
                )
                
            }
        }
        
}
struct detail_Previews: PreviewProvider {
    static var previews: some View {
        detail(title: "これはタイトルです",imgurl:  "https://o2-m.com/dog1.png", description: "koreha"
  )  }
}

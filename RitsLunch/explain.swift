//
//  explain.swift
//  RitsLunch
//
//  Created by 澤木柊斗 on 2023/02/03.
//

import SwiftUI

struct explain: View {
    var body: some View {
        VStack{
            Text("RitsLunchとは？")
            Text("RitsLunchとはお昼ご飯のリンクスクエアの混雑を緩和し、学生がより快適に昼食をとれるように作られた、びわこ・くさつキャンパス生のためのキッチンカー情報提供アプリです！"
            )
            Text(
                
                "　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　お昼の時間早く食べたいけど並ぶのが大変、、キッチンカーに行きたいけど具体的に何を食べたいかは決まっていない。そんな人のためにどのようなお店が営業しているのかどの場所にキッチンカーがあるのかをシンプルかつわかりやすく提供します！")
            Text("説明を閉じる↓")
          
        }
    }
}

struct explain_Previews: PreviewProvider {
    static var previews: some View {
        explain()
    }
}

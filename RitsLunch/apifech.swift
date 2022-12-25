//
//  apifech.swift
//  RitsLunch
//
//  Created by 澤木柊斗 on 2022/12/25.
//

import Foundation

class YoutubeSearcher: ObservableObject {
    @Published var results:Results?
   
    func search() ->() {
        // リクエスト用の文字列を生成
        guard let urlStr = "https://www.googleapis.com/youtube/v3/search?part=snippet&q=ヒカキン&type=video&maxResults=20&key=AIzaSyCcvo_-dl_3ViHON2KGsDRJVdS_WBEfVC0".addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) else {
                fatalError("URL String error")
        }
        // URLに変換する
        guard let url = URL(string:urlStr) else {
            fatalError("Could'nt convert to url: \(urlStr)")
        }
        
        // Youtube APIにリクエストを送る
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let jsonData = data {
                let decodedData: Results
                do {
                    decodedData = try JSONDecoder().decode(Results.self, from: jsonData)
                } catch {
                    fatalError("Couldn't decode JSON data.")
                }
                // メインスレッドで実行
                DispatchQueue.main.async {
                    self.results = decodedData
                }
            } else {
                fatalError("Youtube API request error")
            }
        }
        task.resume()
    }
}

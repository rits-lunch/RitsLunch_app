
import SwiftUI

struct ContentView: View {
    @State var results:Results?
    
    @ObservedObject var searcher = YoutubeSearcher()
    
    var body: some View {
        VStack{
            Text("RitsLunch").font(.largeTitle)
            
            
            
            
            
                .frame(width: 414, height: 50)
                .background(.red)
            NavigationView {
                VStack {
                    
                    
                    
                    Spacer()
                    Button(action: {
                        self.searcher.search()
                    }) {
                        Text("表示する")
                    } .background(
                        Capsule()     )
                    
                    if self.searcher.results != nil {
                        ScrollView{
                            ForEach(self.searcher.results!.items) {item in
                                NavigationLink(destination:VideoRowView(title: item.snippet.title,
                                                                        imgurl: item.snippet.thumbnails.default.url,
                                                                        description: item.snippet.description)
                                               
                                               ,label:{
                                    VideoRowView(title: item.snippet.title,
                                                 imgurl: item.snippet.thumbnails.default.url,
                                                 description: item.snippet.description)}
                                )
                                
                                
                                .padding()
                                .frame(width: 300,height: 400)
                                
                                .background(.white)
                                .cornerRadius(8)
                                .clipped()
                                
                                
                            }
                        }  .shadow(color: .gray.opacity(0.7), radius: 4)
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

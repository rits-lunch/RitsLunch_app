
import SwiftUI

struct ContentView: View {
    @State var results:Results?
    
    @ObservedObject var searcher = YoutubeSearcher()
    
    var body: some View {
        VStack{   Image("home").ignoresSafeArea()
            Button(action: {
                self.searcher.search()
            }) {
                Text("店舗を表示する")
            } .background(.white,
                          in: Capsule()     )
             
                
            NavigationView {
                VStack {
                    
                    if self.searcher.results != nil {
                        ScrollView{
                            ForEach(self.searcher.results!.items) {item in
                                NavigationLink(destination:VideoRowView(title: item.snippet.title,
                                                                        imgurl: item.snippet.thumbnails.default.url,
                                                                        description: item.snippet.description)
                                               
                                               ,label:{
                                    detail(title:item.snippet.title,imgurl:  item.snippet.thumbnails.default.url, description: item.snippet.description
                                    )
                                    
                                    
                                    
                                    
                                    .frame(width: 350,height: 300)
                                    
                                    .background(.white)
                                    .cornerRadius(25)
                                    .clipped()
                                    .padding(20)
                                    
                                }                              )}
                          
                            .shadow(color: .gray.opacity(0.8), radius: 5)
                            .foregroundColor(.black)
                            
                            
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

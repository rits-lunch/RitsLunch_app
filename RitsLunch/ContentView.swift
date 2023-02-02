
import SwiftUI

struct ContentView: View {
    @State var results:Results?
    @State var confirm:Bool = true
    @ObservedObject var searcher = YoutubeSearcher()
    @State private var sheetshowing = true
    var body: some View {
        VStack{
            ZStack{  Color(red:0.838, green: 0.238, blue: 0.138 ).ignoresSafeArea().frame(height:20)
                
              
            }
             
            ZStack{
                if self.sheetshowing{
                    explain()
                }
                else{
                
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
                                        
                                    }       )}
                                
                            }
                        }
                            
                            
                        }}
                        
                    }
                    
                }
                
            Button(action: {
                                              self.searcher.search()
                self.sheetshowing.toggle()
            }) {
                ZStack{
                    
                    Color(red:0.838, green: 0.238, blue: 0.138 )
                        .ignoresSafeArea()
                        .frame(height:50,alignment: .bottom)
                        Image("pi2")
                            .resizable()
                        .frame(width: 50, height: 50)
                        
                    }}
                
            
            
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

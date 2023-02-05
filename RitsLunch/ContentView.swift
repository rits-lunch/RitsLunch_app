
import SwiftUI

struct ContentView: View {
    @State var results:Results?
    @State var confirm:Bool = true
    @ObservedObject var searcher = YoutubeSearcher()
    @State private var sheetshowing = true
    var body: some View {
        VStack{
           Color(red:0.838, green: 0.238, blue: 0.138 ).ignoresSafeArea().frame(height:20)
                
              
            
             
            ZStack{
                if self.sheetshowing{
                    VStack{
                        explain()
                        Button(action: {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                self.searcher.search()
                                                          self.sheetshowing.toggle()
                            }
                          
                        }) {
                            ZStack{
                                
                                Color(red:0.838, green: 0.238, blue: 0.138 )
                                    .ignoresSafeArea()
                                    .frame(width: 300, height:70,alignment: .bottom)
                                    .cornerRadius(100)
                                Image("pi2")
                                    .resizable()
                                    .frame(width: 70, height: 70)
                                
                            }}.buttonStyle(AnimationButtonStyle())
                    }}
                else{
                    
                
                NavigationView {
                   
                    VStack {
                        
                        if self.searcher.results != nil {
                            Text("店舗一覧").font(.title).fontWeight(.bold).frame(alignment: .leading)
                            
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
                
     
                
            
            
            
            
        }
    }
}

struct AnimationButtonStyle :ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        .scaleEffect(configuration.isPressed ? 0.7 : 1.2)
        .animation(.easeOut(duration: 0.3), value: configuration.isPressed)
           }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  rowview.swift
//  youtube
//
//  Created by 澤木柊斗 on 2022/12/16.
//


import SwiftUI
import MapKit

struct VideoRowView: View {
    @State var title: String
    let imgurl:String
    @State var description: String
    @State private var userTrackingMode: MapUserTrackingMode = .follow
    @State private var region = MKCoordinateRegion(
        //Mapの中心の緯度経度
        center: CLLocationCoordinate2D(latitude: 34.982178,
                                       longitude: 135.963516),
        //緯度の表示領域(m)
        latitudinalMeters: 750,
        //経度の表示領域(m)
        longitudinalMeters: 750
    )
    struct IdentifiablePlace: Identifiable {
        let id: UUID
        let location: CLLocationCoordinate2D
        init(id: UUID = UUID(), lat: Double, long: Double) {
            self.id = id
            self.location = CLLocationCoordinate2D(
                latitude: lat,
                longitude: long)
        }
    }
    let place = [IdentifiablePlace(lat:  34.982178, long: 135.963516),
                 IdentifiablePlace(lat:  34.982178, long: 135.963516)]
    var body: some View {
        HStack{
            
            VStack{
                AsyncImage(url:URL(string:imgurl)){image in image.image?.resizable().scaledToFit()}
                
                
                Text(title)
                    .font(.headline)
                
                Text(description)
                    .font(.caption)
                    .lineLimit(1)
                NavigationLink(destination: menu(),label:{ Text("メニューはこちら")}
                               
                )
                Map(coordinateRegion: $region,
                    //Mapの操作の指定
                    interactionModes: .all,
                    showsUserLocation: true,
                                userTrackingMode: $userTrackingMode,
                   
                    //現在地の表示
                   
                    annotationItems: place)
                        { place in
                           MapPin(coordinate: place.location,
                                      tint: Color.orange)
                        }
                
            }
        }
    }}
struct VideoRowView_Previews: PreviewProvider {
    static var previews: some View {
        VideoRowView(title: "これはタイトル", imgurl: "https://o2-m.com/dog1.png",  description: "これは動画の説明です。これは動画の説明です。これは動画の説明です。これは動画の説明です。これは動画の説明です。これは動画の説明です。これは動画の説明です。これは動画の説明です。")
    }
}


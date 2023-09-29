import SwiftUI
import MapKit

struct DetailView: View {
    @State var eczaneAdi: String
    @State var eczaneAdresi: String
    @State var eczaneTelefonu: String
    @State var eczaneTarifi: String
    @State var latitude: Double
    @State var longitude: Double
    @State var region: MKCoordinateRegion

    var markers: [Marker]

    init(eczaneAdi: String,eczaneAdresi: String,eczaneTelefonu: String,eczaneTarifi: String, latitude: Double, longitude: Double) {
        self.eczaneAdi = eczaneAdi
        self.eczaneAdresi = eczaneAdresi
        self.eczaneTelefonu = eczaneTelefonu
        self.eczaneTarifi = eczaneTarifi
        self.latitude = latitude
        self.longitude = longitude
        self.region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude),
            span: MKCoordinateSpan(latitudeDelta: 0.10, longitudeDelta: 0.10)
        )
        self.markers = [Marker(coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))]
    }

    var body: some View {
        
        VStack(alignment: .leading){
            
            VStack(alignment: .leading){
                HStack{
                    Image(systemName: "house.fill")
                        .resizable()
                        .foregroundColor(.pink)
                        .frame(width: 80, height: 100)
                        .padding(.trailing,30)
                    
                    VStack(alignment: .leading){
                        Text(eczaneAdi)
                            .bold()
                            .foregroundColor(.pink)
                            .font(.title3)
                        VStack(alignment: .leading, spacing: 14){
                            Text(eczaneTarifi)
                                .font(.footnote)
                                .foregroundColor(.gray)
                            Text(eczaneTelefonu)
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }.padding(.top,10)
                            .italic()
                    }
                    
                }.padding()
                VStack{
                    Text(eczaneAdresi)
                        
                }.padding()
            }
            Spacer()
            
            //MAP VİEW
            VStack{
                Map(coordinateRegion: $region, showsUserLocation: true, annotationItems: markers) { marker in
                    MapMarker(coordinate: marker.coordinate, tint: .red)
                }
                .frame(height: UIScreen.main.bounds.height/1.8)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    openMapsAppWithDirections(to: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
                }

            }
        }
    }

    func openMapsAppWithDirections(to coordinate: CLLocationCoordinate2D) {
        let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate))
        mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving])
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView( eczaneAdi: "Faruk Eczanesi", eczaneAdresi: "yol karşısı",eczaneTelefonu: "0312 567 88 39",eczaneTarifi: "yol karşısı",  latitude: 39.924970, longitude: 32.841042)
    }
}

struct Marker: Identifiable {
    let id = UUID()
    var coordinate: CLLocationCoordinate2D
}


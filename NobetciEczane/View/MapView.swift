import SwiftUI
import _CoreLocationUI_SwiftUI
import MapKit
import CoreLocation

struct MapView: View {
    
    @State private var selectedLocation: Location? = nil
    
    @ObservedObject var mapViewModel2: MapViewModel2
    @StateObject private var mapViewModel = MapViewModel()
    
    @State private var locations: [Location] = []
    @State private var showSplash = true
    
    
    @State private var isShowingDetail = false
   
    
    
    init() {
        self.mapViewModel2 = MapViewModel2()
        mapViewModel2.tumEczaneleriAra()
    }
    
    var body: some View {
        if showSplash{
            SplashScreen()
                .transition(.opacity)
                .animation(.easeInOut(duration: 1.5), value: showSplash) // withAnimation kullanımı
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        withAnimation {
                            self.showSplash = false
                        }
                    }
                    
                }
        }else{
            ZStack(alignment: .bottom ) {
                Map(coordinateRegion: $mapViewModel.region, showsUserLocation: true, annotationItems: locations) { location in
                    MapAnnotation(coordinate: location.coordinate) {
                        VStack {
                            Button(action: {
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                    selectedLocation = location
                                    isShowingDetail = true
                                    }
                            }) {
                                Image(systemName: "mappin.circle.fill")
                                    .resizable()
                                    .resizable()
                                    .foregroundColor(selectedLocation == location  ? .green : .pink)
                                    .frame(width: 32, height: 32)
                                    .scaleEffect(selectedLocation == location  ? 1.8 : 1)
                                    
                                
                            }
                        }
                    }
                }.edgesIgnoringSafeArea(.top)
                    .tint(Color.purple)
                    .onTapGesture {
                    
                        isShowingDetail = false
                        selectedLocation = nil
                        
                    }
                   
                
                
                LocationButton(.currentLocation) {
                    mapViewModel.requestAllowOnceLocationPermission()
                }
                .foregroundColor(.pink)
                .font(.system(size: 20))
                .cornerRadius(20)
                .symbolVariant(.fill)
                .labelStyle(.iconOnly)
                .tint(.black)
                .padding(.bottom, UIScreen.main.bounds.height * 0.75)
                .padding(.leading,UIScreen.main.bounds.width * 0.8)
                
                
                    
                if selectedLocation != nil {
                        HStack {
                            VStack{
                                Text(selectedLocation?.name ?? "deneme")
                                    .font(.title3)
                                    .fixedSize(horizontal: false, vertical: true)
                                    .opacity(1)
                                    .foregroundColor(.pink)
                                    .bold()
                                
                                HStack{
                                    Text(selectedLocation?.tarif ?? "adres deneme")
                                        .font(.system(size: 12))
                                        .multilineTextAlignment(.center)
                                    
                                }
                                
                            }
                            .frame(width: UIScreen.main.bounds.width * 0.7 , height: 80)
                            .background(.white)
                            .cornerRadius(12)
                            .padding(.horizontal)
                            .opacity(1)
                            
                            
                            VStack{
                                Image(systemName: "car.fill")
                                    .tint(.pink)
                                    .foregroundColor(.white)
                                    .padding(.vertical, 2)
                                Text("Yol Tarifi")
                                    .foregroundColor(.white)
                                    .bold()
                                    .opacity(1)
                                    .font(.system(size: 14))
                                    .padding(.horizontal)
                                    .multilineTextAlignment(.center)
                                
                            }
                            .frame(height: 80)
                            .onTapGesture {
                                openMapsAppWithDirections(to: selectedLocation?.coordinate ?? CLLocationCoordinate2D(latitude: 20.0, longitude: 20.00))
                            }
                            .background(Color.green)
                            .cornerRadius(12)
                            .padding(.vertical)
                            
                            Spacer()
                        }
                        .frame(width: UIScreen.main.bounds.width, alignment: .center)
                        .padding()
                        .background(Color.clear)
                    }
                    
                    
                    
                    
                }.onAppear {
                    // Eczane verilerini API'den çekerek locations dizisine ekleyin
                    locations = mapViewModel2.eczaneler.map { eczane in
                        Location(name: eczane.eczaneAdı ?? "Bilinmeyen Eczane", coordinate: CLLocationCoordinate2D(latitude: eczane.latitude ?? 39.92, longitude: eczane.longitude ?? 32.85), tarif: eczane.adresi ?? "Adliye durağı çaprazı beğendik market yanı")
                    }
                }

            }
        
    }
                
                
                    
                   
    
    
    func openMapsAppWithDirections(to coordinate: CLLocationCoordinate2D) {
        let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate))
        mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving])
    }
    
    struct MapView_Previews: PreviewProvider {
        static var previews: some View {
            MapView()
        }
    }
}

final class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 39.92, longitude: 32.85), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    
    let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func requestAllowOnceLocationPermission() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let latestLocation = locations.first else {
            return
        }
        
        DispatchQueue.main.async {
            self.region = MKCoordinateRegion(center: latestLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("konum hatası : \(error.localizedDescription)")
    }
}

struct Location: Identifiable  {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
    let tarif : String
}

extension Location: Equatable {
    static func == (lhs: Location, rhs: Location) -> Bool {
        return lhs.id == rhs.id
    }
}

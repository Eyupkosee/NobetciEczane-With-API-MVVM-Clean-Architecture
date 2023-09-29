//
//  MainView.swift
//  NobetciEczane
//
//  Created by eyüp köse on 22.09.2023.
//

import SwiftUI

struct ListView: View {
    
    @State var selectedSehir : String?
    @State var selectedIlce : String? 
    
    
    
    var secilenIlce: [String] {
        switch selectedSehir {
        case "adana":
            return ["seyhan", "yuregir", "cukurova"]
        case "adiyaman":
            return ["besni", "ceyhan", "samsat"]
        case "afyonkarahisar":
            return ["merkez", "sandikli", "bolvadin"]
        case "agri":
            return ["merkez", "dogubayazit", "patnos"]
        case "amasya":
            return ["merkez", "suluova", "merzifon"]
        case "ankara":
            return ["altindag", "sincan", "cankaya"]
        case "antalya":
            return ["muratpasa", "kepez", "konyaalti"]
        case "ardahan":
            return ["merkez", "posof", "hanak"]
        case "artvin":
            return ["merkez", "hopa", "borcka"]
        case "aydin":
            return ["merkez", "soke", "didim"]
        case "balikesir":
            return ["merkez", "bandirma", "edremit"]
        case "bartin":
            return ["merkez", "ulus", "kurucaşile"]
        case "batman":
            return ["merkez", "beşiri", "sason"]
        case "bayburt":
            return ["merkez", "aydıntepe", "demirözü"]
        case "bilecik":
            return ["merkez", "bozuyuk", "gölpazarı"]
        case "bingol":
            return ["merkez", "karlıova", "genç"]
        case "bitlis":
            return ["merkez", "tatvan", "adilcevaz"]
        case "bolu":
            return ["merkez", "göynük", "mengen"]
        case "burdur":
            return ["merkez", "bucak", "tavas"]
        case "bursa":
            return ["nilüfer", "osmangazi", "yıldırım"]
        case "canakkale":
            return ["merkez", "ecekacabey", "biga"]
        case "cankiri":
            return ["merkez", "orman", "yapraklı"]
        case "corum":
            return ["merkez", "isikli", "alaca"]
        case "denizli":
            return ["merkez", "pamukkale", "çivril"]
        case "diyarbakir":
            return ["baglar", "kayapınar", "sur"]
        case "duzce":
            return ["merkez", "cumayeri", "gölyaka"]
        case "edirne":
            return ["merkez", "kesan", "uzunkopru"]
        case "elazig":
            return ["merkez", "palu", "kovancılar"]
        case "erzincan":
            return ["merkez", "otluca", "cayirli"]
        case "erzurum":
            return ["merkez", "palandöken", "yakutiye"]
        case "eskisehir":
            return ["odunpazarı", "tepebasi", "sivrihisar"]
        case "gaziantep":
            return ["sahinbey", "sehitkamil", "oguzeli"]
        case "giresun":
            return ["merkez", "bulancak", "eynesil"]
        case "gumushane":
            return ["merkez", "kelkit", "siran"]
        case "hakkari":
            return ["merkez", "semdinli", "yukcukova"]
        case "hatay":
            return ["antakya", "iskenderun", "defne"]
        case "igdir":
            return ["merkez", "tuzluca", "karakoyunlu"]
        case "isparta":
            return ["merkez", "yenisarbademli", "aksu"]
        case "icel":
            return ["mersin", "tarsus", "mezitli"]
        case "istanbul":
            return ["kadikoy", "besiktas", "uskudar"]
        case "izmir":
            return ["karsıyaka", "bornova", "çigli"]
        case "kahramanmaras":
            return ["dulkadiroglu", "onikisubat", "elbistan"]
        case "karabuk":
            return ["merkez", "safranbolu", "eynek"]
        case "karaman":
            return ["merkez", "ermenek", "sariveliler"]
        case "kars":
            return ["merkez", "kagizman", "sarikamis"]
        case "kastamonu":
            return ["merkez", "devrekani", "cide"]
        case "kayseri":
            return ["melikgazi", "kocasinan", "taluğ"]
        case "kirikkale":
            return ["merkez", "kazan", "sulakyurt"]
        case "kirklareli":
            return ["merkez", "luğacı", "pehlivan"]
        case "kirsehir":
            return ["merkez", "akpınar", "kaman"]
        case "kilis":
            return ["merkez", "elbeyli", "musabeyli"]
        case "kocaeli":
            return ["izmit", "gölcük", "derince"]
        case "konya":
            return ["selçuklu", "karatay", "meram"]
        case "kutahya":
            return ["merkez", "tavşanlı", "gediz"]
        case "malatya":
            return ["merkez", "battalgazi", "darende"]
        case "manisa":
            return ["merkez", "salihli", "akhisar"]
        case "mardin":
            return ["merkez", "nusaybin", "midyat"]
        case "mugla":
            return ["merkez", "marmaris", "fethiye"]
        case "mus":
            return ["merkez", "varto", "malazgirt"]
        case "nevsehir":
            return ["merkez", "avanos", "nevşehir"]
        case "nigde":
            return ["merkez", "bor", "altunhisar"]
        case "ordu":
            return ["merkez", "altinordu", "ünye"]
        case "osmaniye":
            return ["merkez", "kadirli", "duziçi"]
        case "rize":
            return ["merkez", "çayeli", "ardahan"]
        case "sakarya":
            return ["serdivan", "adapazarı", "aras"]
        case "samsun":
            return ["atakum", "ilkadim", "canik"]
        case "siirt":
            return ["merkez", "tillo", "baykan"]
        case "sinop":
            return ["merkez", "boyabat", "sarayduzu"]
        case "sivas":
            return ["merkez", "şarkışla", "zara"]
        case "sanliurfa":
            return ["haliliye", "eyyubiye", "haliliye"]
        case "sirnak":
            return ["merkez", "cizre", "silopi"]
        case "tekirdag":
            return ["merkez", "corlu", "saray"]
        case "tokat":
            return ["merkez", "niksar", "zile"]
        case "trabzon":
            return ["ortahisar", "akçaabat", "yomra"]
        case "tunceli":
            return ["merkez", "ovacık", "mazgirt"]
        case "usak":
            return ["merkez", "banaz", "esme"]
        case "van":
            return ["merkez", "ede", "gevaş"]
        case "yalova":
            return ["merkez", "altinova", "termal"]
        case "yozgat":
            return ["merkez", "sorgun", "yalvac"]
        case "zonguldak":
            return ["merkez", "ereğli", "devrek"]
        default:
            return [] // Diğer şehirler için boş dizi
        }
    }
    //let secilenIlce = ["altindag","sincan","manavgat","cankaya"]
    
    @State private var isShowingCity = false
    @State private var isShowingIlce = false
    @State private var showSplash = false
    @ObservedObject var eczaneViewModel: EczaneViewModel
    
    
    @State private var sehir: String = ""
    @State private var ilce: String = ""
        
    // EczaneViewModel sınıfının örneğini oluşturma ve ilk aramayı yapma
    init() {
            
        self.eczaneViewModel = EczaneViewModel()
        eczaneViewModel.eczaneAramasıYap(sehir: "ankara", ilce: "altindag")
    }
        
    var body: some View {
        ZStack{
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
                NavigationView{
                    
                    VStack{
                       
                        VStack{
                            ZStack(alignment: .leading){
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(.pink)
                                    .frame(height: 40)
                                HStack{
                                    Text(selectedSehir ?? "şehir seçiniz...")
                                        .foregroundColor(.white)
                                        .padding()
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.white)
                                }.padding(.horizontal)
                                
                                
                                    
                            }.padding(.horizontal)
                                .onTapGesture {
                                    isShowingCity = true
                                }
                            
                            ZStack(alignment: .leading){
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(.pink)
                                    .frame(height: 40)
                                HStack{
                                    Text(selectedIlce ?? "ilçe seçiniz...")
                                        .foregroundColor(.white)
                                        .padding(.horizontal)
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.white)
                                }.padding(.horizontal)
                                
                                    
                            }.padding()
                                .onTapGesture {
                                    isShowingIlce = true
                                }
                            
                        }.sheet(isPresented: $isShowingCity){
                            List{
                                Section{
                                    ForEach(eczaneViewModel.cities, id: \.self) { city in
                                        Text(city)
                                            .onTapGesture {
                                                selectedSehir = city
                                                isShowingCity = false
                                            }
                                    }
                                     
                                }header: {
                                    Text("Şehir seçin")
                                }.multilineTextAlignment(.center)
                            }.presentationDetents([.medium])
                                .listStyle(.plain)
                        }
                        
                        
                        .sheet(isPresented: $isShowingIlce){
                            List{
                                Section{
                                    ForEach(secilenIlce, id: \.self) { ilce in
                                        Text(ilce)
                                            .onTapGesture {
                                                selectedIlce = ilce
                                                isShowingIlce = false
                                                self.eczaneViewModel.eczaneAramasıYap(sehir: selectedSehir ?? "ankara", ilce: selectedIlce ?? "altindag")
                                            }
                                    }
                                     
                                }
                            header: {
                                    Text("ilçe seçin")
                                }.multilineTextAlignment(.center)
                            }.presentationDetents([.medium])
                                .listStyle(.plain)
                        }
                        
                        List(eczaneViewModel.eczaneler, id: \.telefon){ eczane in
                            NavigationLink {
                                DetailView(eczaneAdi: eczane.eczaneAdı ?? "Faruk eczanesi",
                                           eczaneAdresi: eczane.adresi ?? "yol karşısı",
                                           eczaneTelefonu: eczane.telefon ?? "0535 256 67 98",
                                           eczaneTarifi: eczane.yolTarifi ?? "Adliye durağı çaprazı Beğendik market karşısı",
                                           latitude: eczane.latitude ?? 20.00,
                                           longitude: eczane.longitude ?? 20.00
                                           )
                            } label: {
                                HStack{
                                    Image(systemName: "pill.circle.fill")
                                        .resizable()
                                        .foregroundColor(.pink)
                                        .frame(width: 70, height: 70)
                                        .padding(.trailing)
                                    VStack(alignment: .leading){
                                        Text(eczane.eczaneAdı ?? "deneme")
                                            .bold()
                                            .padding(.bottom,3.5)
                                            .foregroundColor(.pink)
                                        Text(eczane.adresi ?? "")
                                            .font(.footnote)
                                            .foregroundColor(.gray)
                                    }
                                }
                            }
                            
                        }.listStyle(.plain)
                            .foregroundColor(.pink)
                    }.navigationBarTitle("Nöbetçi Eczaneler", displayMode: .inline)
                }.accentColor(.pink)
            }
        }
    }
        
    }





struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}


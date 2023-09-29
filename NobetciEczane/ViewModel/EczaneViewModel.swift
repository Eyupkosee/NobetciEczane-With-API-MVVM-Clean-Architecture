//
//  EczaneViewModel.swift
//  NobetciEczane
//
//  Created by eyüp köse on 22.09.2023.
//

import Foundation
import SwiftUI

class EczaneViewModel : ObservableObject {
    @Published var cities = ["istanbul", "izmir","ankara",  "antalya", "bursa","adana", "adiyaman", "afyonkarahisar", "agri", "amasya",  "ardahan", "artvin",
                  "aydin", "balikesir", "bartin", "batman", "bayburt", "bilecik", "bingol", "bitlis", "bolu",
                  "burdur",  "canakkale", "cankiri", "corum", "denizli", "diyarbakir", "duzce", "edirne",
                  "elazig", "erzincan", "erzurum", "eskisehir", "gaziantep", "giresun", "gumushane", "hakkari", "hatay",
                  "igdir", "isparta", "icel", "kahramanmaras", "karabuk", "karaman", "kars",
                  "kastamonu", "kayseri", "kirikkale", "kirklareli", "kirsehir", "kilis", "kocaeli", "konya", "kutahya",
                  "malatya", "manisa", "mardin", "mugla", "mus", "nevsehir", "nigde", "ordu", "osmaniye", "rize",
                  "sakarya", "samsun", "siirt", "sinop", "sivas", "sanliurfa", "sirnak", "tekirdag", "tokat", "trabzon",
                  "tunceli", "usak", "van", "yalova", "yozgat", "zonguldak"]
    
    
    
    
    // eczaneleri depolamak için kullanılan dizi
    @Published var eczaneler = [Eczane]()
    
    // DownloaderClient sınıfı örneği
    let downloadClient = DownloaderClient()
    
    // Film araması yapmak için kullanılan fonksiyon
    func eczaneAramasıYap(sehir : String, ilce : String){
        downloadClient.eczaneleriIndır(sehir: sehir, ilce: ilce) { sonuc in
            switch sonuc {
            case .success(let eczaneDizisi):
                if let eczaneDizisi = eczaneDizisi{
                    DispatchQueue.main.async {
                        self.eczaneler = eczaneDizisi
                    }
                }
            case .failure(let hata):
                print(hata)
            }
        }
    }
}

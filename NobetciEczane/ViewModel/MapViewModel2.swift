//
//  MapViewModel.swift
//  NobetciEczane
//
//  Created by eyüp köse on 27.09.2023.
//

import Foundation
import SwiftUI

class MapViewModel2 : ObservableObject {
    
    // eczaneleri depolamak için kullanılan dizi
    @Published var eczaneler = [Eczane]()
    
    // DownloaderClient sınıfı örneği
    let downloadClient = DownloaderClient()
    
    func tumEczaneleriAra(){
        downloadClient.tümEczaneleriIndır { sonuc in
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

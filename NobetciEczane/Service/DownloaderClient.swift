//
//  DownloaderClient.swift
//  NobetciEczane
//
//  Created by eyüp köse on 22.09.2023.
//

import Foundation

class DownloaderClient {
    
    
    // Eczane verilerini indirmek için kullanılan fonksiyon
    func eczaneleriIndır(sehir: String, ilce: String, completion: @escaping (Result<[Eczane]?, DownloaderError>) -> Void) {
        
        // API isteği için URL oluşturma
        guard let url = URL(string: "https://www.nosyapi.com/apiv2/pharmacyLink?city=\(sehir)&county=\(ilce)&apikey=rvjErDM635RsytkSfntbgbgfasZb7vgElj8YOnJmAYpiWujHSAK7yymhMO1Q") else {
            return completion(.failure(.yanlisUrl))
        }
        
        // URL üzerinden veri indirme işlemi başlatma
        URLSession.shared.dataTask(with: url) { data, response, error in
            // Hata kontrolü: Veri alınamazsa veya bir hata oluşursa
            if let data = data, error == nil {
                print(data)
                
                // API'den gelen JSON verilerini çözümleme
                do {
                    let eczaneCevap = try JSONDecoder().decode(GelenEczaneler.self, from: data)
                    // Başarılı bir şekilde eczane döndürme
                    completion(.success(eczaneCevap.eczaneler))
                } catch {
                    print("JSON Çözümleme Hatası: \(error)")
                    return completion(.failure(.veriIslenemedi))
                }
            } else {
                print("hata")
                return completion(.failure(.veriGelmedi))
            }
        

        }.resume() // URLSession.shared.dataTask'ı başlatmak için .resume() kullanılmalıdır.
    }
    
    
    // Mapview için tüm eczaneleri indirme
    
    func tümEczaneleriIndır(completion: @escaping (Result<[Eczane]?, DownloaderError>) -> Void) {
        
        // API isteği için URL oluşturma
        guard let url = URL(string: "https://www.nosyapi.com/apiv2/pharmacyLink?city=ankara&apikey=rvjErDM635RsytkSfntbgbgfasZb7vgElj8YOnJmAYpiWujHSAK7yymhMO1Q") else {
            return completion(.failure(.yanlisUrl))
        }
        
        // URL üzerinden veri indirme işlemi başlatma
        URLSession.shared.dataTask(with: url) { data, response, error in
            // Hata kontrolü: Veri alınamazsa veya bir hata oluşursa
            if let data = data, error == nil {
                print(data)
                
                // API'den gelen JSON verilerini çözümleme
                do {
                    let eczaneCevap = try JSONDecoder().decode(GelenEczaneler.self, from: data)
                    // Başarılı bir şekilde eczane döndürme
                    completion(.success(eczaneCevap.eczaneler))
                } catch {
                    print("JSON Çözümleme Hatası: \(error)")
                    return completion(.failure(.veriIslenemedi))
                }
            } else {
                print("hata")
                return completion(.failure(.veriGelmedi))
            }
        

        }.resume() // URLSession.shared.dataTask'ı başlatmak için .resume() kullanılmalıdır.
    }
    
}
   
// İndirme hataları için kullanılan hata türü
  enum DownloaderError: Error {
      case yanlisUrl
      case veriGelmedi
      case veriIslenemedi
  }


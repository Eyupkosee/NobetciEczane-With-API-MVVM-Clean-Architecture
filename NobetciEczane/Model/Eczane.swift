//
//  Eczane.swift
//  NobetciEczane
//
//  Created by eyüp köse on 22.09.2023.
//

import Foundation
import SwiftUI


struct Eczane : Codable{
    
    // Eczane verilerini temsil eden özellikler
    let eczaneAdı : String?
    let adresi : String?
    let yolTarifi : String?
    let telefon : String?
    let sehir : String?
    let ilce : String?
    let latitude : Double?
    let longitude : Double?
    
    // JSON ile eşleşen anahtarlar için özelleştirilmiş isimler
    private enum CodingKeys : String, CodingKey {
        case eczaneAdı = "EczaneAdi"
        case adresi = "Adresi"
        case yolTarifi = "YolTarifi"
        case telefon = "Telefon"
        case sehir = "Sehir"
        case ilce = "ilce"
        case latitude = "latitude"
        case longitude = "longitude"
    }
}

struct GelenEczaneler : Codable{
    let eczaneler : [Eczane]
    
    private enum CodingKeys : String, CodingKey{
        case eczaneler = "data"
    }
}

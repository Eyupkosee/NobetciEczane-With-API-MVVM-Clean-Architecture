//
//  SplashScreen.swift
//  NobetciEczane
//
//  Created by eyüp köse on 25.09.2023.
//

import SwiftUI

struct SplashScreen: View {
    
    @ObservedObject var eczaneViewModel: EczaneViewModel
    
    init() {
        self.eczaneViewModel = EczaneViewModel()
        eczaneViewModel.eczaneAramasıYap(sehir: "istanbul", ilce: "esenyurt")
    }
    
    var body: some View {
        
        
        
        NavigationStack{
        
        ZStack{
            Color.red
                .edgesIgnoringSafeArea(.all)
            
            
            Image(systemName: "house.fill")
                .padding(.bottom,200)
                .font(.system(size: 64))
                .foregroundColor(.white)
            
            
            
            Text("Nöbetçi Eczaneler")
                .foregroundColor(.white)
                .font(.custom(
                    "MyFont",
                    fixedSize: 34)
                    .weight(.semibold))
                .italic()
            
           
            ProgressView()
                .progressViewStyle(.circular)
                .tint(.white)
                .controlSize(.regular)
                .padding(.top,UIScreen.main.bounds.height * 0.45)
                
            
            
            Text("Developed By Eyup")
                .foregroundColor(.white)
                .font(.subheadline)
                .italic()
                .padding(.top,UIScreen.main.bounds.height * 0.85)
                .foregroundColor(.gray)
            
        }
        
    }
}
                        }
struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}

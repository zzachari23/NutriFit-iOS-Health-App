//
//  HomeView.swift
//  Body
//
//  Created by Family on 10/14/22.
//

import SwiftUI
import AVFoundation





struct HomeView: View {
    

    
    @State private var backBut: Bool = false
    
    var body: some View {
        
        
        NavigationView{
            ZStack{
      
                VStack{
                    NavigationLink(destination: FoodGroupsView(bac: $backBut).navigationBarBackButtonHidden(true)
                    ) {
                       
                        Image("nutri")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350)
                    }.simultaneousGesture(TapGesture().onEnded{
                        AudioServicesPlaySystemSound(1104)
                    })
                    
                }.position(x:205 ,y:200)
                
                VStack{
                    Image("lineH")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 400)
                    
                }.position(x:196 , y: 400)
                
                VStack{
                    
                    NavigationLink(destination: BodyView() .navigationBarBackButtonHidden(true)
                    ) {
                        
                        Image("fit")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 250)
                        
                    }.simultaneousGesture(TapGesture().onEnded{
                        AudioServicesPlaySystemSound(1104)
                    })
                    
                }.position(x:200,y:575)
                
            }
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

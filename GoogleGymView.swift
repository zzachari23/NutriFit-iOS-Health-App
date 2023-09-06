//
//  GoogleGymView.swift
//  NutriFit
//
//  Created by Family on 11/29/22.
//

import SwiftUI
import AVFoundation

struct GoogleGymView: View {
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            VStack{
                Image("map")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 600)
                    .offset(y:-206)
            }
            VStack{
                Image("loc")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 400)
                    .offset(y:165)
            }
            
            VStack{
                NavigationLink(destination: BodyView().navigationBarBackButtonHidden(true)
                ){
                    
                    Text("BODY")
                        .bold()
                        .foregroundColor(.black)
                        .frame(width: 100, height: 50)
                        .background(Color.red)
                        .cornerRadius(20)
                        .font(.system(size: 20))
                     
                }.simultaneousGesture(TapGesture().onEnded{
                    AudioServicesPlaySystemSound(1104)
                })
            }.offset(y:355)
        }
    }
}

struct GoogleGymView_Previews: PreviewProvider {
    static var previews: some View {
        GoogleGymView()
    }
}

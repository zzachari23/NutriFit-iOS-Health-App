//
//  FlipView.swift
//  Body
//
//  Created by Family on 10/18/22.
//

import SwiftUI
import AVFoundation


struct FlipView: View {

    let colorHex = Color(hex: "f5f8fb")
    @State private var isVisible: Bool = false
    
    var body: some View {
        
        ZStack {
            
            colorHex.ignoresSafeArea()
            VStack{
                Image("flipbody")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 500)
                    .offset(x:-4, y: 20)
            }
            
            
            HStack{
               Text("©MuscleWiki")
                    .bold()
                    .font(.system(size: 15))
                    .foregroundColor(.black)
                
            }.position(x:252, y:720)
            
            
            
            HStack{
                
                NavigationLink(destination: BodyView() .navigationBarBackButtonHidden(true)
                ){
                    
                    Text("FLIP")
                        .bold()
                        .foregroundColor(.black)
                        .frame(width: 100, height: 50)
                        .background(Color.gray)
                        .cornerRadius(20)
                        .font(.system(size: 20))
                }.simultaneousGesture(TapGesture().onEnded{
                    AudioServicesPlaySystemSound(1104)
                })
            }.position(x:375,y:60)
            
            
            Group{
                
                HStack{
                    Text("Traps")
                        .bold()
                        .foregroundColor(.black)
                        .font(.system(size: 20))
                }.position(x:141,y:120)
                
                HStack{
                    Rectangle()
                        .fill(.black)
                        .frame(width: 3, height: 80)
                        .rotationEffect(Angle(degrees: -70))
                }.position(x:190, y:145)
                
                
                HStack{
                    Text("Lats")
                        .bold()
                        .foregroundColor(.black)
                        .font(.system(size: 20))
                }.position(x:150,y:310)
                
                HStack{
                    Rectangle()
                        .fill(.black)
                        .frame(width: 3, height: 50)
                        .rotationEffect(Angle(degrees: 45))
                }.position(x:180, y:280)
                
                
                HStack{
                    Text("Glutes")
                        .bold()
                        .foregroundColor(.black)
                        .font(.system(size: 20))
                }.position(x:120,y: 390)
                
                HStack{
                    Rectangle()
                        .fill(.black)
                        .frame(width: 3, height: 49)
                        .rotationEffect(Angle(degrees: 90))
                }.position(x:177, y:390)
                
                HStack{
                    Text("Triceps")
                        .bold()
                        .foregroundColor(.black)
                        .font(.system(size: 20))
                }.position(x:405,y:179)
                
                HStack{
                    Rectangle()
                        .fill(.black)
                        .frame(width: 3, height: 49)
                        .rotationEffect(Angle(degrees: 45))
                }.position(x:380, y:210)
                
                HStack{
                    Text("Calves")
                        .bold()
                        .foregroundColor(.black)
                        .font(.system(size: 20))
                }.position(x:375,y:540)
                
                HStack{
                    Rectangle()
                        .fill(.black)
                        .frame(width: 3, height: 68)
                        .rotationEffect(Angle(degrees: 45))
                }.position(x:350, y:580)
                
            }
            
            
            Group{
                
                HStack{
                    ZStack{
                        Circle()
                            .fill(.red)
                            .background(Circle().fill(.red))
                            .font(.system(size: 18))
                            .frame(width: 33, height: 40)
                        
                        Circle()
                            .fill(.red)
                            .frame(width: isVisible ? 60: 33)
                            .opacity(isVisible ? 0 : 1)
                            .animation(.easeInOut(duration: 1).repeatForever(autoreverses: false), value: isVisible)
                    }.onAppear {
                        DispatchQueue.main.async {
                            withAnimation(.spring().repeatForever(autoreverses: true)) {
                                isVisible.toggle()
                            }
                        }
                    }
                }.position(x:210, y:250)
                
                HStack{
                    ZStack{
                        Circle()
                            .fill(.red)
                            .background(Circle().fill(.red))
                            .font(.system(size: 18))
                            .frame(width: 33, height: 40)
                        
                        Circle()
                            .fill(.red)
                            .frame(width: isVisible ? 60: 33)
                            .opacity(isVisible ? 0 : 1)
                            .animation(.easeInOut(duration: 1).repeatForever(autoreverses: false), value: isVisible)
                    }
                }.position(x:250, y:164)
                
                HStack{
                    ZStack{
                        Circle()
                            .fill(.red)
                            .background(Circle().fill(.red))
                            .font(.system(size: 18))
                            .frame(width: 33, height: 40)
                        
                        Circle()
                            .fill(.red)
                            .frame(width: isVisible ? 60: 33)
                            .opacity(isVisible ? 0 : 1)
                            .animation(.easeInOut(duration: 1).repeatForever(autoreverses: false), value: isVisible)
                    }
                }.position(x:220, y:390)
                
                
                HStack{
                    ZStack{
                        Circle()
                            .fill(.red)
                            .background(Circle().fill(.red))
                            .font(.system(size: 18))
                            .frame(width: 33, height: 40)
                        
                        Circle()
                            .fill(.red)
                            .frame(width: isVisible ? 60: 33)
                            .opacity(isVisible ? 0 : 1)
                            .animation(.easeInOut(duration: 1).repeatForever(autoreverses: false), value: isVisible)
                    }
                }.position(x:310, y:615)
                
                
                HStack{
                    ZStack{
                        Circle()
                            .fill(.red)
                            .background(Circle().fill(.red))
                            .font(.system(size: 18))
                            .frame(width: 33, height: 40)
                        
                        Circle()
                            .fill(.red)
                            .frame(width: isVisible ? 60: 33)
                            .opacity(isVisible ? 0 : 1)
                            .animation(.easeInOut(duration: 1).repeatForever(autoreverses: false), value: isVisible)
                    }
                }.position(x:350, y:240)
                
                
            }
            
        }
    }
}

struct FlipView_Previews: PreviewProvider {
    static var previews: some View {
        FlipView()
    }
}

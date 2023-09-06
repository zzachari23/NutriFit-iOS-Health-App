//
//  ContentView.swift
//  Body
//
//  Created by Family on 10/13/22.
//

import SwiftUI
import AVFoundation



struct BodyView: View {
    
    let colorHex = Color(hex: "f5f8fb")
    
    @State private var buttonState = false
    
    @State private var isVisible: Bool = false
    

    
    
    var body: some View {
        
    
            ZStack {
                
                colorHex.ignoresSafeArea()
                
                
                
                VStack{
                    Image("body Medium")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 500)
                        .offset(x:-10, y: 20)
                }
                
                
                HStack{
                    
                    Text("©MuscleWiki")
                        .bold()
                        .font(.system(size: 15))
                        .foregroundColor(.black)
                    
                }.position(x:252, y:720)
                
                
                
                HStack{
                    NavigationLink(destination: GoogleGymView() .navigationBarBackButtonHidden(true)
                    ){
                        Text("GYMS")
                            .bold()
                            .foregroundColor(.black)
                            .frame(width: 100, height: 50)
                            .background(Color.gray)
                            .cornerRadius(20)
                            .font(.system(size: 20))
                    }
                }.position(x:120,y:63).simultaneousGesture(TapGesture().onEnded{
                        AudioServicesPlaySystemSound(1104)
                    })
                
                
                
                HStack{
                    NavigationLink(destination: FlipView() .navigationBarBackButtonHidden(true)
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
                }.position(x:375,y:65)
                
                
                
                HStack{
                    NavigationLink(destination: HomeView().navigationBarBackButtonHidden(true)
                    ){
                        
                        Text("MENU")
                            .bold()
                            .foregroundColor(.black)
                            .frame(width: 100, height: 50)
                            .background(Color.red)
                            .cornerRadius(20)
                            .font(.system(size: 20))
                         
                    }.simultaneousGesture(TapGesture().onEnded{
                        AudioServicesPlaySystemSound(1104)
                    })
                }.position(x:120,y:9)
                
                
                Group{
                    
                    HStack{
                        Text("Bicep")
                            .bold()
                            .foregroundColor(.black)
                            .font(.system(size: 20))
                    }.position(x:85,y:165)
                    
                    HStack{
                        Rectangle()
                            .fill(.black)
                            .frame(width: 3, height: 67)
                            .rotationEffect(Angle(degrees: -45))
                        
                    }.position(x:110, y:200)
                    
                    
                    HStack{
                        Text("Chest")
                            .bold()
                            .foregroundColor(.black)
                            .font(.system(size: 20))
                    }.position(x:140,y:120)
                    
                    HStack{
                        Rectangle()
                            .fill(.black)
                            .frame(width: 3, height: 75)
                            .rotationEffect(Angle(degrees: -45))
                    }.position(x:179, y:160)
                    
                    
                    
                    HStack{
                        Text("Shoulder")
                            .bold()
                            .foregroundColor(.black)
                            .font(.system(size: 20))
                    }.position(x:400,y:120)
                    
                    HStack{
                        Rectangle()
                            .fill(.black)
                            .frame(width: 3, height: 60)
                            .rotationEffect(Angle(degrees: 45))
                    }.position(x:371, y:157)
                    
                    
                    HStack{
                        Text("Abs")
                            .bold()
                            .foregroundColor(.black)
                            .font(.system(size: 20))
                    }.position(x:333,y:348)
                    
                    HStack{
                        Rectangle()
                            .fill(.black)
                            .frame(width: 3, height: 70)
                            .rotationEffect(Angle(degrees: -45))
                    }.position(x:290, y:310)
                    
                    
                    HStack{
                        Text("Quads")
                            .bold()
                            .foregroundColor(.black)
                            .font(.system(size: 20))
                    }.position(x:400,y:450)
                    
                    HStack{
                        Rectangle()
                            .fill(.black)
                            .frame(width: 3, height: 45)
                            .rotationEffect(Angle(degrees: 90))
                    }.position(x:340, y:450)
                    
                }
                
                
                
                
                
                Group{
                    
                    VStack{
                        NavigationLink(destination: ChestView(backbutt: $buttonState)
                            .navigationBarBackButtonHidden(buttonState)
                        ){
                            ZStack{
                                
                                Circle()
                                    .fill(.red)
                                    .frame(height: isVisible ? 60: 33)
                                    .opacity(isVisible ? 0 : 1)
                                    .animation(.easeInOut(duration: 1).repeatForever(autoreverses: false), value: isVisible)
                                    .onAppear {
                                        DispatchQueue.main.async {
                                                isVisible.toggle()
                                        }
                                    }
                                    .onDisappear {
                                        DispatchQueue.main.async {
                                                isVisible.toggle()
                                        }
                                    }
                                
                                Circle()
                                    .fill(.red)
                                    .background(Circle().fill(.red))
                                    .font(.system(size: 18))
                                    .frame(width: 33, height: 40)
                                
                              
                            }
                        }
                        .simultaneousGesture(TapGesture().onEnded{
                            AudioServicesPlaySystemSound(1104)
                        })
                    }.position(x:220, y:200)
                    

                
                    HStack{
                        NavigationLink(destination: BlankView()
                        ){
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
                          
                        }
                        .simultaneousGesture(TapGesture().onEnded{
                            AudioServicesPlaySystemSound(1104)
                        })
                    }.position(x:250, y:275)
                    
                    
                    HStack{
                        NavigationLink(destination: BlankView()
                        ){
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
                        }
                        .simultaneousGesture(TapGesture().onEnded{
                            AudioServicesPlaySystemSound(1104)
                        })
                    }.position(x:151, y:240)
                    
                    
                    HStack{
                        NavigationLink(destination: BlankView()
                        ){
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
                        }
                        .simultaneousGesture(TapGesture().onEnded{
                            AudioServicesPlaySystemSound(1104)
                        })
                    }.position(x:300, y:450)
                    
                    
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
                    }.position(x:335,y:190).simultaneousGesture(TapGesture().onEnded{
                        AudioServicesPlaySystemSound(1104)
                    })
                    
                }
                
            
                
            }
        
    }
    
    
    
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BodyView()
    }
}

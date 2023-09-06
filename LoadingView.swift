//
//  LoadingView.swift
//  Body
//
//  Created by Family on 10/22/22.
//

import SwiftUI
import AVKit







struct LoadingView: View {
    
    @State private var showMainView = false
    @State private var rotate2D = false
    @State private var opacity = 0.0
    @State var audioPlayer: AVAudioPlayer!

    var body: some View {
        
        Group{
            if showMainView {
                HomeView()
            }
            else{
                
                ZStack{
                    VStack(spacing: 10){
                        
                        
                        HStack(spacing: -14){
                            
                            Image("nutri")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100)
                            Image("fit")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 60)
                                .offset(y:-2)
                            
                        }.offset(x:-4).opacity(opacity)
                            
                        
        
                        Text("©Group14")
                            .font(.system(size: 15))
                            .foregroundColor(.black)
                            .offset(y:350)
                            .opacity(opacity)
                        
                        
                        
                        Image(systemName: "dumbbell.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: rotate2D ? 50 : 500)
                            .foregroundColor(.gray)
                            .rotationEffect(.degrees(rotate2D ? -360 : 0))
                            .animation(.easeInOut(duration: 10).delay(0.99), value: rotate2D)
                    }
                    
                }
                
                .onAppear{
                    let sound = Bundle.main.path(forResource: "piano", ofType: "mp3")
                    self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                    self.audioPlayer.play()
                    
                    withAnimation(.none){
                        self.rotate2D.toggle()
                     
                    }
                    
                    withAnimation(Animation.default.delay(11)){
                        opacity = 1
                        
                  
                    }
                    
                    
                    withAnimation(Animation.default.delay(18)){
                        showMainView = true
                    }
                    
                }
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}

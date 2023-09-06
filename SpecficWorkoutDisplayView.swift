//
//  DisplayView.swift
//  Body
//
//  Created by Family on 10/14/22.
//

import SwiftUI
import AVFoundation
import AVKit

struct SpecficWorkoutDisplayView: View {
    
    var exercise: ExerciseProperties
    var body: some View {

        ZStack{
            Color.black.ignoresSafeArea()
            ScrollView{
         
                VStack(){
                    Link(destination: exercise.url, label: {
                        Image(exercise.image)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                            .cornerRadius(10)
                            .padding(.vertical, 20)
                        
                    }).simultaneousGesture(TapGesture().onEnded{
                        AudioServicesPlaySystemSound(1104)
                    })
                }
                

                VStack{
                    HStack{
                        Text("Difficulty:   ")
                            .bold()
                            .font(.system(size: 22))
                            .foregroundColor(.red)
                            .offset(x:-61)
                        Text(exercise.difficulty)
                            .font(.system(size: 22))
                            .foregroundColor(.gray)
                            .offset(x:-75)
                    }
                    
                    
                }
                
                VStack{
                    HStack{
                        Text("Time:   ")
                            .bold()
                            .font(.system(size: 22))
                            .foregroundColor(.red)
                            .offset(x:-50)
                        Text(exercise.time)
                            .font(.system(size: 22))
                            .foregroundColor(.gray)
                            .offset(x:-65)
                    }
                }.offset(x:-26)
                
                
                
                VStack(spacing: 5){
                    Text("Workout Plan")
                        .bold()
                        .font(.system(size: 30))
                        .foregroundColor(.red)
                    Text(exercise.plan)
                        .font(.system(size: 20))
                        .foregroundColor(.gray)
                }.offset(y:30)
                    
                    VStack{
                        VideoPlayer(player: exercise.video)
                            .frame(height: 400)
                            .onAppear{exercise.video.play()}
                    }.offset(y:22)
                
                VStack{
                    ForEach(exercise.nums, id: \.self)
                    { item in
                        Text(item)
                            .background(
                                Circle()
                                    .strokeBorder(.black, lineWidth: 3)
                                    .background(Circle().fill(.red))
                                    .frame(width: 33, height: 40)
                            )
                        
                    }.padding(5)
                }.offset(x:-180,y:21)
                
                VStack{
                    
                    Text(exercise.instructions)
                        .foregroundColor(Color.white)
                        .font(.system(size: 13))
                        .bold()
                    
                }.offset(y:-124)
                
                VStack{
                    
                    Text("©MuscleWiki")
                        .bold()
                        .font(.system(size: 12))
                        .foregroundColor(.white)
                    
                }.offset(y:-130)
                
                VStack{
                    
                    Link(destination: exercise.url, label: {
                        Text("Watch Now")
                            .bold()
                            .foregroundColor(.white)
                            .frame(width: 300, height: 50)
                            .background(Color.red)
                            .cornerRadius(20)
                            .font(.system(size: 20))
                        
                    }).simultaneousGesture(TapGesture().onEnded{
                        AudioServicesPlaySystemSound(1104)
                    })
                    
                    
                }.offset(y:-70)
               
                
               
                    
               
                    
                
            }.foregroundColor(.black)
            
            
        }
        
        
        
    }
}

struct DisplayView_Previews: PreviewProvider {
    static var previews: some View {
        SpecficWorkoutDisplayView(exercise: ExerciseList.chestExercises.first!)
    }
}

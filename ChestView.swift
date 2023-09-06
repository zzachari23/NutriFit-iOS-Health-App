//
//  ChestView.swift
//  Body
//
//  Created by Family on 10/13/22.
//

import SwiftUI
import AVFoundation




struct ChestView: View {
    

    var exerciseArray: [ExerciseProperties] = ExerciseList.chestExercises
    @Binding var backbutt: Bool
    @State var searchTerm = ""
    @State private var isSideBarOpened: Bool = false
    
    
   var searchResults: [ExerciseProperties] {
       if searchTerm.isEmpty {
           return exerciseArray
      } else {
          return exerciseArray.filter {
              exercise in
              exercise.title.contains(searchTerm) || exercise.difficulty.contains(searchTerm) ||
              exercise.time.contains(searchTerm) || exercise.type.contains(searchTerm) ||
              exercise.equipment.contains(searchTerm)

        }
      }
    }
    
  
    var body: some View {
        ZStack{
            NavigationView{
                ZStack{
                    List(searchResults, id: \.id) { item in
                        
                        NavigationLink(destination: SpecficWorkoutDisplayView(exercise: item).navigationBarBackButtonHidden(false), label: {
                            
                            Image(item.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 70)
                                .cornerRadius(4)
                                .padding(.vertical, 20)
                            
                            VStack(alignment: .leading){
                                Text(item.title)
                                    .bold()
                                    .scaledToFit()
                                    .minimumScaleFactor(0.5)
                                
                                Text(item.difficulty)
                                    .bold()
                                    .font(.system(size: 15))
                                    .scaledToFit()
                                    .minimumScaleFactor(0.5)
                                    .foregroundColor(.red)
                                
                                Text(item.time)
                                    .bold()
                                    .font(.system(size: 10))
                                    .scaledToFit()
                                    .minimumScaleFactor(0.5)
                                    .foregroundColor(.gray)
                                
                                Text(item.type)
                                    .bold()
                                    .font(.system(size: 10))
                                    .scaledToFit()
                                    .minimumScaleFactor(0.5)
                                    .foregroundColor(.gray)
                            }
                    
                        })
                      
                    }
                    .toolbar {
                        Button {
                             AudioServicesPlaySystemSound(1104)
                            isSideBarOpened.toggle()
                            backbutt.toggle()
                        } label: {
                            Label("Toggle SideBar",
                                  systemImage: "line.3.horizontal.circle.fill")
                            .foregroundColor(.red)
                        }
                    }
                
                    
                }
               
                .navigationTitle("Chest Workouts")
                
                       
            }
            .searchable(text: $searchTerm)
            
            Sidebar(backbutton: $backbutt, isSidebarVisible: $isSideBarOpened, barsearchTerm: $searchTerm)
                .opacity(isSideBarOpened ? 1 : 0)
            
        }
    }
}


struct ChestView_Previews: PreviewProvider {
    static var previews: some View {
        ChestView(backbutt: Binding.constant(true))
    }
}

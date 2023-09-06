//
//  FoodView.swift
//  Body
//
//  Created by Family on 10/16/22.
//

import SwiftUI
import AVFoundation



struct FoodGroupsView: View {

    var color = Color(hex: "99FF99")
    var foodArray: [FoodProperties] = FoodList.foods
    @Binding var bac: Bool
    @State private var isSideBarOpened: Bool = false
    var count:Int = 0
    @State var searchTerm = ""
    
   var searchResults: [FoodProperties] {
       if searchTerm.isEmpty {
           return foodArray
      } else {
          return foodArray.filter {
              food in
              food.foodItem?.macrotype.contains(searchTerm) ?? false }
      }
    }

    
    
    
    var body: some View {
        ZStack{
    
            NavigationView{
          
                ZStack{
                    List(searchResults, id: \.id){ item in
                        NavigationLink(destination: CategoryFoodDisplayView(item: item).navigationBarBackButtonHidden(false), label: {
                            
                
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .scaledToFill()
                                    .frame(height: 240)
                                    .foregroundColor(item.typeColor)
                                
                                Image(item.image)
                                    .resizable()
                                    .frame(height: 200)
                                    .offset(y:-20)
                                
                                Text(item.title)
                                    .offset(y:100)
                                    .bold()
                            }
                            .cornerRadius(20)
                   
            
                        })
                        .listRowSeparator(.hidden)
                       
            

                        
                    }
                 
                
                    
                    
                    
                    .toolbar {
                        Button {
                            AudioServicesPlaySystemSound(1104)
                            isSideBarOpened.toggle()
                            bac.toggle()
                        } label: {
                            Label("Toggle SideBar",
                                  systemImage: "line.3.horizontal.circle.fill")
                            .foregroundColor(.green)
                        }
                    }
                    
                    
                    
                
                   
                }
                .listStyle(.inset)
                .navigationTitle("Food")
                .navigationBarTitleDisplayMode(.inline)
            
             
             
            }
            
            
            
            
                FoodSidebar(backBut: $bac, isSidebarVisible: $isSideBarOpened, barsearchTerm: $searchTerm)
                    .opacity(isSideBarOpened ? 1 : 0)
                
            
            HStack{
                NavigationLink(destination: HomeView().navigationBarBackButtonHidden(true)
                ){
                    
                    Text("MENU")
                        .bold()
                        .foregroundColor(.black)
                        .frame(width: 60, height: 25)
                        .background(Color.red)
                        .cornerRadius(20)
                        .font(.system(size: 15))
                     
                }.simultaneousGesture(TapGesture().onEnded{
                    AudioServicesPlaySystemSound(1104)
                })
            }.position(x:300,y:17).opacity(isSideBarOpened ? 0 : 1)
          
            
            
        }
       
      
    }
      
}
struct FoodView_Previews: PreviewProvider {
    static var previews: some View {
        FoodGroupsView(bac: Binding.constant(false))
    }
}



/*
Circle()
    .strokeBorder(.black, lineWidth: 3)
    .background(
        Image(item.image)
            .resizable()
            .frame(height: 100)
            .cornerRadius(200)
    )
    .font(.system(size: 18))
    .frame(width: 100, height: 300)
    .padding(.vertical, -95)

Text(item.title)
    .bold()
    .font(.system(size: 20))
    .padding(.horizontal, 6)
*/

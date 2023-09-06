//
//  FoodDisplayView.swift
//  Body
//
//  Created by Family on 10/18/22.
//

import SwiftUI

struct CategoryFoodDisplayView: View {
    var item: FoodProperties
    var color: Color = Color(hex: "FFFFCC")
    var body: some View {
    
    
        ZStack{
            color.ignoresSafeArea()
            VStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 40)
                        //.scaledToFill()
                        .frame(width:380, height: 300)
                        .foregroundColor(item.typeColor)
                        .offset(y:50)
                    Image(item.image)
                        .cornerRadius(40)
                        .offset(y:50)

                    Text(item.title)
                        .bold()
                        .font(.system(size: 30))
                        .offset(y:185)
                }
            
             
            }.frame(height: 700).offset(y:-260)
            
            
            VStack(alignment: .leading, spacing: 35){
                Group{
                    //Text("Macro type: ") + Text(item.foodItem?.macrotype ?? "").font(.system(size: 20))
                    
                    Text("Serving size:  ") + Text(item.foodItem?.serving_size ?? "").font(.custom(
                        "Chalkduster",
                        fixedSize: 20))
                    
                    Text("Calories:  ") +  Text(item.foodItem?.calories ?? "").font(.custom(
                        "Chalkduster",
                        fixedSize: 20))
                    
                    Text("Fat:  ") + Text(item.foodItem?.fat ?? "").font(.custom(
                        "Chalkduster",
                        fixedSize: 20))
                    
                    Text("Carbohydrates:  ") + Text(item.foodItem?.carbs ?? "").font(.custom(
                        "Chalkduster",
                        fixedSize: 20))
                
                    Text("")
                   
                }.bold().font(.system(size: 25))
                

                VStack{
                    Text("Protein:  ").bold().font(.system(size: 25)) + Text(item.foodItem?.protein ?? "").font(.custom(
                        "Chalkduster",
                        fixedSize: 20))
                }
                .offset(y:-50)
                
            }.offset(x:-20, y:160)
            
            
            VStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 40)
                        .frame(width:300, height: 100)
                        .foregroundColor(item.typeColor)
                    Text(item.foodItem?.macrotype ?? "")
                        .bold()
                        .font(.system(size: 30))
                        .offset(y:-30)
                        
                }
            }.offset(y:390)
            
        }
        
        
        
    }
}

struct FoodDisplayView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryFoodDisplayView(item:  FoodProperties(
            image: "",
            title: "",
            typeColor: Color.green,
            foodItem: nil
        ))
    }
}





























/*
color.ignoresSafeArea()
    ScrollView{
        VStack{
            Text("Proteins")
                .bold()
                .font(.system(size: 35))
                .underline()
            
        }.padding()
            ForEach(foodArray, id: \.id){ item in
                NavigationLink(destination: SpecificFoodItemDisplay().navigationBarBackButtonHidden(false),
                    label: {
                    VStack{
                        Circle()
                            .strokeBorder(.black, lineWidth: 3)
                            .background(
                                Image(item.image)
                                    .resizable()
                                    .frame(height: 249)
                                    .cornerRadius(200)
                            )
                            .font(.system(size: 18))
                            .frame(width: 250, height: 300)
                            .padding(.vertical, -15)
                        
                        Text(item.title)
                            .bold()
                            .foregroundColor(.black)
                            .font(.system(size: 25))
                            
                    }
                })
            }
    }
*/

//
//  FoodSideBar.swift
//  NutriFit
//
//  Created by Family on 11/30/22.
//

import SwiftUI
import AVFoundation

enum FoodType {
    case protein, carbs, fruits, veg, nothing, flexitarian, vegetarian, vegan, keto, highP, lowP, highC,lowC, highF, lowF, A, C, D, E, K, B, chinese, indian, italian, spanish, greek, american
        
    
    var cat: String  {
        switch self {
        case .protein: return "Protein"
        case .carbs: return "Carbohydrate"
        case .fruits: return "Fruits"
        case .veg: return "Vegetables"
        case .flexitarian: return "Flexitarian"
        case .vegetarian: return "Vegetarian"
        case .vegan: return "Vegan"
        case .keto: return "Keto"
        case .highP: return "High Protein"
        case .lowP: return "Low Protein"
        case .highC: return "High Carbs"
        case .lowC: return "Low Carbs"
        case .highF: return "High Fats"
        case .lowF: return "Low Fats"
        case .B: return "Vitamin B"
        case .A: return "Vitamin A"
        case .C: return "Vitamin C"
        case .D: return "Vitamin D"
        case .E: return "Vitamin E"
        case .K: return "Vitamin K"
        case .chinese: return "Chinese"
        case .indian: return "Indian"
        case .italian: return "Italian"
        case .spanish: return "Spanish"
        case .greek: return "Greek"
        case .american: return "American"
        case .nothing: return "Nothing"
        }
    }
}

struct FoodSidebar: View {
    
    @Binding var backBut: Bool
    @Binding var isSidebarVisible: Bool
    @Binding var barsearchTerm: String
    @State private var slider: Double = 0.0
    @State var moveAlongCircle: Bool = false
    @State var moveAlongCircle1: Bool = false
    @State var moveAlongCircle2: Bool = false
    @State var moveAlongCircle3: Bool = false
    @State var moveAlongCircle4: Bool = false
    @State var moveAlongCircle5: Bool = false
    @State private var isSF: Bool = false
    @State private var isSF2: Bool = false
    @State private var isSF3: Bool = false
    @State private var isSF4: Bool = false
    @State private var isSF5: Bool = false
    let colorHex = Color(hex: "ff5e00")

    
    var sideBarWidth = UIScreen.main.bounds.size.width * 0.669
    var bgColor: Color =  Color(.init(
        red: 52 / 255,
        green: 70 / 255,
        blue: 182 / 255,
        alpha: 1))
    
    
    var body: some View {
        
        ZStack {
            GeometryReader { _ in
                EmptyView()
            }
            .background(.black.opacity(0.6))
            .opacity(isSidebarVisible ? 1 : 0)
            .animation(.easeInOut.delay(0.2), value: isSidebarVisible)
            .onTapGesture {
                isSidebarVisible.toggle()
                backBut.toggle()
            }
            
            HStack(alignment: .top) {
                ZStack(alignment: .top) {
                    Color.white
                    
                    
                    
                    VStack{
                        Button(action: {
                            barsearchTerm = ""
                            AudioServicesPlaySystemSound(1104)
                        }
                        ){
                            VStack{
                                Text("Reset")
                                    .bold()
                                    .foregroundColor(.black)
                                    .frame(width: 60, height: 25)
                                    .background(Color.red)
                                    .cornerRadius(20)
                                    .font(.system(size: 15))
                            }
                        }
                    }.position(x:48, y:52)
                    
                   
                    
                    Group{
                        
                        VStack{
                            fooddropdown(isSFVisible: isSF, searchTerm: $barsearchTerm)
                        }
                        .position(x:190,y:206)
                        
                        VStack{
                            fooddropdown2(isSFVisible: isSF2, isSFVisible2: isSF, searchTerm: $barsearchTerm)
                        }
                        .position(x:190, y: 500)
                        
                        VStack{
                            fooddropdown3(isSFVisible: isSF3, isSFVisible2: isSF, isSFVisible3: isSF2)
                        }
                        .position(x:190, y: 508)
                        
                        
                        VStack{
                            fooddropdown4(isSFVisible: isSF4, isSFVisible2: isSF, isSFVisible3: isSF2)
                        }
                        .position(x:190, y: 540)
                        
                        VStack{
                            fooddropdown5(isSFVisible: isSF5, isSFVisible2: isSF, isSFVisible3: isSF2)
                        }
                        .position(x:190, y: 560)
                    }
                    
                   
                    HStack{
                        Text("Filter")
                            .font(.custom(
                                    "AmericanTypewriter",
                                    fixedSize: 36))
                            .foregroundColor(colorHex)
                    }.offset(y:60)
                    
                    
          
                        
                        HStack {
                            Button(action:{
                                moveAlongCircle.toggle()
                                moveAlongCircle1.toggle()
                                isSF.toggle()
                                AudioServicesPlaySystemSound(1104)
                            }){
                                HStack{
                                    Image(systemName: "triangle.righthalf.filled")
                                        .foregroundColor(.green)
                                }
                                .rotationEffect(.degrees(moveAlongCircle1 ? 180 : 90))
                                .animation(.easeInOut(duration: 1), value: moveAlongCircle)
                            }
                            
                            
                            
                            Text("Food Groups")
                                .bold()
        
                        }
                        .padding(.top, 100)
                        .padding(.horizontal, 20)
                        .position(x:84, y:71)
                        
                        
                        
                        HStack {
                            Button(action:{
                                moveAlongCircle.toggle()
                                moveAlongCircle2.toggle()
                                isSF2.toggle()
                                AudioServicesPlaySystemSound(1104)
                            }){
                                HStack{
                                    Image(systemName: "triangle.righthalf.filled")
                                        .foregroundColor(.green)
                                }
                                .rotationEffect(.degrees(moveAlongCircle2 ? 180 : 90))
                                .animation(.easeInOut(duration: 1), value: moveAlongCircle)
                            }
                            
                            Text("Diet Type")
                                .bold()
                                .animation(.easeInOut(duration: 1), value: moveAlongCircle)
                            
                            
                        }
                        .position(x:72, y:145)
                        .offset(y: isSF ? 124 : (isSF2 ? 0 : 0))
                        .animation(.default, value: moveAlongCircle)
                        
                        
                        HStack {
                            Button(action:{
                                moveAlongCircle.toggle()
                                moveAlongCircle3.toggle()
                                isSF3.toggle()
                                AudioServicesPlaySystemSound(1104)
                            }){
                                HStack{
                                    Image(systemName: "triangle.righthalf.filled")
                                        .foregroundColor(.green)
                                }
                                .rotationEffect(.degrees(moveAlongCircle3 ? 180 : 90))
                                .animation(.easeInOut(duration: 1), value: moveAlongCircle)
                                
                                
                            }
                            
                            Text("Macro Levels")
                                .bold()
                                .animation(.easeInOut(duration: 1), value: moveAlongCircle)
                            
                            
                        }
                        .position(x:87, y:175)
                        .offset(y: isSF ? (isSF2 ? 220 : 124): (isSF2 ? 110 : 0))
                        .animation(.default, value: moveAlongCircle)
                        
                        
                        
                        
                        
                        HStack {
                            Button(action:{
                                moveAlongCircle.toggle()
                                moveAlongCircle4.toggle()
                                isSF4.toggle()
                                AudioServicesPlaySystemSound(1104)
                            }){
                                HStack{
                                    Image(systemName: "triangle.righthalf.filled")
                                        .foregroundColor(.green)
                                }
                                .rotationEffect(.degrees(moveAlongCircle4 ? 180 : 90))
                                .animation(.easeInOut(duration: 1), value: moveAlongCircle)
                                
                                
                            }
                            
                            Text("Recipe Cuisine")
                                .bold()
                                .animation(.easeInOut(duration: 1), value: moveAlongCircle)
                            
                            
                        }
                        .position(x:94, y:205)
                        .offset(y: isSF ? (isSF2 ? 220 : 124): (isSF2 ? 110 : (isSF3 ? 165 : 0)))
                        .animation(.default, value: moveAlongCircle)
                        
                        
                        HStack {
                            Button(action:{
                                moveAlongCircle.toggle()
                                moveAlongCircle5.toggle()
                                isSF5.toggle()
                                AudioServicesPlaySystemSound(1104)
                            }){
                                HStack{
                                    Image(systemName: "triangle.righthalf.filled")
                                        .foregroundColor(.green)
                                }
                                .rotationEffect(.degrees(moveAlongCircle5 ? 180 : 90))
                                .animation(.easeInOut(duration: 1), value: moveAlongCircle)
                                
                                
                            }
                            
                            Text("Vitamins")
                                .bold()
                                .animation(.easeInOut(duration: 1), value: moveAlongCircle)
                            
                            
                        }
                        .position(x:72, y:235)
                        .offset(y: isSF ? (isSF2 ? 220 : 124): (isSF2 ? 110 : (isSF3 ? 165 : (isSF4 ? 160 : 0))))
                        .animation(.default, value: moveAlongCircle)
                        
                        
                    
                    
                    
                    
                    
                }
                .frame(width: sideBarWidth)
                .offset(x: isSidebarVisible ? 0 : -sideBarWidth)
                .animation(.default, value: isSidebarVisible)
                
                
                Spacer()
            }
            
            
            
            
            
            
            
            
            
            
            
            /*
            VStack {
                Slider(value: $slider, in: 0...30, onEditingChanged: {_ in
                    barsearchTerm = String(Int(slider))
                })
                       .frame(width: 130)
                       .accentColor(.red)
                       .animation(.easeIn(duration: 1.0), value: moveAlongCircle)
                        Text("Cost:" + " \(Int(slider))" + "$")
                          .bold()
                       .animation(.easeInOut(duration: 1), value: moveAlongCircle)
                    
            }.offset(x:-110, y: isSF ? (isSF2 ? (isSF3 ? 220 : 20) : -80) : (isSF2 ? -95: (isSF3 ? -20 : -200 )))
             .animation(.default, value: moveAlongCircle)
             .simultaneousGesture(TapGesture().onEnded{
                 AudioServicesPlaySystemSound(1104)
             })
            */
       
            
        }
        .edgesIgnoringSafeArea(.all)
        
    }
}


struct fooddropdown: View {
    
    
    var isSFVisible: Bool
    let difList: [FoodType] = [.protein, .carbs, .fruits, .veg]
    @Binding var searchTerm: String
    @State var selectedType: FoodType = FoodType.nothing


    var body: some View {
        ZStack{
         VStack{
             ForEach(difList, id: \.self)
             { item in
        
             Button(action:{
                 
                 selectedType = item
                 searchTerm = item.cat
                 AudioServicesPlaySystemSound(1104)
    
             }){
                 HStack{
                             selectedType == item ?
                             Image(systemName: "checkmark.circle.fill")
                                 .bold()
                                 .frame(height: 21)
                                 .foregroundColor(.green)
                             : Image(systemName: "circle")
                                 .bold()
                                 .frame(height: 21)
                                 .foregroundColor(.black)
                    
                      
                     Text(item.cat)
                         .foregroundColor(.black)
                     
                     Spacer()
                 }.offset(x:70)
             }
             
             }.padding(-2)
             }.position(x:14,y:50)
        }
        .frame(width: 150, height:100)
        .position(x:130,y:415)
        .offset(x:-24,y: isSFVisible ? 0 : -15)
        .animation(.easeIn(duration: 1.0), value: isSFVisible)
        .opacity(isSFVisible ? 1:0)
        .animation(.easeOut(duration: 1.0), value: isSFVisible)
    }
}



struct fooddropdown2: View {
    

    var isSFVisible: Bool
    var isSFVisible2: Bool
    @Binding var searchTerm: String
    let difList: [FoodType] = [.flexitarian, .vegetarian, .vegan, .keto]
    @State var selectedType: FoodType = FoodType.nothing

    var body: some View {
        ZStack{
        
        
            VStack{
                ForEach(difList, id: \.self)
                { item in
           
                Button(action:{
                    
                    selectedType = item
                    searchTerm = item.cat
                    AudioServicesPlaySystemSound(1104)
       
                }){
                    HStack{
                        selectedType == item ?
                        Image(systemName: "checkmark.circle.fill")
                            .bold()
                            .frame(height: 21)
                            .foregroundColor(.green)
                        : Image(systemName: "circle")
                            .bold()
                            .frame(height: 21)
                            .foregroundColor(.black)
               
                 
                Text(item.cat)
                    .foregroundColor(.black)
                        
                        Spacer()
                    }.offset(x:70)
                }
                
                }.padding(-2)
                }.position(x:14,y:40)
        }
        .frame(width: 155, height:80)
        .position(x:130,y: isSFVisible ? (isSFVisible2 ? 250 : 140) : (isSFVisible2 ? 250 : 140))
        .offset(x:-24,y: isSFVisible ? 0 : -15)
        .animation(.easeIn(duration: 1.0), value: isSFVisible)
        .animation(.easeIn(duration: 1.0), value: isSFVisible2)
        .opacity(isSFVisible ? 1:0)
        .animation(.easeOut(duration: 1.0), value: isSFVisible)
        .animation(.easeOut(duration: 1.0), value: isSFVisible2)
    }
}





struct fooddropdown3: View {
    
    var isSFVisible: Bool
    var isSFVisible2: Bool
    var isSFVisible3: Bool
    let difList: [FoodType] = [.highP, .lowP, .highC, .lowC, .highF, .lowF]
    @State var selectedType: FoodType = FoodType.nothing


    var body: some View {
        ZStack{
        
            VStack{
                ForEach(difList, id: \.self)
                { item in
           
                Button(action:{
                    
                    selectedType = item
                    AudioServicesPlaySystemSound(1104)
       
                }){
                    HStack{
                        
                        selectedType == item ?
                        Image(systemName: "checkmark.circle.fill")
                            .bold()
                            .frame(height: 21)
                            .foregroundColor(.green)
                        : Image(systemName: "circle")
                            .bold()
                            .frame(height: 21)
                            .foregroundColor(.black)
               
                         
                        Text(item.cat)
                            .foregroundColor(.black)
                        
                        Spacer()
                    }.offset(x:70)
                }
                
                }.padding(-2)
                }.position(x:14,y:90)
        }
        .frame(width: 155, height:180)
        .position(x:130,y: isSFVisible ? (isSFVisible2 ? 410 : 190) : (isSFVisible2 ? 410 : 140))
        .offset(x:-24,y: isSFVisible ? 0 : -15)
        .animation(.easeIn(duration: 1.0), value: isSFVisible)
        .animation(.easeIn(duration: 1.0), value: isSFVisible2)
        .opacity(isSFVisible ? 1:0)
        .animation(.easeOut(duration: 1.0), value: isSFVisible)
        .animation(.easeOut(duration: 1.0), value: isSFVisible2)
    }
}




struct fooddropdown4: View {
    
    var isSFVisible: Bool
    var isSFVisible2: Bool
    var isSFVisible3: Bool
    let difList: [FoodType] = [.chinese, .indian, .italian, .spanish, .greek, .american]
    @State var selectedType: FoodType = FoodType.nothing


    var body: some View {
        ZStack{
        
            VStack{
                ForEach(difList, id: \.self)
                { item in
           
                Button(action:{
                    
                    selectedType = item
                    AudioServicesPlaySystemSound(1104)
       
                }){
                    HStack{
                        
                        selectedType == item ?
                        Image(systemName: "checkmark.circle.fill")
                            .bold()
                            .frame(height: 21)
                            .foregroundColor(.green)
                        : Image(systemName: "circle")
                            .bold()
                            .frame(height: 21)
                            .foregroundColor(.black)
               
                         
                        Text(item.cat)
                            .foregroundColor(.black)
                        
                        Spacer()
                    }.offset(x:70)
                }
                
                }.padding(-2)
                }.position(x:14,y:90)
        }
        .frame(width: 155, height:180)
        .position(x:130,y: isSFVisible ? (isSFVisible2 ? 410 : 190) : (isSFVisible2 ? 410 : 140))
        .offset(x:-24,y: isSFVisible ? 0 : -15)
        .animation(.easeIn(duration: 1.0), value: isSFVisible)
        .animation(.easeIn(duration: 1.0), value: isSFVisible2)
        .opacity(isSFVisible ? 1:0)
        .animation(.easeOut(duration: 1.0), value: isSFVisible)
        .animation(.easeOut(duration: 1.0), value: isSFVisible2)
    }
}




struct fooddropdown5: View {
    
    var isSFVisible: Bool
    var isSFVisible2: Bool
    var isSFVisible3: Bool
    let difList: [FoodType] = [.A, .C, .D, .E, .K, .B]
    @State var selectedType: FoodType = FoodType.nothing


    var body: some View {
        ZStack{
        
            VStack{
                ForEach(difList, id: \.self)
                { item in
           
                Button(action:{
                    
                    selectedType = item
                    AudioServicesPlaySystemSound(1104)
       
                }){
                    HStack{
                        
                        selectedType == item ?
                        Image(systemName: "checkmark.circle.fill")
                            .bold()
                            .frame(height: 21)
                            .foregroundColor(.green)
                        : Image(systemName: "circle")
                            .bold()
                            .frame(height: 21)
                            .foregroundColor(.black)
               
                         
                        Text(item.cat)
                            .foregroundColor(.black)
                        
                        Spacer()
                    }.offset(x:70)
                }
                
                }.padding(-2)
                }.position(x:14,y:90)
        }
        .frame(width: 155, height:180)
        .position(x:130,y: isSFVisible ? (isSFVisible2 ? 410 : 190) : (isSFVisible2 ? 410 : 140))
        .offset(x:-24,y: isSFVisible ? 0 : -15)
        .animation(.easeIn(duration: 1.0), value: isSFVisible)
        .animation(.easeIn(duration: 1.0), value: isSFVisible2)
        .opacity(isSFVisible ? 1:0)
        .animation(.easeOut(duration: 1.0), value: isSFVisible)
        .animation(.easeOut(duration: 1.0), value: isSFVisible2)
    }
}









struct FoodSideBar_Previews: PreviewProvider {
    static var previews: some View {
        FoodSidebar(backBut: Binding.constant(true), isSidebarVisible: Binding.constant(true), barsearchTerm: Binding.constant(""))
    }
}










































/*
ZStack{
    Image(systemName: "triangle.righthalf.filled")
        .foregroundColor(.red)
        .rotationEffect(.degrees(rotate2D ? 180 : 90))
        .animation(.easeInOut(duration: 1), value: rotate2D)
}.onAppear{
    rotate2D.toggle()
}
*/

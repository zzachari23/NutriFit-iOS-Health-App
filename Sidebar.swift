//
//  Sidebar.swift
//  Body
//
//  Created by Family on 10/22/22.
//
import SwiftUI
import AVFoundation


// Enum types for exercise equipment and difficulty levels
enum barTypes {
    
    case beg,  int, adv, gym, home, dumbell, barbell, bands, kettlebell, machine, cable, nothingE, nothing

    var searchT: String {
        switch self {
        case .beg: return "Beginner"
        case .int: return "Intermediate"
        case .adv: return "Advanced"
        case .gym: return "Gym"
        case .home: return "Home"
        case .dumbell: return "Dumbbell"
        case .barbell: return "Barbell"
        case .bands: return "Bands"
        case .kettlebell: return "Kettlebell"
        case .machine: return "Machine"
        case .cable: return "Cables"
        case .nothingE: return "No Equipment"
        case .nothing: return "Nothing"
        }
    }
    
}


struct Sidebar: View {
    @State private var slider: Double = 0.0
    @Binding var backbutton: Bool
    @Binding var isSidebarVisible: Bool
    @Binding var barsearchTerm: String
    @State var moveAlongCircle: Bool = false
    @State private var isSF: Bool = false
    @State private var isSF2: Bool = false
    @State private var isSF3: Bool = false
   
    

    
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
                backbutton.toggle()
            }
            
            HStack(alignment: .top) {
                ZStack(alignment: .top) {
                    Color.white
                    
                    HStack{
                        Text("Filter")
                            .font(.custom(
                                    "AmericanTypewriter",
                                    fixedSize: 30))
                            .foregroundColor(.red)
                    }.offset(x:-70,y:60)
                    
                    
                    
                    
                    VStack{
                        dropdown(searchBar: $barsearchTerm, isSFVisible: isSF)
                    }
                    .position(x:150,y:200)
                    
                    VStack{
                        dropdown2(searchBar: $barsearchTerm, isSFVisible: isSF2, isSFVisible2: isSF)
                    }
                    .position(x:150, y: 500)
                    
                    VStack{
                        dropdown3(searchBar: $barsearchTerm, isSFVisible: isSF3, isSFVisible2: isSF, isSFVisible3: isSF2)
                    }
                    .position(x:150, y: 520)
                    
                    
                   
                    
                    
                    HStack {
                        Button(action:{
                            moveAlongCircle.toggle()
                            isSF.toggle()
                            AudioServicesPlaySystemSound(1104)
                        }){
                            HStack{
                                Image(systemName: "seal.fill")
                                    .foregroundColor(.black)
                            }
                            .rotationEffect(.degrees(moveAlongCircle ? 360 : 0))
                            .animation(.easeIn(duration: 1.0), value: moveAlongCircle)
                        }
                        
                        
                        
                        Text("Difficulty")
                            .bold()
                    }
                    .padding(.top, 100)
                    .padding(.horizontal, 20)
                    .position(x:70, y:60)
                    
                    
                    
                    HStack {
                        Button(action:{
                            moveAlongCircle.toggle()
                            isSF2.toggle()
                            AudioServicesPlaySystemSound(1104)
                        }){
                            HStack{
                                Image(systemName: "seal.fill")
                                    .foregroundColor(.black)
                            }
                            .rotationEffect(.degrees(moveAlongCircle ? 360 : 0))
                            .animation(.easeIn(duration: 1.0), value: moveAlongCircle)
                          
                            
                        }
                    
                        Text("Type")
                            .bold()
                            .animation(.easeIn(duration: 1.0), value: moveAlongCircle)
              
                        
                    }
                    .position(x:53, y:140)
                    .offset(y: isSF ? 124 : (isSF2 ? 0 : 0))
                    .animation(.default, value: moveAlongCircle)
                    
                    
                    HStack {
                        Button(action:{
                            moveAlongCircle.toggle()
                            isSF3.toggle()
                            AudioServicesPlaySystemSound(1104)
                        }){
                            HStack{
                                Image(systemName: "seal.fill")
                                    .foregroundColor(.black)
                            }
                            .rotationEffect(.degrees(moveAlongCircle ? 360 : 0))
                            .animation(.easeIn(duration: 1.0), value: moveAlongCircle)
                          
                            
                        }
                    
                        Text("Equipment")
                            .bold()
                            .animation(.easeIn(duration: 1.0), value: moveAlongCircle)
              
                        
                    }
                    .position(x:78, y:170)
                    .offset(y: isSF ? (isSF2 ? 220 : 124): (isSF2 ? 110 : 0))
                    .animation(.default, value: moveAlongCircle)
                    
                    

                    
                    
                    
                    
                    
                }
                .frame(width: sideBarWidth)
                .offset(x: isSidebarVisible ? 0 : -sideBarWidth)
                .animation(.default, value: isSidebarVisible)
                
                
                Spacer()
            }
            
            VStack {
                Slider(value: $slider, in: 0...30, onEditingChanged: {_ in 
                    barsearchTerm = String(Int(slider))
                })
                       .frame(width: 130)
                       .accentColor(.red)
                       .animation(.easeIn(duration: 1.0), value: moveAlongCircle)
                        Text("Time:" + " \(Int(slider))" + " minutes")
                          .bold()
                       .animation(.easeIn(duration: 1.0), value: moveAlongCircle)
                    
            }.offset(x:-110, y: isSF ? (isSF2 ? (isSF3 ? 220 : 20) : -80) : (isSF2 ? -95: (isSF3 ? -20 : -200 )))
             .animation(.default, value: moveAlongCircle)
             .simultaneousGesture(TapGesture().onEnded{
                 AudioServicesPlaySystemSound(1104)
             })
            
       
            
        }
        .edgesIgnoringSafeArea(.all)
        
    }
}


struct dropdown: View {
    
    @Binding var searchBar: String
    var isSFVisible: Bool
    var bgColor: Color =  Color.red
    let difList: [barTypes] = [.beg, .int, .adv]
    @State var selectedType: barTypes = barTypes.nothing


    var body: some View {
        ZStack{
            bgColor
        

         VStack{
             ForEach(difList, id: \.self)
             { item in
        
             Button(action:{
                 
                 selectedType = item
                 searchBar = item.searchT
                 AudioServicesPlaySystemSound(1104)
    
             }){
                 HStack{
                             selectedType == item ?
                             Image(systemName: "x.square.fill")
                                 .bold()
                                 .frame(height: 21)
                                 .foregroundColor(.black)
                             : Image(systemName: "square.fill")
                                 .bold()
                                 .frame(height: 21)
                                 .foregroundColor(.white)
                      
                     Text(item.searchT)
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



struct dropdown2: View {
    
    @Binding var searchBar: String
    var isSFVisible: Bool
    var isSFVisible2: Bool
    var bgColor: Color =  Color.red
    let difList: [barTypes] = [.gym, .home]
    @State var selectedType: barTypes = barTypes.nothing


    var body: some View {
        ZStack{
            bgColor
        
            VStack{
                ForEach(difList, id: \.self)
                { item in
           
                Button(action:{
                    
                    selectedType = item
                    searchBar = item.searchT
                    AudioServicesPlaySystemSound(1104)
       
                }){
                    HStack{
                                selectedType == item ?
                                Image(systemName: "x.square.fill")
                                    .bold()
                                    .frame(height: 21)
                                    .foregroundColor(.black)
                                : Image(systemName: "square.fill")
                                    .bold()
                                    .frame(height: 21)
                                    .foregroundColor(.white)
                         
                        Text(item.searchT)
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





struct dropdown3: View {
    
    @Binding var searchBar: String
    var isSFVisible: Bool
    var isSFVisible2: Bool
    var isSFVisible3: Bool
    var bgColor: Color =  Color.red
    let difList: [barTypes] = [.dumbell, .barbell, .bands, .kettlebell, .machine, .cable, .nothingE]
    @State var selectedType: barTypes = barTypes.nothing


    var body: some View {
        ZStack{
            bgColor
        
            VStack{
                ForEach(difList, id: \.self)
                { item in
           
                Button(action:{
                    
                    selectedType = item
                    searchBar = item.searchT
                    AudioServicesPlaySystemSound(1104)
       
                }){
                    HStack{
                                selectedType == item ?
                                Image(systemName: "x.square.fill")
                                    .bold()
                                    .frame(height: 21)
                                    .foregroundColor(.black)
                                : Image(systemName: "square.fill")
                                    .bold()
                                    .frame(height: 21)
                                    .foregroundColor(.white)
                         
                        Text(item.searchT)
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






























struct Sidebar_Previews: PreviewProvider {
    static var previews: some View {
        Sidebar(backbutton: Binding.constant(true), isSidebarVisible: Binding.constant(true), barsearchTerm: Binding.constant(""))
    }
}


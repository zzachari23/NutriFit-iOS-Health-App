//
//  CalorieDisplayView.swift
//  Body
//
//  Created by Family on 10/31/22.
//

import SwiftUI


enum Types{
    
    case mw, mwl, wl, ewl

    
    var name: String {
        switch self {
        case .mw: return "Maintain Weight"
        case .mwl: return "Mild Weight Loss"
        case .wl: return "Weight Loss"
        case .ewl: return "Extreme Weight\n           Loss"
        }
    }
    
    var weightDrop: String {
        switch self {
        case .mw: return "0.0 lb/week"
        case .mwl: return "0.5 lb/week"
        case .wl: return "1.0 lb/week"
        case .ewl: return "2.0 lb/week"
        }
    }
    
    
    var percentage: String {
        switch self {
        case .mw: return "100%"
        case .mwl: return "90%"
        case .wl: return "80%"
        case .ewl: return "61%"
        }
    }
    
    var unit: String {
        switch self {
        case .mw: return "Calories/day"
        case .mwl: return "Calories/day"
        case .wl: return "Calories/day"
        case .ewl: return "Calories/day"
        }
    }
    
    
}



struct CalorieDisplayView: View {
    
    
    @Binding var calories: Int
    
    let type: [Types] = [.mw, .mwl, .wl, .ewl]
  
   
    func getType(_ item: Types) -> Int {
        var calFin: Int = 0
        let cal: Double = Double(calories)
        switch item {
        case .mw: calFin = calories
        case .mwl: calFin = Int((cal * 0.90))
        case .wl: calFin =  Int((cal * 0.80))
        case .ewl: calFin = Int((cal * 0.61))
        }
        return calFin
    }
    
    
    var body: some View {
        
        
        ZStack{
    
            VStack{
                ForEach(type, id: \.self)
                { item in
    
                    ZStack{
                        
                        
                        
                        Rectangle()
                            .strokeBorder(.black, lineWidth: 5)
                            .background(.red)
                            .cornerRadius(10)
                            .frame(width: 300, height: 176)
                        
                     
                        HStack(){
                            
                            
                            VStack{
                                Text(item.name)
                                    .bold()
                                    .font(.system(size: 20))
                                Text(item.weightDrop)
                                Text(item.percentage)
                                Text("\(getType(item)) " + item.unit)
                                
                                
                                HStack{
                                    Text("\(getType(item))")
                                        .background(
                                            Circle()
                                                .strokeBorder(.black, lineWidth: 3)
                                                .background(Circle().fill(.white))
                                                .font(.system(size: 20))
                                                .frame(width: 70, height: 60)
                                        )
                                    
                                }
                                
                                .padding(12)
                                
                            }
                            
                            .padding(16)
                        }
                        
                        
                        
                    }
                  
                }.padding(3)

            }
            
        }
    }
    
    
}


struct CalorieDisplayView_Previews: PreviewProvider {
    static var previews: some View {
        CalorieDisplayView(calories: Binding.constant(0))
    }
}

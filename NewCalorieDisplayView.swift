//
//  NewCalorieDisplayView.swift
//  NutriFit
//
//  Created by Family on 11/20/22.
//

import SwiftUI

struct NewCalorieDisplayView: View {
    
    @Binding var caloriesValue: Int
    @State var progressValue1: Float = 1.0
    @State var progressValue2: Float = 0.9
    @State var progressValue3: Float = 0.8
    @State var progressValue4: Float = 0.61
    
    var body: some View {
        
        ScrollView{
            VStack(spacing: 47) {
                ProgressBar(progress: self.$progressValue1, type: Types.mw, calories: caloriesValue)
                    .frame(width: 150.0, height: 150.0)
                    .padding(40.0)
                ProgressBar(progress: self.$progressValue2, type: Types.mwl, calories: caloriesValue)
                    .frame(width: 150.0, height: 150.0)
                    .padding(40.0)
                ProgressBar(progress: self.$progressValue3, type: Types.wl, calories: caloriesValue)
                    .frame(width: 150.0, height: 150.0)
                    .padding(40.0)
                ProgressBar(progress: self.$progressValue4, type: Types.ewl, calories: caloriesValue)
                    .frame(width: 150.0, height: 150.0)
                    .padding(40.0)
            }.offset(y:20)
            .frame(maxWidth: .infinity)
        }
     
    }
}

struct ProgressBar: View {
    
    @Binding var progress: Float
    var type: Types
    var calories: Int
    @State var animate: Bool = false
    @State var display: Float = 0.0
   
    
    
    
    
    func getType(_ item: Types) -> Int {
        var calFin: Int = 0
        let cal: Double = Double(calories)
        switch item {
        case .mw: calFin = Int(calories)
        case .mwl: calFin = Int((cal * 0.90))
        case .wl: calFin =  Int((cal * 0.80))
        case .ewl: calFin = Int((cal * 0.61))
        }
        return calFin
    }
    
    
    
    var body: some View {
        
        ZStack {
            Circle()
                .stroke(lineWidth: 35.0)
                .opacity(0.3)
                .foregroundColor(.white)
                .shadow(color: .black, radius: 10)
                .frame(width: 1000, height: 225)
    
            Circle()
                .trim(from: 0.0, to: CGFloat(display))
                .stroke(style: StrokeStyle(lineWidth: 21.0, lineCap: .round, lineJoin:.round))
                .foregroundColor(Color.red)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.easeIn(duration: 5), value: animate)
          
        
        
            VStack{
                
                Text("\(type.name)")
                Text("\(type.weightDrop)")
                Text("\(type.percentage)")
                Text("\(getType(type))")
                    .font(.largeTitle)
                    .bold()
                Text("\(type.unit)")
                 
            }
        } .onAppear {
            DispatchQueue.main.async {
                    display = progress
                    animate.toggle()
            }
        }
    
    }
}


struct NewCalorieDisplayView_Previews: PreviewProvider {
    static var previews: some View {
        NewCalorieDisplayView(caloriesValue: Binding.constant(0))
    }
}

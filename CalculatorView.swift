//
//  GymView.swift
//  Body
//
//  Created by Family on 10/14/22.
//

import SwiftUI



struct OvalTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .background(LinearGradient(gradient: Gradient(colors: [Color.white, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(20)
            .shadow(color: .gray, radius: 10)
    }
}

struct CalculatorView: View {
    
    
    @State private var backBut: Bool = false
    
    
    @State private var selection = "Activity Level:"
    let activity = ["Basic Metabolic Rate (BMR)","Sedentary", "Lightly Active", "Moderately Active", "Active", "Very Active"]
    
    @State private var age = ""
    @State private var feet = ""
    @State private var inch = ""
    @State private var weight = ""
    @State private var male = false
    @State private var female = false
    @State private var male2 = false
    @State private var female2 = false
    @State var caloriesDisplay = 0
    @State var color = Color.white
    @State var colorf = Color.white
    
    @State var invalidInputs: Bool = false
    @State var invalidAge: Bool = false
    @State var invalidHeight: Bool = false
    @State var invalidWeight: Bool = false
    
    
    func changeColor()
    {
        if (male == true && female == false) {
            color = Color.red
            colorf = Color.white
            male2 = true
            female2 = false
            male = false
            
        }
        else if (male == false && female == true){
            colorf = Color.red
            color = Color.white
            female2 = true
            male2 = false
            female = false
        }
        
    }
    
    func agefunc(){
        if (((Double(age)!) < 15 || (Double(age)!) > 80 || (Double(age)) == nil)){
            invalidAge = true
        }
    }
    
    func feetfunc(){
        if (((Double(feet)!) < 4 || (Double(feet)!) > 7 || (Double(feet)) == nil)) {
            invalidHeight = true
        }
    }
    
    func inchfunc(){
        if ( ((Double(inch)!) < 0 || (Double(inch)!) > 12 || (Double(inch)) == nil)) {
            invalidHeight = true
        }
    }
    
    func weightfunc(){
        if (((Double(weight)!) < 80 || (Double(weight)!) > 600 || (Double(weight)) == nil)) {
            invalidWeight = true
        }
    }
    
  
    
    func calculator(){
        
        var weightNum:Double = 0.0
        var heightNum:Double = 0.0
        var calories:Int = 0
        var activityMultipler: Double = 0.0
        
        
        if age == "" || feet == "" || inch == "" || weight == "" {
            
            invalidInputs = true 
            
        } else {
            
            
            
            if (((Double(age)!) < 15 || (Double(age)!) > 80 || (Double(age)) == nil)){
                
                
                invalidAge = true
                invalidInputs = true
                feetfunc()
                inchfunc()
                weightfunc()
                
                
                
            } else if (((Double(feet)!) < 4 || (Double(feet)!) > 7 || (Double(feet)) == nil)) {
                
                invalidHeight = true
                invalidInputs = true
                agefunc()
                inchfunc()
                weightfunc()
                
                
                
                
                
            } else if ( ((Double(inch)!) < 0 || (Double(inch)!) > 12 || (Double(inch)) == nil)) {
                
                invalidHeight = true
                invalidInputs = true
                agefunc()
                feetfunc()
                weightfunc()
                
                
                
            } else if (((Double(weight)!) < 80 || (Double(weight)!) > 600 || (Double(weight)) == nil)) {
                
                invalidWeight = true
                invalidInputs = true
                agefunc()
                feetfunc()
                inchfunc()
                
            } else {
                
                invalidAge = false
                invalidHeight = false
                invalidWeight = false
                invalidInputs = false
                
                
                weightNum += Double(weight) ?? 0 / 2.2046
                heightNum += (Double(feet) ?? 0 * 12.0 + (Double(inch) ?? 0)) * 2.54
                
                
                
                switch selection {
                    
                case "Sedentary":
                    activityMultipler = 1.2
                case "Lightly Active":
                    activityMultipler = 1.375
                case "Moderately Active":
                    activityMultipler = 1.55
                case "Active":
                    activityMultipler = 1.725
                case "Very Active":
                    activityMultipler = 1.9
                default:
                    activityMultipler = 1.0
                    
                }
                
                if male2 == true {
                    calories += Int(round(activityMultipler * ((10 * weightNum) + (6.25 * heightNum) - (5 * (Double(age) ?? 0)) + 5)))
                }
                else if female2 == true{
                    calories += Int(round(activityMultipler * ((10 * weightNum) + (6.25 * heightNum) - (5 * (Double(age) ?? 0)) - 161)))
                }
                
                
                if Double(weight) != nil || Double(feet) != nil || Double(inch) != nil {
                    caloriesDisplay = calories
                } else {
                    caloriesDisplay = 0
                }
                
            }
            
        }
    }
    
    

    
    var body: some View {
        
        
        
        ZStack{
            
            
            HStack{
                Text("Calorie Calculator")
                    .bold()
                    .foregroundColor(.white)
                    .frame(width: 120, height: 50)
                    .background(Color.red)
                    .cornerRadius(20)
                    .font(.system(size: 20))
            
            }.position(x:100,y:30)
            
            
            HStack{
                
                NavigationLink(destination: FoodGroupsView(bac: $backBut).navigationBarBackButtonHidden(backBut)
                ){
                    Text("FOOD")
                        .bold()
                        .foregroundColor(.white)
                        .frame(width: 100, height: 50)
                        .background(Color.red)
                        .cornerRadius(20)
                        .font(.system(size: 20))
                }
                
            }.position(x:315, y:30)
            
            
            
            
            HStack(spacing: -6) {
                Text("Activity Level:")
                    .bold()
                
                Picker("Select an activity level", selection: $selection) {
                    ForEach(activity, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.menu)
            }.position(x:200, y:615)
            
            
            
            HStack{
                Button(action:{
                    male = true
                    changeColor()
                })
                {
                    Circle()
                        .strokeBorder(.black, lineWidth: 3)
                        .background(Circle().fill(color))
                        .font(.system(size: 18))
                        .frame(width: 33, height: 40)
                }
                
            }.position(x:230,y:120)
            
            
            HStack{
                
                Button(action: {
                    female = true
                    changeColor()
                })
                {
                    Circle()
                        .strokeBorder(.black, lineWidth: 3)
                        .background(Circle().fill(colorf))
                        .font(.system(size: 18))
                        .frame(width: 33, height: 40)
                }
                
            }.position(x:360,y:120)
            
            
            VStack{
                
                HStack(spacing: 70){
                    Text("Sex:")
                        .bold()
                        .font(.system(size: 20))
                    Text("Male")
                        .bold()
                        .font(.system(size: 20))
                    Text("Female")
                        .bold()
                        .font(.system(size: 20))
                    
                }
                
            }.position(x:189,y:120)
            
            VStack{
                    Text("Error: Invalid Input")
                    .offset(y:-60)
                    .opacity(invalidAge ? 1 : 0)
                    Text("Error: Invalid Input")
                    .offset(y:50)
                    .opacity(invalidHeight ? 1 : 0)
                    Text("Error: Invalid Input")
                    .offset(y:180)
                    .opacity(invalidWeight ? 1 : 0)
                    
            }.offset(x:-70).bold().foregroundColor(.red)
            
            

            
            Group{
                VStack {
                    
                    Text("Enter Age")
                        .bold()
                    TextField("ages 15-80...", text: $age)
                    
                }
                .textFieldStyle(OvalTextFieldStyle())
                .frame(width: 300)
                .position(x:195 , y:220)
                
                
                
                
                
                VStack {
                    Text("Enter Height")
                        .bold()
                    HStack{
                        TextField("feet...", text: $feet)
                        TextField("inches...", text: $inch)
                    }
                    
                }
                .textFieldStyle(OvalTextFieldStyle())
                .frame(width: 300)
                .position(x:195 , y:350)
                
                
                VStack {
                    Text("Enter Weight")
                        .bold()
                    TextField("pounds...", text: $weight)
                }
                .textFieldStyle(OvalTextFieldStyle())
                .frame(width: 300)
                .position(x:195 , y:500)
                
                
                
                
            }
            
            
            //CalorieDisplayView(calories: $caloriesDisplay)
            
            
            VStack{
                if invalidInputs{
                    calculatorLabel
                } else {
                    NavigationLink(destination: NewCalorieDisplayView(caloriesValue: $caloriesDisplay)){
                        calculatorLabel
                    }
                }
            }.position(x:200,y:700).simultaneousGesture(TapGesture().onEnded{
         
                calculator()
                age = ""
                feet = ""
                inch = ""
                weight = ""
            })
            
            
            
        }
        
    }
    

    var calculatorLabel: some View {
    Text("Calculate")
        .bold()
        .foregroundColor(.white)
        .frame(width: 300, height: 50)
        .background(Color.red)
        .cornerRadius(20)
        .font(.system(size: 20))
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}

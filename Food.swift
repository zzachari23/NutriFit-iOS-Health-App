//
//  Food.swift
//  Body
//
//  Created by Family on 10/18/22.
//

import Foundation
import SwiftUI

struct FoodProperties: Identifiable {
    let id = UUID()
    let image: String
    let title: String
    let typeColor: Color
    let foodItem: FoodItemProperties?
    
    struct FoodItemProperties {
    
        let serving_size: String
        let calories: String
        let fat: String
        let carbs: String
        let protein: String
        let macrotype: String
        
    }
}


struct FoodList {
    
    static let foods: [FoodProperties] = [
        FoodProperties(
            image: "salmon",
            title: "Salmon",
            typeColor: Color.red,
            foodItem: FoodProperties.FoodItemProperties (
                serving_size: "Per 3 ounces",
                calories: "121 calories",
                fat: "5.4 grams",
                carbs: "0 grams",
                protein: "17 grams",
                macrotype: "Protein"
            )
            
        ) ,
        
        
        
        FoodProperties(
            image: "rice",
            title: "Rice",
            typeColor: Color.brown,
            foodItem: FoodProperties.FoodItemProperties (
                serving_size: "1 Cup (158g)",
                calories: "206 calories",
                fat: "0.4 grams",
                carbs: "45 grams",
                protein: "4.3 grams",
                macrotype: "Carbohydrate"
            )
        
        
       
        ) ,
        
        
        FoodProperties(
            image: "spinach",
            title: "Spinach",
            typeColor: Color.green,
            foodItem: nil
        ),
        
        FoodProperties(
            image: "eggs",
            title: "Eggs",
            typeColor: Color.red,
            foodItem: FoodProperties.FoodItemProperties (
                serving_size: "1 Large (50g)",
                calories: "78 calories",
                fat: "5 grams",
                carbs: "0.6 grams",
                protein: "6 grams",
                macrotype: "Protein"
            )
       
        ),
        
        
        FoodProperties(
            image: "strawberry",
            title: "Strawberries",
            typeColor: Color.orange,
            foodItem: nil
        ),
        
        FoodProperties(
            image: "butterchicken",
            title: "Butter Chicken",
            typeColor: Color.purple,
            foodItem: nil
        ),
        
        FoodProperties(
            image: "vitamind",
            title: "Vitamin D",
            typeColor: Color.yellow,
            foodItem: nil
        ),
        
        FoodProperties(
            image: "vitaminc",
            title: "Vitamin C",
            typeColor: Color.yellow,
            foodItem: nil
        ),
        
        FoodProperties(
            image: "keto",
            title: "Keto Diet Foods",
            typeColor: Color(hex: "EFD8CF"),
            foodItem: FoodProperties.FoodItemProperties (
                serving_size: "1 Large (50g)",
                calories: "78 calories",
                fat: "5 grams",
                carbs: "0.6 grams",
                protein: "6 grams",
                macrotype: "Keto"
            )
        )


        
    ]
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    /*
    static let proteins: [FoodProperties] = [
    
        FoodProperties(
            image: "salmon",
            title: "Salmon",
            foodItem: nil),
        
        FoodProperties(
            image: "eggs",
            title: "Eggs",
            foodItem: nil)
        
    
    ]
    */
    
    
}

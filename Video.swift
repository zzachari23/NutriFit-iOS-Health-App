//
//  Video.swift
//  Body
//
//  Created by Family on 10/14/22.
//

import Foundation
import SwiftUI
import AVKit

struct ExerciseProperties: Identifiable {
    let id = UUID()
    let image: String
    let title: String
    let url: URL
    let plan: String
    let difficulty: String
    let instructions: String
    let nums: [String]
    let time: String
    let type: String
    let equipment: String
    let video: AVPlayer
}

struct ExerciseList {
    
    static let chestExercises: [ExerciseProperties] = [
    
        ExerciseProperties(
            image: "Incline BenchPress",
            title: "Incline Bench Press",
            url: URL(string: "https://youtu.be/xeIWmNSQ1BM")!,
            plan: " Set 1:  6 reps \n Set 2:  6 reps \n Set 3:  6 reps",
            difficulty: "Advanced",
            instructions: "Position the bench between 30 and 45 degrees\n\n" + "Lay flat on the bench with your feet on the ground.\nWith straight arms unrack the bar\n\n" + "Lower the bar to your mid chest\n\n" + "Raise the bar (slowly and controlled) until you've\nlocked your elbows\n",
             nums: ["1", "2", "3", "4"],
            time: "15 minutes",
            type: "Gym",
            equipment: "Barbell",
            video:  AVPlayer(url:  URL(string: "https://musclewiki.com/media/uploads/videos/branded/male-barbell-incline-bench-press-side.mp4")!)),
        
        
        ExerciseProperties(
            image: "Pushup Medium",
            title: "Pushups",
            url: URL(string: "https://youtu.be/MO10KOoQx5E")!,
            plan:"Set 1: 5 reps \n Set 2: 5 reps \n Set 3: 5 reps \n Set 4: 5 reps \n Set 5: 5 reps",
            difficulty: "Beginner",
            instructions: "NA",
            nums: ["1", "2", "3", "4"],
            time: "5 minutes",
            type: "Home",
            equipment: "",
            video:  AVPlayer(url:  URL(string: "https://bit.ly/swswift")!)
            ),
        
        
        ExerciseProperties(
            image: "BenchPress",
            title: "Bench Press",
            url: URL(string: "https://youtu.be/FHn3eoWpFHs")!,
            plan:"Set 1: 5 reps \n Set 2: 5 reps \n Set 3: 5 reps \n Set 4: 5 reps \n Set 5: 5 reps",
            difficulty: "Beginner",
            instructions: "NA",
            nums: ["1", "2", "3", "4"],
            time: "20 minutes",
            type: "Gym",
            equipment: "Barbell",
            video: AVPlayer(url:  URL(string: "https://bit.ly/swswift")!)
            ),
        ExerciseProperties(
            image: "Cable Chest Press",
            title: "Chest Cable Press",
            url: URL(string: "https://youtu.be/EVjJq3nOwRU")!,
            plan:"Set 1: 10 reps \n Set 2: 10 reps \n Set 3: 10 reps",
            difficulty: "Intermediate",
            instructions: "NA",
            nums: ["1", "2", "3", "4"],
            time: "30 minutes",
            type: "Gym",
            equipment: "Cable",
            video:  AVPlayer(url:  URL(string: "https://bit.ly/swswift")!)
        ),
        

        ExerciseProperties(
            image: "Chest Dumbell Press",
            title: "Chest Dumbell Press",
            url: URL(string: "https://youtu.be/VmB1G1K7v94")!,
            plan:"Set 1: 10 reps \n Set 2: 10 reps \n Set 3: 10 reps",
            difficulty: "Intermediate",
            instructions: "NA",
            nums: ["1", "2", "3", "4"],
            time: "10 minutes",
            type: "Home",
            equipment: "Dumbell",
            video:  AVPlayer(url:  URL(string: "https://bit.ly/swswift")!)
             ),
        
        
        ExerciseProperties(
            image: "Chest Incline Dumbell Press",
            title: "Chest Incline\nDumbell Press",
            url: URL(string: "https://youtu.be/07Bcqtib4FM")!,
            plan:"Set 1: 10 reps \n Set 2: 10 reps \n Set 3: 10 reps",
            difficulty: "Advanced",
            instructions: "NA",
            nums: ["1", "2", "3", "4"],
            time: "10 minutes",
            type: "Home",
            equipment: "Dumbell",
            video:  AVPlayer(url:  URL(string: "https://bit.ly/swswift")!)),
        
        ExerciseProperties(
            image: "Chest Dips",
            title: "Chest Dips",
            url: URL(string: "https://youtu.be/yN6Q1UI_xkE")!,
            plan:"Set 1: 10 reps \n Set 2: 10 reps \n Set 3: 10 reps",
            difficulty: "Beginner",
            instructions: "NA",
            nums: ["1", "2", "3", "4"],
            time: "20 minutes",
            type: "Gym",
            equipment: "",
            video:  AVPlayer(url:  URL(string: "https://bit.ly/swswift")!))
    
    ]
    
    
    
}


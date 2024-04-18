//
//  Meal.swift
//  FetchiOSTakeHome
//
//  Created by Shreyak Godala on 17/04/24.
//

import Foundation

struct Meal: Codable, Identifiable {
    var id: String {
        idMeal
    }
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
}

struct MealResults: Codable {
    var meals: [Meal]
}

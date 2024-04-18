//
//  Recipe.swift
//  FetchiOSTakeHome
//
//  Created by Shreyak Godala on 17/04/24.
//

import Foundation

struct Recipe: Codable, Identifiable {
    var id: String {
        idMeal
    }
    let idMeal: String
    let strMeal: String?
    let strDrinkAlternate: String?
    let strCategory: String?
    let strArea: String?
    let strInstructions: String?
    let strMealThumb: String?
    let strTags: String?
    let strYoutube: String?
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    let strIngredient16: String?
    let strIngredient17: String?
    let strIngredient18: String?
    let strIngredient19: String?
    let strIngredient20: String?
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
    let strMeasure8: String?
    let strMeasure9: String?
    let strMeasure10: String?
    let strMeasure11: String?
    let strMeasure12: String?
    let strMeasure13: String?
    let strMeasure14: String?
    let strMeasure15: String?
    let strMeasure16: String?
    let strMeasure17: String?
    let strMeasure18: String?
    let strMeasure19: String?
    let strMeasure20: String?
    let strSource: String?
    let strImageSource: String?
    let strCreativeCommonsConfirmed: String?
    let dateModified: String?
    
    var ingredientDict: [String:String] {
        var dict: [String: String] = [:]
                
        if let ingredient1 = strIngredient1, !ingredient1.isEmpty, let measure1 = strMeasure1 {
            dict[ingredient1] = measure1
        }
        if let ingredient2 = strIngredient2, !ingredient2.isEmpty, let measure2 = strMeasure2 {
            dict[ingredient2] = measure2
        }
        if let ingredient3 = strIngredient3, !ingredient3.isEmpty, let measure3 = strMeasure3 {
            dict[ingredient3] = measure3
        }
        if let ingredient4 = strIngredient4, !ingredient4.isEmpty, let measure4 = strMeasure4 {
            dict[ingredient4] = measure4
        }
        if let ingredient5 = strIngredient5, !ingredient5.isEmpty, let measure5 = strMeasure5 {
            dict[ingredient5] = measure5
        }
        if let ingredient6 = strIngredient6, !ingredient6.isEmpty, let measure6 = strMeasure6 {
            dict[ingredient6] = measure6
        }
        if let ingredient7 = strIngredient7, !ingredient7.isEmpty, let measure7 = strMeasure7 {
            dict[ingredient7] = measure7
        }
        if let ingredient8 = strIngredient8, !ingredient8.isEmpty, let measure8 = strMeasure8 {
            dict[ingredient8] = measure8
        }
        if let ingredient9 = strIngredient9, !ingredient9.isEmpty, let measure9 = strMeasure9 {
            dict[ingredient9] = measure9
        }
        if let ingredient10 = strIngredient10, !ingredient10.isEmpty, let measure10 = strMeasure10 {
            dict[ingredient10] = measure10
        }
        return dict
    }
}

struct RecipeDetail: Codable {
    let meals: [Recipe]
}


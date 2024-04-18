//
//  APIService.swift
//  FetchiOSTakeHome
//
//  Created by Shreyak Godala on 17/04/24.
//

import Foundation

struct APIService {
    
    enum APIError: Error {
        case BadURL
        case BadResponse(statusCode: Int)
        case RecipeNotFound
    }
    
    static func fetchRecipeList() async throws -> [Meal] {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")
        else {
            throw APIError.BadURL
        }
                
        let (data,response) = try await URLSession.shared.data(from:url)

        if let statusCode = (response as? HTTPURLResponse)?.statusCode, !(200..<299 ~= statusCode) {
            throw APIError.BadResponse(statusCode: statusCode)
        }
        let result = try JSONDecoder().decode(MealResults.self, from: data)
        return result.meals
    }
    
    static func fetchRecipeDetail(mealId: String)  async throws -> Recipe{
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(mealId)") else {
            throw APIError.BadURL
        }
        let (data,response) = try await URLSession.shared.data(from: url)
        if let statusCode = (response as? HTTPURLResponse)?.statusCode, !(200..<299 ~= statusCode) {
            throw APIError.BadResponse(statusCode: statusCode)
        }
        let recipeResult = try JSONDecoder().decode(RecipeDetail.self, from: data)
        if let recipe = recipeResult.meals.first {
            return recipe
        }
        throw APIError.RecipeNotFound
    }
}


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
        let result: MealResults = try await decode(urlString: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")
        return result.meals
    }
    
    static func fetchRecipeDetail(mealId: String)  async throws -> Recipe{
        let recipeResult: RecipeDetail = try await decode(urlString: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(mealId)")
        if let recipe = recipeResult.meals.first {
            return recipe
        }
        throw APIError.RecipeNotFound
    }
    
    static private func decode<T: Codable>(urlString: String) async throws -> T {
        guard let url = URL(string: urlString) else {
            throw APIError.BadURL
        }
        let (data,response) = try await URLSession.shared.data(from: url)
        if let statusCode = (response as? HTTPURLResponse)?.statusCode, !(200..<299 ~= statusCode) {
            throw APIError.BadResponse(statusCode: statusCode)
        }
        return try JSONDecoder().decode(T.self, from: data)
    }
}


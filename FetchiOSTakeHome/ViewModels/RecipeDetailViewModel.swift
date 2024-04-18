//
//  RecipeDetailViewModel.swift
//  FetchiOSTakeHome
//
//  Created by Shreyak Godala on 17/04/24.
//

import Foundation

@MainActor
class RecipeDetailViewModel: ObservableObject {
    @Published var recipe: Recipe?
    @Published var error: Error?
    private let meadId: String
    
    init(meadId: String) {
        self.meadId = meadId
        fetchRecipeDetail()
    }
    
    func fetchRecipeDetail() {
        Task {
            do {
                self.recipe = try await APIService.fetchRecipeDetail(mealId: meadId)
               
            } catch {
                self.error = error
            }
        }
    }
}


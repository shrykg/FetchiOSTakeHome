//
//  RecipeListViewModel.swift
//  FetchiOSTakeHome
//
//  Created by Shreyak Godala on 17/04/24.
//

import Foundation


@MainActor
class RecipeListViewModel: ObservableObject {
    @Published var meals: [Meal] = []
    @Published var error: Error?
    init() {
        fetchRecipeList()
    }
    
    func fetchRecipeList() {
        Task {
            do {
                self.meals = try await APIService.fetchRecipeList()
            } catch {
                self.error = error
            }
            
        }
    }
}

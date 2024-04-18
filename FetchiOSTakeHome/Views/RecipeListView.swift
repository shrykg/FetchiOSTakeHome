//
//  ContentView.swift
//  FetchiOSTakeHome
//
//  Created by Shreyak Godala on 16/04/24.
//

import SwiftUI


struct RecipeListView: View {
    
    @StateObject var vm = RecipeListViewModel()

    
    var body: some View {
        
        if let _ = vm.error {
            Text("Failed to load recipe list")
                .font(.title)
        }
        
        NavigationStack {
            GeometryReader { proxy in
                ScrollView {
                    LazyVStack(alignment: .center) {
                        ForEach(vm.meals) { meal in
                            NavigationLink {
                                RecipeDetailView(mealId: meal.idMeal)
                            } label: {
                                RecipeListRow(meal: meal, proxy: proxy)
                            }
                        }
                    }
                }.navigationTitle(Text("Desserts"))
            }
        }
       
        
    }
}



#Preview {
    RecipeListView(vm: RecipeListViewModel())
        .preferredColorScheme(.dark)
}

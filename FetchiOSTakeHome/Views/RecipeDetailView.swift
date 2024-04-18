//
//  RecipeDetailView.swift
//  FetchiOSTakeHome
//
//  Created by Shreyak Godala on 17/04/24.
//

import SwiftUI


struct RecipeDetailView: View {
    @StateObject var vm:RecipeDetailViewModel
    var mealId: String
    
    init(mealId: String) {
        self.mealId = mealId
        self._vm = .init(wrappedValue: RecipeDetailViewModel(meadId: mealId))
    }
    
    
    var body: some View {
        
        if let _ = vm.error {
            Text("Failed to load Recipe Detail")
                .font(.title)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        ScrollView {
            VStack(alignment: .leading) {
                
                if let recipe = vm.recipe {
                    if let thumbnail = recipe.strMealThumb, let url = URL(string: thumbnail) {
                        
                        AsyncImage(url: url) { image in
                            image
                                .resizable()
                                .frame(height: 300)
                                .scaledToFit()
                        } placeholder: {
                            Rectangle()
                                .frame(height: 300)
                        }
                        
                       
                    }
                    
                    if let mealName = recipe.strMeal {
                        Text(mealName)
                            .font(.title)
                            .padding()
                    }
                    
                    if let tags = recipe.strTags {
                        let tagArray = tags.components(separatedBy: ",")
                        HStack() {
                            ForEach(0..<tagArray.count, id: \.self) { num in
                                Text(tagArray[num])
                                    .padding(.horizontal)
                                    .background(Color.gray)
                                    .clipShape(RoundedRectangle(cornerRadius: 24))
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                   
                    
                    let ingredientsArray = Array(recipe.ingredientDict.keys)
                    if ingredientsArray.count > 0 {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Ingredients")
                                .font(.system(size: 24,weight: .semibold))
                            ForEach(ingredientsArray,id: \.self) { ingredient in
                                if let measure = recipe.ingredientDict[ingredient] {
                                    Text("\(measure) \(ingredient)")
                                } else {
                                    Text(ingredient)
                                }
                            }
                        }.padding()
                    }
                        
                    
                    
                    if let instructions = recipe.strInstructions {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Instructions")
                                .font(.system(size: 24,weight: .semibold))
                            Text(instructions)
                        }
                        .padding()
                    }
                    
                    
                }
            }
            
            
        }
        .navigationTitle(Text(vm.recipe?.strMeal ?? "Recipe Detail"))
        .navigationBarTitleDisplayMode(.inline)
        
        
    }
}

#Preview {
    RecipeDetailView(mealId: "52917")
        .preferredColorScheme(.dark)
}

//
//  RecipeListRow.swift
//  FetchiOSTakeHome
//
//  Created by Shreyak Godala on 17/04/24.
//

import SwiftUI

struct RecipeListRow: View {
    let meal: Meal
    let proxy: GeometryProxy

    var body: some View {
        let width = proxy.size.width - 48
        VStack {
            AsyncImage(url: URL(string: meal.strMealThumb)) { image in
                image
                    .resizable()
                    .frame(width: width, height: 200)
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            } placeholder: {
                RoundedRectangle(cornerRadius: 12)
                    .frame(width: width, height: 300)
                    .backgroundStyle(Color.red)
                    
            }
            Text(meal.strMeal)
                .font(.system(size: 24,weight: .semibold))
        }.padding()
            .foregroundStyle(Color(.label))
    }
}

#Preview {
    GeometryReader { proxy in
        RecipeListRow(meal: Meal(strMeal: "Apam balik", strMealThumb: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg", idMeal: "53049"), proxy: proxy)
    }
}

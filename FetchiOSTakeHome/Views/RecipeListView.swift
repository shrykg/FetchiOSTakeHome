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
        NavigationStack {
            GeometryReader { proxy in
                ScrollView {
                    LazyVStack(alignment: .center) {
                        ForEach(vm.meals) { meal in
                            NavigationLink {
                                Text("Destination")
                            } label: {
                                RecipeListRow(meal: meal, proxy: proxy)
                            }
                        }
                    }
                }.navigationTitle("Desserts")
            }
        }
       
        
    }
}



#Preview {
    RecipeListView(vm: RecipeListViewModel())
        .preferredColorScheme(.dark)
}

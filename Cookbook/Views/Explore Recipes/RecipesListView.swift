//
//  RecipesListView.swift
//  Cookbook
//
//  Created by Savannah on 4/29/25.
//

import SwiftUI

struct RecipesListView: View {
    @EnvironmentObject private var recipeData: RecipeData
    let category: MainInformation.Category
    
    @State private var isPresenting = false
    @State private var newRecipe = Recipe()
    
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
    var body: some View {
        NavigationView {
            List{
                ForEach(recipes) { recipe in
                    NavigationLink(recipe.mainInformation.name, destination: RecipeDetailView(recipe: recipe))
                }
                .listRowBackground(listBackgroundColor)
                .foregroundColor(listTextColor)
            }
            .navigationTitle(navigationTitle)
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {isPresenting = true},
                           label: { Image(systemName: "plus")})
                }
            })
            .sheet(isPresented: $isPresenting, content: {
                NavigationView {
                    ModifyRecipeView(recipe: $newRecipe)
                    .toolbar(content: {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Dismiss") {
                                isPresenting = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            if newRecipe.isValid {
                                Button("Add") {
                                    recipeData.add(newRecipe)
                                    isPresenting = false
                                }
                            }
                        }
                    })
                    .navigationTitle(Text("New Recipe"))
                }
            })
        }
    }
}

extension RecipesListView {
    private var recipes: [Recipe] {
        recipeData.recipes(for: category)
  }
    
    private var navigationTitle: String {
        "\(category.rawValue) Recipes"
    }
}

#Preview {
    NavigationView {
        RecipesListView(category: .breakfast)
            .environmentObject(RecipeData())
    }
}

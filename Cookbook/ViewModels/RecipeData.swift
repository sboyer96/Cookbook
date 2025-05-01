//
//  RecipeData.swift
//  Cookbook
//
//  Created by Savannah on 4/30/25.
//

import Foundation

class RecipeData: ObservableObject {
    @Published var recipe = Recipe.testRecipes
    
    func recipes(for category: MainInformation.Category) -> [Recipe] {
        var filteredRecipes = [Recipe]()
        for recipe in recipe {
            if recipe.mainInformation.category == category {
                filteredRecipes.append(recipe)
            }
        }
        return filteredRecipes
    }
}

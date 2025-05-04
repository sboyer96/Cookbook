//
//  ModifyRecipeView.swift
//  Cookbook
//
//  Created by Savannah on 5/1/25.
//

import SwiftUI

struct ModifyRecipeView: View {
    @Binding var recipe: Recipe
    var body: some View {
        Button("Fill with test data") {
            recipe.mainInformation = MainInformation(name: "test", description: "test", author: "test", category: .breakfast)
            recipe.directions = [Direction(description: "test", isOptional: false)]
            recipe.ingredients = [Ingredient(name: "test", quantity: 1.0, unit: .none)]
        }
    }
}

#Preview {
    @Previewable @State var recipe = Recipe()
    
    ModifyRecipeView(recipe: $recipe)
}

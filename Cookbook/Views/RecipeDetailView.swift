//
//  RecipeDetailView.swift
//  Cookbook
//
//  Created by Savannah on 4/30/25.
//

import SwiftUI

struct RecipeDetailView: View {
    let recipe: Recipe
    
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Author: \(recipe.mainInformation.author)")
                    Text("\(recipe.mainInformation.description)")
                }
                .font(.subheadline)
                .padding()
                Spacer()
            }
            List {
                Section(header: Text("Ingredients")) {
                    ForEach(recipe.ingredients.indices, id: \.self) { index in
                        let ingredient = recipe.ingredients[index]
                        Text(ingredient.description)
                        .foregroundColor(listTextColor)
                    }
                }
                .listRowBackground(listBackgroundColor)

                Section(header: Text("Directions")) {
                    ForEach(recipe.directions.indices, id: \.self) { index in
                        let direction = recipe.directions[index]
                        HStack {
                            Text("\(index + 1).").bold()
                            Text("\(direction.isOptional ? " (Optional) " : "")" + "\(direction.description)")
                        }
                        .foregroundColor(listTextColor)
                    }
                }
                .listRowBackground(listBackgroundColor)
            }
        }
        .navigationTitle(recipe.mainInformation.name)
    }
}

#Preview {
    @State @Previewable var recipe = Recipe.testRecipes[0]
    NavigationView {
        RecipeDetailView(recipe: recipe)
    }
}

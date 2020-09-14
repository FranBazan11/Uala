//
//  MealsData.swift
//  Uala
//
//  Created by Francisco Bazan on 9/13/20.
//  Copyright © 2020 francisco bazan. All rights reserved.
//

import Foundation

struct MealsData: Codable {
    let meals: [MealsItemsData]
}

struct MealsItemsData: Codable {
    let strMealThumb: String //Foto
    let strMeal: String //Nombre
    let strCategory: String
    let strInstructions: String
}

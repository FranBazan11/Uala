//
//  MealsManager.swift
//  Uala
//
//  Created by Francisco Bazan on 9/13/20.
//  Copyright © 2020 francisco bazan. All rights reserved.
//

import Foundation

protocol MealsManagerDelegate {
    func didUpdateMeals(_ mealsManager: MealsManager, meals: MealsData)
    func didFailWithError(error: Error)
}

struct MealsManager {
    let mealsURL = "https://www.themealdb.com/api/json/v1/1/search.php?s"
    
    var delegate : MealsManagerDelegate?
    
    func performRequest() {
        // Step 1: Create a URL
        if let url = URL(string: mealsURL){
            // Step 2: Create a URLSession
            let session = URLSession(configuration: .default)
            // Step 3: Give the session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let meals = self.parseJSON(safeData) {
                        self.delegate?.didUpdateMeals(self, meals: meals)
                        print(meals)
                    }
                }
            }
            // Step 4: Start the task
            task.resume()
        }
    }
    
    func parseJSON(_ mealsData: Data) -> MealsData? {
        let decoder = JSONDecoder()
        do {
            let decoderData = try decoder.decode(MealsData.self, from: mealsData)
            return decoderData
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}

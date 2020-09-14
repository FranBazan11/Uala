//
//  MealsViewController.swift
//  Uala
//
//  Created by francisco bazan on 9/13/20.
//  Copyright © 2020 francisco bazan. All rights reserved.
//

import UIKit

class MealsViewController: UIViewController {

    override func viewDidLoad() {
        
        var mealsManager = MealsManager()
        mealsManager.performRequest()
        
        super.viewDidLoad()
        view.backgroundColor = .red
        mealsManager.delegate = self
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MealsViewController : MealsManagerDelegate {
    func didUpdateMeals(_ mealsManager: MealsManager, meals: MealsData) {
        print(meals)
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    
}

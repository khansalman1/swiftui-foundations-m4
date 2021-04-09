//
//  RecipeModel.swift
//  recipe list app
//
//  Created by Salman Khan on 4/7/21.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        
        // Create an instance of data service and get the Data
        
        self.recipes = DataService.getLocalData()
    }
}

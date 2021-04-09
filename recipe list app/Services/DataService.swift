//
//  DataService.swift
//  recipe list app
//
//  Created by Salman Khan on 4/7/21.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Recipe] {
        
        // Parse local json file
        
        
        // Get a Url path to the Json File
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        //Check if pathString is not nil..
        guard pathString != nil else {
            return [Recipe]()
        }
        
        // Create a url object
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            // Create a data object
            let data = try Data(contentsOf: url)
            
            // Decode the data with a a json decoder
            let decoder = JSONDecoder()
            
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                // Add the unique ID
                for r in recipeData {
                    r.id = UUID()
                }
                
                // Return a recipes
                return recipeData
                
            }
            catch {
                // throw error
                print(error)
            }
           
            
        }
        catch {
            // error with getting data
            print(error)
        }
        
        return [Recipe]()
    }
}

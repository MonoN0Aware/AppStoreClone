//
//  AppStoreViewModel.swift
//  AppStoreClone
//
//  Created by Decagon on 20/08/2021.
//

import Foundation
 class Service {
    
    static let shared = Service()
    
    func fetchApps(searchTerm:String,completion: @escaping ([Result],Error?)->()) {
        
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        guard let url = URL(string: urlString) else {return}

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let err = error{
                print("Failed to fetch apps",err)
                completion([],nil)
                return
            }
            guard let data = data else {return}

            do{
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                completion(searchResult.results, nil)
            } catch {
                print("failed to decode JSON", error)
                completion([],error)
            }

        }.resume()
    }
    
    
}

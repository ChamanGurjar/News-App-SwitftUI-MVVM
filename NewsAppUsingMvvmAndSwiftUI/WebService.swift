//
//  WebService.swift
//  NewsAppUsingMvvmAndSwiftUI
//
//  Created by ChamanGurjar on 20/12/19.
//  Copyright © 2019 ChamanGurjar. All rights reserved.
//

import Foundation

class WebService {
    
    func loadTopHeadlines(url: URL, completion: @escaping ([Article]?) -> () ) {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let response = try? JSONDecoder().decode(NewsResponse.self, from: data)
            if let response = response {
                DispatchQueue.main.async {
                    completion(response.articles)
                }
            }
        }.resume()
    }
    
}

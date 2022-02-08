//
//  Network.swift
//  HarryPotter
//
//  Created by Ricardo Santana on 04/02/22.
//

import UIKit

class Network {
    
    let baseURL = "http://hp-api.herokuapp.com/api/"
    let characterEndPoint = "characters"
    
    func network(complete: ([Character]) -> Void) {
        let baseURL = "http://hp-api.herokuapp.com/api/"
        let characterEndPoint = "characters"
        
        guard let urlRequest = URL(string: "\(url)\(characterEndPoint)") else { return }
        
        let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
            if error == nil {
                guard let response = response as? HTTPURLResponse else { return }
                if response.statusCode == 200 {
                    guard let data = data else { return }
                    do {
                        let characters = try JSONDecoder().decode([Character].self, from: data)
                    }
                    catch {
                        print(error.localizedDescription)
                    }
                } else {
                    print(response.statusCode)
                }

            } else {
                print(error!)
            }
            
        })
        task.resume()
    }
}
